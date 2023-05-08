local status, prettier = pcall(require, 'prettier')
if (not status) then
  print('prettier is not installed')
  return
end

prettier.setup {
  bin = 'prettierd',
  filetypes = {
    'css',
    'html',
    'javascript',
    'javascriptreact',
    'typescript',
    'typescreiptreact',
    'json',
    'scss',
    'less'
  }
}