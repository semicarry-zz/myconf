if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
  set fileencodings=ucs-bom,utf-8,chinese
   "set fileencodings=ucs-bom,gb18030,utf-8,chinese
endif

set nocompatible	" Use Vim defaults (much better!)
set bs=indent,eol,start		" allow backspacing over everything in insert mode
"set ai			" always set autoindenting on
"set backup		" keep a backup file
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
			" than 50 lines of registers
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set tag=~/Development/tags
"set number

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup fedora
  autocmd!
  " In text files, always limit the width of text to 78 characters
  autocmd BufRead *.txt set tw=78
  autocmd BufNewFile,BufRead *.sqc,*.ec setf c
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
  \ if line("'\"") > 0 && line ("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
  " don't write swapfile on most commonly used directories for NFS mounts or USB sticks
  autocmd BufNewFile,BufReadPre /media/*,/mnt/* set directory=~/tmp,/var/tmp,/tmp
  " start with spec file template
  autocmd BufNewFile *.spec 0r /usr/share/vim/vimfiles/template.spec
  "autocmd FileType c,ec,sqc,cpp setl fdm=syntax | setl fen
  augroup END
endif
if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
set t_Co=256
set hlsearch
highlight Folded guibg=red guifg=red
highlight FoldColumn guibg=red guifg=red

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"
""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
"let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口,则退出vim
"let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
"let Tlist_File_Fold_Auto_Close = 1 "自动折叠
"
""""""""""""""""""""""""""""""
" BufExplorer
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0       "Do not show default help.
let g:bufExplorerShowRelativePath=1 "Show relative paths.
"let g:bufExplorerSortBy='mru'        "Sort by most recently used.
let g:bufExplorerSplitRight=0        "Split left.
let g:bufExplorerSplitVertical=1     "Split vertically.
let g:bufExplorerSplitVertSize = 25 "Split width
let g:bufExplorerUseCurrentWindow=1 "Open in new window.
"let g:miniBufExplMapCTabSwitchBufs=1
"let g:miniBufExplMapWindowsNavVim=1
"let g:miniBufExplMapWindowNavArrows=1
autocmd BufWinEnter \[Buf\ List\] setl nonumber
""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
"let mapleader=","
"let g:winManagerWindowLayout = "FileExplorer|BufExplorer|TagList"
"let g:winManagerWidth = 45
"let g:defaultExplorer = 0
set completeopt=longest,menu
map <silent> <F9> :TlistToggle<CR>

""""""""""""""""""""""""""""""
" showmarks setting
""""""""""""""""""""""""""""""
" Enable ShowMarks
let showmarks_enable = 1
" " Show which marks
let showmarks_include ="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
" " Ignore help, quickfix, non-modifiable buffers
let showmarks_ignore_type = "hqm"
" " Hilight lower & upper marks
let showmarks_hlline_lower = 1
let showmarks_hlline_upper = 1

""""""""""""""""""""""""""""""
" markbrowser setting
""""""""""""""""""""""""""""""
"nmap <silent> <leader>mk :MarksBrowser<cr>
autocmd FileType perl set keywordprg=perldoc\ -f
autocmd FileType pl set keywordprg=perldoc\ -f
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set nobackup
"set cindent
"set autoindent
set showcmd
set helplang=Cn
set nofoldenable
set noswapfile
set number
set hlsearch
set incsearch
set viminfo+=h
set nocp

map ,h :nohl<CR>
map ,hl :syntax on<CR>
map ,nu :set nu!<CR>
nnoremap <silent> <F4> :NERDTreeToggle<CR>
map <F5> <leader>cs
map <F6> <leader>cu
nnoremap <silent> <F7> :YRShow<CR>
map <F8> <Esc>:qa!<CR>
map ,ff <esc>:FufFile<cr>
map ,fcd <esc>:FufDir<cr>
map ,fb <esc>:FufBuffer<cr>
map ,fjl <esc>:FufJumpList<cr>
map ,ft <esc>:FufTag<cr>

map <F10> <Esc>:tabnew<CR>
map <F2> <Esc>:tabprevious<CR>
map <F3> <Esc>:tabnext<CR>

function ClosePair(char)
if getline('.')[col(',') - 1] == a:char
return "\<Right>"
else
return a:char
endif
endf

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'  

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
    return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.go = '\h\w*.\?'

" Plugin key-mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><C-k> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><C-k> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
"
" " Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'


"vimux setting
map <Leader>vp :call VimuxRunCommand("clear; python " . bufname("%"))<CR>
map <Leader>vg :call VimuxRunCommand("clear; go run " . bufname("%"))<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vs :VimuxInterruptRunner<CR>
map <Leader>vr :VimuxPromptCommand<CR>
map <Leader>vv :call VimuxOpenPane()<CR>
let VimuxUseNearestPane=0

"dash
nmap <silent> <leader>d <Plug>DashSearch
"let g:dash_map = {
    "\ 'ruby'       : 'rails',
    "\ 'python'     : 'python2',
    "\ 'javascript' : 'backbone'
    "\ }

 
filetype off                   " required!
filetype plugin indent off

set rtp+=~/.vim/bundle/vundle/
set rtp+=$GOROOT/misc/vim
call vundle#rc()

" let Vundle manage Vundle
"  " required! 
Bundle 'gmarik/vundle'
"
"    " My Bundles here:
"     "
"      " original repos on github
"       Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"         Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"            Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'tpope/vim-pathogen'
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'bufexplorer.zip'
Bundle 'taglist.vim'
Bundle 'Mark'
Bundle 'The-NERD-tree'
Bundle 'vim-scripts/matrix.vim'
Bundle 'closetag.vim'
Bundle 'The-NERD-Commenter'
Bundle 'matchit.zip'
"Bundle 'YankRing.vim'
"Bundle 'EnhancedCommentify.vim'
Bundle 'ShowMarks'
Bundle 'garbas/vim-snipmate'
Bundle "honza/vim-snippets"
"Bundle 'vim-scripts/snipmate-snippets'
Bundle 'Shougo/neocomplete.vim'
Bundle 'mattn/emmet-vim'
Bundle 'Shougo/neosnippet'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'vim-scripts/asciidoc.vim'
Bundle "tomtom/tlib_vim"
Bundle "golangtw/go.vim"
Bundle "benmills/vimux"
"Bundle 'rizzatti/funcoo.vim'
Bundle 'rizzatti/dash.vim'
Bundle 'nsf/gocode'
Bundle 'Blackrush/vim-gocode'
"Bundle 'skammer/vim-css-color'
"Bundle 'majutsushi/tagbar'
Bundle 'maksimr/vim-jsbeautify'
Bundle 'einars/js-beautify'
Bundle 'tpope/vim-surround'
Bundle 'airblade/vim-gitgutter'
Bundle 'tpope/vim-repeat'

let g:user_emmet_settings = {
            \ 'php' : {
            \ 'extends' : 'html',
            \ 'filters' : 'c',
            \ },
            \ 'xml' : {
            \ 'extends' : 'html',
            \ },
            \ 'haml' : {
            \ 'extends' : 'html',
            \ },
            \ 'tpl' : {
            \ 'extends' : 'html',
            \ },
            \}
"let g:user_zen_expandabbr_key = "<C-e>"

let g:cssColorVimDoNotMessMyUpdatetime = 1
filetype plugin indent on
syntax on



" jsbeautify
" for js
autocmd FileType javascript noremap <buffer>  ,rf :call JsBeautify()<cr>
" for html
autocmd FileType html noremap <buffer> ,rf :call HtmlBeautify()<cr>
" for css or scss
autocmd FileType css noremap <buffer> ,rf :call CSSBeautify()<cr>

au BufNewFile,BufRead *.tpl set filetype=html

"vim 自动更新ctags
"function! UPDATE_TAGS()
  "let _f_ = expand("%:p")
  "let _cmd_ =  '"ctags -a -f /Users/semicarry/Development/tags --c++-kinds=+p --fields=+iaS --extra=+q " '  . '"' . _f_ . '"'
  "let _resp = system(_cmd_)
  "unlet _cmd_
  "unlet _f_
  "unlet _resp
"endfunction
"autocmd BufWrite *.cpp,*.h,*.c call UPDATE_TAGS()
"test

"'tpope/vim-repeat'
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
let g:gitgutter_enabled = 0


" colorscheme solarized
let g:solarized_termcolors=256
let g:solarized_termtrans=1
Bundle 'altercation/vim-colors-solarized'
syntax enable
set background=dark
colorscheme solarized
