local M = {}

-- Check if current directory is a git repository
function M.is_git_repo()
    local result = vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null")
    print("is git_repo: ", result)
    return vim.v.shell_error == 0 and result:match("true")
end

-- Check if current file is tracked by git
function M.is_git_file()
    if not M.is_git_repo() then
        return false
    end
    
    local file_path = vim.fn.expand("%:p")
    local result = vim.fn.system("git ls-files --error-unmatch " .. vim.fn.shellescape(file_path) .. " 2>/dev/null")
    return vim.v.shell_error == 0
end

return M
