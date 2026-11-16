local function find_script_region(bufnr, cursor_row0)
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

    local start_line
    for i = cursor_row0, 0, -1 do
        if lines[i + 1] and lines[i + 1]:find("<script", 1, true) then
            start_line = i
            break
        end
    end
    if not start_line then
        return nil
    end

    local end_line
    for i = start_line + 1, #lines - 1 do
        if lines[i + 1] and lines[i + 1]:find("</script>", 1, true) then
            end_line = i
            break
        end
    end
    if not end_line or end_line <= start_line then
        return nil
    end

    return {
        start_line = start_line,
        end_line = end_line,
        start_tag_line = lines[start_line + 1] or "",
    }
end

local function detect_script_ft(start_tag_line)
    local lower = start_tag_line:lower()
    if lower:find('lang%s*=%s*"ts"', 1, false) or lower:find("typescript", 1, true) then
        return "typescript"
    end
    return "javascript"
end

local function compute_indent(content_lines)
    for _, l in ipairs(content_lines) do
        if l:match("%S") then
            return l:match("^(%s*)") or ""
        end
    end
    return ""
end

local function strip_indent(lines, indent)
    if indent == "" then
        return vim.deepcopy(lines)
    end
    local out = {}
    for i, l in ipairs(lines) do
        if l:sub(1, #indent) == indent then
            out[i] = l:sub(#indent + 1)
        else
            out[i] = l
        end
    end
    return out
end

local function add_indent(lines, indent)
    if indent == "" then
        return vim.deepcopy(lines)
    end
    local out = {}
    for i, l in ipairs(lines) do
        if l == "" then
            out[i] = ""
        else
            out[i] = indent .. l
        end
    end
    return out
end

local function open_inline_script_editor()
    local src_buf = vim.api.nvim_get_current_buf()
    local cursor = vim.api.nvim_win_get_cursor(0)
    local cursor_row0 = cursor[1] - 1

    local region = find_script_region(src_buf, cursor_row0)
    if not region then
        vim.notify("No <script>…</script> region found around cursor", vim.log.levels.WARN)
        return
    end

    local content = vim.api.nvim_buf_get_lines(src_buf, region.start_line + 1, region.end_line, false)
    local indent = compute_indent(content)
    local stripped = strip_indent(content, indent)
    local ft = detect_script_ft(region.start_tag_line)

    local scratch = vim.api.nvim_create_buf(false, true)
    vim.bo[scratch].bufhidden = "wipe"
    vim.bo[scratch].swapfile = false
    vim.bo[scratch].buftype = ""
    vim.bo[scratch].filetype = ft

    local tmpname = vim.fn.tempname() .. (ft == "typescript" and ".ts" or ".js")
    vim.api.nvim_buf_set_name(scratch, tmpname)

    vim.api.nvim_buf_set_lines(scratch, 0, -1, false, stripped)

    vim.b[scratch].inline_script_source_buf = src_buf
    vim.b[scratch].inline_script_start_line = region.start_line
    vim.b[scratch].inline_script_end_line = region.end_line
    vim.b[scratch].inline_script_indent = indent

    vim.api.nvim_create_autocmd("BufWritePost", {
        buffer = scratch,
        callback = function()
            local source_bufnr = vim.b.inline_script_source_buf
            if not (source_bufnr and vim.api.nvim_buf_is_valid(source_bufnr)) then
                vim.notify("Source buffer no longer valid", vim.log.levels.ERROR)
                return
            end

            local approx_row0 = vim.b.inline_script_start_line or 0
            local region = find_script_region(source_bufnr, approx_row0)
            if not region then
                vim.notify("Could not re-locate <script> region when saving inline buffer", vim.log.levels.ERROR)
                return
            end

            local indent2 = vim.b.inline_script_indent or ""

            local new_lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
            new_lines = add_indent(new_lines, indent2)

            vim.api.nvim_buf_set_lines(source_bufnr, region.start_line + 1, region.end_line, false, new_lines)
            vim.bo[source_bufnr].modified = true

            -- Update stored region lines for any subsequent writes
            vim.b.inline_script_start_line = region.start_line
            vim.b.inline_script_end_line = region.end_line
        end,
    })

    vim.cmd("split")
    vim.api.nvim_win_set_buf(0, scratch)

    -- Ensure a TypeScript/JavaScript LSP is attached to the inline buffer
    if (ft == "javascript" or ft == "typescript") and vim.fn.executable("typescript-language-server") == 1 then
        local root = vim.fs.root(scratch, { "tsconfig.json", "jsconfig.json", "package.json", ".git" }) or vim.loop.cwd()
        vim.lsp.start({
            name = "ts_ls-inline",
            cmd = { "typescript-language-server", "--stdio" },
            root_dir = root,
            single_file_support = true,
        }, { bufnr = scratch })
    end
end

vim.api.nvim_create_user_command("InlineScriptEdit", open_inline_script_editor, {})

