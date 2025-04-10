-- PHP Refactoring Tools

return {
  'phpactor/phpactor',
  build = 'composer install --no-dev --optimize-autoloader',
  ft = 'php',
  enabled = true,
  keys = {
    { '<Leader>pm', ':PhpactorContextMenu<CR>' },
    { '<Leader>pn', ':PhpactorClassNew<CR>' },
    { '<F5>', ':PhpactorImportClass<CR>' },
  }
}
