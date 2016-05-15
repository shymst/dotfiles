let [plugins, ftplugin] = dein#load_cache_raw(['/Users/shymst/.vimrc'], 1)
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/shymst/.vim/dein'
let g:dein#_runtime_path = '/Users/shymst/.vim/dein/.dein'
let &runtimepath = '/Users/shymst/.vim/dein/repos/github.com/elzr/vim-json,/Users/shymst/.vim/dein/.dein,/Users/shymst/.vim/dein/repos/github.com/Shougo/dein.vim/,/Users/shymst/.vim,/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim74,/usr/local/share/vim/vimfiles/after,/Users/shymst/.vim/after,/Users/shymst/.vim/dein/.dein/after'
filetype off
  let g:vim_markdown_frontmatter = 1
  let g:vim_markdown_math = 1
  let g:lightline = {    'colorscheme': 'solarized' }
  set laststatus=2
