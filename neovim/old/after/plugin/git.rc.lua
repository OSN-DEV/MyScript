local status, git = pcall(require, 'git')
if (not status) then
  print('git is not installed')
  return
end

git.setup {
  keymaps = {
    -- Open blame window
    blame = "<Leader>gb",
    -- Open file/folder in git repository
    browse  = "<Leader>go"
  }
}