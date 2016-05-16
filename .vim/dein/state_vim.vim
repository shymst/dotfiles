let [plugins, ftplugin] = dein#load_cache_raw(['/Users/shymst/.vimrc'], 1)
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/Users/shymst/.vim/dein'
let g:dein#_runtime_path = '/Users/shymst/.vim/dein/.dein'
let &runtimepath = '/Users/shymst/.vim/dein/repos/github.com/elzr/vim-json,/Users/shymst/.vim/dein/.dein,/Users/shymst/.vim/dein/repos/github.com/Shougo/dein.vim/,/Users/shymst/.vim,/usr/local/share/vim/vimfiles,/usr/local/share/vim/vim74,/usr/local/share/vim/vimfiles/after,/Users/shymst/.vim/after,/Users/shymst/.vim/dein/.dein/after'
filetype off
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* PP call dein#autoload#_on_cmd('PP', 'vim-prettyprint', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* PrettyPrint call dein#autoload#_on_cmd('PrettyPrint', 'vim-prettyprint', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))
silent! command -complete=customlist,dein#autoload#_dummy_complete -bang -bar -range -nargs=* Fontzoom call dein#autoload#_on_cmd('Fontzoom', 'vim-fontzoom', <q-args>,  expand('<bang>'), expand('<line1>'), expand('<line2>'))
silent! nnoremap <unique><silent> <Plug>(fontzoom- :call dein#autoload#_on_map('<lt>Plug>(fontzoom-', 'vim-fontzoom','n')<CR>
silent! xnoremap <unique><silent> <Plug>(fontzoom- :call dein#autoload#_on_map('<lt>Plug>(fontzoom-', 'vim-fontzoom','x')<CR>
silent! onoremap <unique><silent> <Plug>(fontzoom- :call dein#autoload#_on_map('<lt>Plug>(fontzoom-', 'vim-fontzoom','o')<CR>
  let g:vim_markdown_frontmatter = 1
  let g:vim_markdown_math = 1
  let g:lightline = {   'colorscheme': 'solarized' }
  let laststatus = 2
autocmd dein-events InsertEnter * call dein#autoload#_on_event("InsertEnter", ['neocomplete.vim'])
