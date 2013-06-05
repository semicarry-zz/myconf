if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
"   set fileencodings=ucs-bom,utf-8,chinese
   set fileencodings=ucs-bom,gb18030,utf-8,chinese
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
"set tag=/home/chenz/httpd-2.2.16/tags
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

"filetype plugin indent on
filetype plugin on

if &term=="xterm"
     set t_Co=8
     set t_Sb=[4%dm
     set t_Sf=[3%dm
endif

" Don't wake up system with blinking cursor:
" http://www.linuxpowertop.org/known.php
let &guicursor = &guicursor . ",a:blinkon0"
""""""""""""""""""""""""""""""
" Tag list (ctags)
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = '/usr/bin/ctags'
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口,则退出vim
"let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
"let Tlist_File_Fold_Auto_Close = 1 "自动折叠

""""""""""""""""""""""""""""""
" netrw setting
""""""""""""""""""""""""""""""
"let g:netrw_winsize = 30

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
nnoremap <silent> <F3> :NERDTreeToggle<CR>
nnoremap <silent> <F4> :NERDTreeToggle<CR>
map <F5> ,cs
map <F6> ,cu
nnoremap <silent> <F7> :YRShow<CR>
map <F8> <Esc>:qa!<CR>
map ff <esc>:FufFile<cr>
map fcd <esc>:FufDir<cr>
map fb <esc>:FufBuffer<cr>
map fjl <esc>:FufJumpList<cr>
map ft <esc>:FufTag<cr>

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

let Tlist_Ctags_Cmd='/opt/local/bin/ctags'  
"自动补全
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1
" 推荐的键映射.
" " <CR>: close popup and save indent.
" " <TAB>: completion. NO USE with snipmate
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"inoremap <expr><C-Y>  neocomplcache#close_popup()
let g:neocomplcache_enable_auto_select = 1


" Define dictionary.
"let g:neocomplcache_dictionary_filetype_lists = {
"    \ 'default' : '',
"    \ 'vimshell' : $HOME.'/.vimshell_hist',
"    \ 'scheme' : $HOME.'/.gosh_completions'
"        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  "return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

 
filetype off                   " required!

 set rtp+=~/.vim/bundle/vundle/
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
Bundle 'YankRing.vim'
"Bundle 'EnhancedCommentify.vim'
Bundle 'ShowMarks'
Bundle 'garbas/vim-snipmate'
Bundle 'vim-scripts/snipmate-snippets'
Bundle 'Shougo/neocomplcache.vim'
Bundle 'Shougo/neosnippet'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'vim-scripts/asciidoc.vim'
Bundle "tomtom/tlib_vim"
syntax on;
