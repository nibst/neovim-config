local checkmate = require("checkmate");
checkmate.setup({
    style = {
        CheckmateCheckedMarker = { fg = "#7bff4f", bold = true },
        CheckmateCheckedMainContent = { fg = "#faffa1" },

        CheckmateInProgressMarker = { fg = "#00d7ff", bold = true },
        CheckmateInProgressMainContent = { fg = "#87d7ff" },

        CheckmateOnHoldMarker = { fg = "#ffaf00" },
        CheckmateOnHoldMainContent = { fg = "#d7af87" },

        CheckmateCancelledMarker = { fg = "#e06c75" },
        CheckmateCancelledMainContent = { fg = "#585858", strikethrough = true },
    },
    files = {
        "*.md", -- Any markdown file (basename matching)
    },

    todo_states = {
        -- Built-in states (cannot change markdown or type)
        unchecked = { 
            marker = "□",
        },
        checked = {
            marker = "✔",

        },

        -- Custom states
        in_progress = {
            marker = "◐",
            markdown = ".",     -- Saved as `- [.]`
            type = "incomplete", -- Counts as "not done"
                order = 50,
        },
        cancelled = {
            marker = "✗",
            markdown = "c",     -- Saved as `- [c]`
            type = "complete",   -- Counts as "done"
            order = 2,
        },
        on_hold = {
            marker = "⏸",
            markdown = "/",     -- Saved as `- [/]`
            type = "inactive",   -- Ignored in counts
            order = 100,
        }
    }
})
