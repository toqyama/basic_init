
" ~/.vimrc

"----- General -----"
set number
"set nonumber  " <- hyde number
set ruler
set notitle
"set t_kb=^?
set backspace=indent,eol,start
set shiftwidth=4
"set tabstop=8
set tabstop=4
set cmdheight=2
"set showmode
set showcmd              " show <command name> below window
set report=2
"set syntax=on
"set cursorline

" n: normal v:visual i:insert c:command a:all
set mouse=n
set ttymouse=xterm2

set ignorecase
set smartcase
"set tags=./tags,./TAGS,tags,TAGS
set tags=tags,./.tags./.TAGS,.tags,TAGS,/../tags,../.tags
"set tags=tags,./.tags./.TAGS,.tags,TAGS,/../tags,../.tags,~/samba/snap_linux/linux/tags

"----- indent & commet -----"
"set cindent
"set autoindent
set noautoindent
set smartindent
set noexpandtab

autocmd FileType * set formatoptions-=ro  " disable auto comment-out

"----- status line -----"
set laststatus=2

" Status line 
set statusline=%<%f\ %m%r%h%w
set statusline+=%{'['.(&fenc!=''?&fenc:&enc).']['.&fileformat.']'}
set statusline+=%=%l/%L,%c%V%8P

"----- bracket  -----"

" jump to the right bracket (momentary) 0.1 [sec] * $matchtime
set showmatch
set matchtime=5

" ----- file type ----- 
autocmd BufNewFile,BufRead *.vnet set filetype=verilog
autocmd BufNewFile,BufRead *.dofile set filetype=verilog
autocmd BufNewFile,BufRead *.sv set filetype=verilog
autocmd BufNewFile,BufRead *.hnl set filetype=verilog

"set encoding=shift_jis

"let $LANG='ja'
"set enc=japan
set encoding=utf-8
"set fileencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis

" -------------------------------------
" auto paste with no indent  
" -------------------------------------

if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif

" -------------------------------------
" plugin setting  
" -------------------------------------

" ----- dein plugin manager ----- 

set nocompatible

" Install with startup
augroup PluginInstall
  autocmd!

    autocmd VimEnter * if dein#check_install() | call dein#install() | endif
    augroup END

" Plugin Install Directory 
let s:plugin_dir = expand('~/.vim/dein/')
" Set dein.vim Install Directory to runtime path
let s:dein_dir = s:plugin_dir . 'repos/github.com/Shougo/dein.vim'
"set runtimepath+=s:dein_dir
execute 'set runtimepath+=' . s:dein_dir


" `git clone` if Dein.vim does'nt exist
if !isdirectory(s:dein_dir)
  call mkdir(s:dein_dir, 'p')
    silent execute printf('!git clone %s %s', 'https://github.com/Shougo/dein.vim', s:dein_dir)
endif

"if dein#load_state(s:plugin_dir)
call dein#begin(s:plugin_dir)

" Config. files [TOML Format]
  let g:toml_dir    = expand('~/.vim/dein/toml')
  let s:toml      = g:toml_dir . '/dein.toml'
  let s:lazy_toml = g:toml_dir . '/dein_lazy.toml'

" call dein#add('chriskempson/vim-tomorrow-theme')

" Load TOML
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
"endif

filetype plugin indent on

" ----- NERDTree ----- "

"let NERDTreeShowHidden = 1
"autocmd VimEnter * execute 'NERDTree'

" ----- vim-airline ----- "

  let g:airline_powerline_fonts = 1
  "let g:airline_left_sep='>'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_enable_branch = 0
  let g:airline_section_b = "%t %9M"
  let g:airline_section_c = ''
  let s:sep = " %{get(g:, 'airline_right_alt_sep', '')} "
  let g:airline_section_x =
  \ "%{strlen(&fileformat)?&fileformat:''}".s:sep.
  \	"%{strlen(&fenc)?&fenc:&enc}".s:sep.
  \ "%{strlen(&filetype)?&filetype:'no ft'}"
  let g:airline_section_y = '%3p%%'
  let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
  let g:airline#extensions#whitespace#enabled = 0

  "----- key remap -----"

  " < Remap Memo > "
  " noremap  : normal mode		 + visual mode , no remap
  " noremap! : command line	mode + insert mode , no remap
  " nnoremap : normal mode , no remap
  " cnoremap : command line mode , no remap
  " vnoremap : visual mode , no remap
  " inoremap : insert mode , no remap

  imap ^D ESC

  " ----- tabstop ----- "
  nnoremap t4 :set tabstop=4<CR>
  nnoremap t8 :set tabstop=8<CR>
  " ----- move ----- "
  nnoremap <C-e> 3<C-e>
  nnoremap <C-y> 3<C-y>
  nnoremap <C-d> 3<C-d>
  nnoremap <C-u> 3<C-u>
  
  " ----- tags ----- "
  nnoremap tl :tselect<CR>
  nnoremap tb :<C-t><CR>
  nnoremap tn :tag<CR>

  " ----- set number ----- "
  nnoremap ,nu :set nu<CR>
  nnoremap ,nn :set nonu<CR>

  "nnoremap <C-> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
  "nnoremap <C-> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

  " ----- .vimrc ----- "
  nnoremap <silent> vv :e ~/.vimrc<CR>

  " ----- Unite.vim ----- "
  nnoremap Ud :Unite dein<CR>
  nnoremap Uc :Unite colorscheme -auto-preview<CR>
  " list all buffers 
  noremap <C-P> :Unite buffer<CR>
  " list files
  noremap <C-N> :Unite -buffer-name=file file<CR>
  " list files recently used
  noremap <C-z> :Unite file_mru<CR>
  noremap <C-j> :Unite file<CR>
  "noremap <C-s-u> :Unite file<CR>
  
  " sources : change directory of temp file
  "noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
  "  open with split
  au FileType unite nnoremap <silent> <buffer> <expr> <C-S> unite#do_action('split')
  au FileType unite inoremap <silent> <buffer> <expr> <C-S> unite#do_action('split')
  "  open with vsplit 
  au FileType unite nnoremap <silent> <buffer> <expr> <C-V> unite#do_action('vsplit')
  au FileType unite inoremap <silent> <buffer> <expr> <C-V> unite#do_action('vsplit')
  " exit with <ESC><ESC>
  au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
  au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>


  " ----- NERDTree ----- "
  nnoremap <silent><C-S-n> :NERDTreeToggle<CR>
  "nnoremap <silent><C-r> :NERDTree<CR>

  " ----- VimFiler ----- "
  nnoremap <silent> vf :VimFiler<CR>

  " ----- VimShell ----- "
  "nnoremap <silent>vh :VimShell<CR>
  noremap <silent> vs  :VimShell<CR>
  nnoremap <silent> vsc :VimShellCreate<CR>
  nnoremap <silent> vp  :VimShellPop<CR>

  " ----- buffer ----- "
  nnoremap <silent><C-n> :bprevious<CR>
  nnoremap <silent><C-m> :bnext<CR>
  nnoremap <silent><C-.> :bprevious<CR>
  nnoremap <silent><C-,> :bnext<CR>
  "nnoremap <silent>bp :bprevious<CR>
  "nnoremap <silent>bn :bnext<CR>
  "nnoremap <silent>bb :b#<CR>
  "nnoremap <silent>bf :bf<CR>
  "nnoremap <silent>bl :bl<CR>
  "nnoremap <silent>bm :bm<CR>
  nnoremap <silent><C-k> :bdelete<CR>

  
  " ----- tab ----- "
  nnoremap <silent> tp :tabprevious<CR>
  nnoremap <silent> tn :tabnext<CR>

  " start within insert mode
  let g:unite_enable_start_insert = 1

  " ignore A/a
  let g:unite_enable_ignore_case = 1
  let g:unite_enable_smart_case = 1

  " ---- grep ----- "
  nnoremap <silent> ,a  :Ag  
  nnoremap <silent> ,f  :AgFile   

  let g:unite_enable_start_insert = 1

  " 大文字小文字を区別しない
  let g:unite_enable_ignore_case = 1
  let g:unite_enable_smart_case = 1
  " grep検索
  nnoremap <silent> ,t  :<C-u>Unite grep: -buffer-name=search-buffer<CR>
  nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
  " カーソル位置の単語をgrep検索
  nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W><CR>
  " grep検索結果の再呼出
  nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
  

  " unite grep $B$K(B ag(The Silver Searcher) $B$r;H66$&(B
  " hw: highway
  " ag: silver-searcher 
  if executable('ag')
  let g:unite_source_grep_command = 'ag'
	  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
	  let g:unite_source_grep_recursive_opt = ''
	  let g:unite_source_grep_max_candidates = 200
  endif
  "if executable('hw')
  "  let g:unite_source_grep_command = 'hw'


  " ----- Color ----- "
  "set t_Co=256
  "set background=dark
  "colorscheme zellner
  "colorscheme desert
  "colorscheme delek
  "colorscheme default
  "colorscheme hybrid
  "colorscheme Tomorrow-Night
  colorscheme Tomorrow-Night-Blue
  "colorscheme Tomorrow-Night-Bright
  "colorscheme Tomorrow-Night-Eighties
  "colorscheme molokai
  "colorscheme jellybeans
  "colorscheme monokai
  "let g:solarized_termcolors=256
  "syntax enable
  "colorscheme solarized
  "set background=light
  "colorscheme cobalt2
  highlight LineNr ctermfg=61 ctermbg=17
  "highlight LineNr ctermfg=darkgrey
  "highlight Search ctermfg=Blue
  highlight Search term=standout ctermfg=Black ctermbg=lightMagenta guifg=Black guibg=Yellow
  "highlight Search term=standout ctermfg=15 ctermbg=1 guifg=White guibg=Red

"---END---"
