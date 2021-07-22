syntax on
syntax enable
"set colorcolumn=100
set guicursor=
set termguicolors
set guioptions-=T
set path+=**
set number relativenumber
set smartcase
set incsearch
set nohlsearch
set completeopt=menuone,noinsert,noselect
highlight ColorColumn ctermbg=2 guibg=lightgrey

set noswapfile
set undofile 

"*****************config*********************
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=5                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=8                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set cursorline                          " Enable highlighting of the current line
"set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamed               " Copy paste between vim and everything else
set t_Co=16
set rnu
au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
" You can't stop me
cmap w!! w !sudo tee %
"**************************************************************
"***************************************************************
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
       \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   endif
"*****************************************************************

call plug#begin(stdpath('data').'/plugged')
    " Conquer Of Completion
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Surround.vim
    Plug 'tpope/vim-surround'
    " Airline status bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " NERDCommenter
    Plug 'preservim/nerdcommenter'
        " Other themes
    Plug 'morhetz/gruvbox'
    Plug 'sainnhe/sonokai'
    Plug 'Rigellute/shades-of-purple.vim'
    Plug 'dense-analysis/ale'
    Plug 'joshdick/onedark.vim'
    Plug 'machakann/vim-highlightedyank'
    Plug 'tpope/vim-commentary'"este en un comentario
    Plug 'kqito/vim-easy-replace'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'nvim-treesitter/highlight.lua'
	  Plug 'phanviet/vim-monokai-pro'
	  Plug 'Rigellute/shades-of-purple.vim'
	  Plug 'bluz71/vim-moonfly-colors'
	  Plug 'jacoborus/tender.vim'
	  Plug 'tpope/vim-commentary'
	  Plug 'nightsense/carbonized'
	  Plug 'ajmwagar/vim-deus'
	  Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
	  Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin' |
            \ Plug 'ryanoasis/vim-devicons'
    Plug 'scrooloose/NERDTree'
    Plug 'jiangmiao/auto-pairs'
    Plug 'joshdick/onedark.vim'
	  Plug 'sainnhe/sonokai'
	  Plug 'morhetz/gruvbox'
	  Plug 'vim-airline/vim-airline'
	  Plug 'vim-airline/vim-airline-themes'
	  Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
	  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	  Plug 'Shougo/neco-syntax'  " Fuente general de auto completado
	  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
	  Plug 'othree/html5.vim', { 'for': 'html' }
	  Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
	  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	  Plug 'junegunn/fzf.vim'
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': ':UpdateRemotePlugins'}
	  Plug 'voldikss/vim-floaterm'
    Plug 'iamcco/sran.nvim',{'do':{ -> sran#util#install()}}
    Plug 'iamcco/clock.nvim'
    Plug 'tranvansang/octave.vim'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'enricobacis/vim-airline-clock'
	  Plug 'mhinz/vim-signify'

"************************FZF******************************

let g:fzf_history_dir = '~/.local/share/fzf-history'

map <C-f> :BLines<CR>
map <leader>b :Buffers<CR>
nnoremap <leader>g :Rg<CR>
nnoremap <leader>t :Tags<CR>
nnoremap <leader>m :Marks<CR>

let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.5, 'height': 0.15,'yoffset':0.0,'xoffset': 0.9, 'highlight': 'Todo', 'border': 'sharp' } }

let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"


" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)


" Get text in files with Rg
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
" Git grep
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
call plug#end()

"**************colorscheme********************
"let g:sonokai_style = 'atlantis'
let g:sonokai_style = 'andromeda'
"let g:sonokai_style = 'maia'
colorscheme sonokai
"colorscheme deus 
"colorscheme shades_of_purple
"let g:gruvbox_contrast_dark='hard'
"set background=dark
"**************end_colorscheme****************

"********************airline******************
let g:airline_theme='sonokai'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set showtabline=2
set noshowmode
"******************end_airline****************

"******************nerdcommenter**************
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
"***********************end_nerdcommenter***********"
 
"**********************key_config***********************
" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>
" I hate escape more than anything else
inoremap jk <Esc>
inoremap kj <Esc>
" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>
" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <C-z> :u<CR>
nnoremap <S-TAB> :bprevious<CR>
" Alternate way to save
nnoremap <C-s> :w<CR>
" Alternate way to quit
map <C-q> :q!<CR>
" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" Better tabbing
vnoremap < <gv
vnoremap > >gv
" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" buffers
nnoremap <C-tab> >>
"nnoremap <leader>bd :bd<CR>
"nnoremap <C-f> :FZF<CR>
"map <C-m> :FZF<CR>
let g:NERDTreeChDirMode = 2  " Cambia el directorio actual al nodo padre actual
map <C-b> :NERDTreeToggle<CR>
map <C-V> :vsplit<CR>
map <C-p> :split<CR>
map <C-j> :FloatermNew<CR>
map <C-r> :FloatermNew ranger<CR>
map <C-o> :IndentLinesToggle<CR>
map <f6> :vnew<CR>
"********************end_keyconfig************************

"************************nerthre********************************
let g:NERDTreeDirArrowExpandable = '📥'
let g:NERDTreeDirArrowCollapsible = '🔻'
let g:deoplete#enable_at_startup = 1


set encoding=utf8
set clipboard^=unnamed,unnamedplus



let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1

"============para los icons===================""
let g:lightline = {
      \ 'component_function': {
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ }
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

"==============FZF=====================
let g:fzf_buffers_jump = 1

"=============CLOCK============
let g:clockn_enable = 0 
"let g:clockn_color = #000000
let g:clockn_winblend = 100
highlight ClockNormal guifg = #000000
let g:clockn_to_top = 1
let g:clockn_to_right = 1
":ClockEnable
":ClockDisable
"==============for github===============
" Change these if you want
let g:signify_sign_add               = '✳️'
let g:signify_sign_delete            = '✴️'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '💠'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1



let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'♻️',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'❌',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☢️',
                \ 'Clean'     :'✅',
                \ 'Unknown'   :'⁉️',
                \ }
"********************nerthre**********************************************

let mapleader=","

"===========================templates=============
nnoremap ,ccp :-1read $HOME/.config/.cp.cpp<CR>
nnoremap ,cpp :-1read $HOME/.config/files/main.cpp<CR>
nnoremap ,jj :-1read $HOME/.config/files/ht.html<CR>
"=================================================
"==============navegando con guider===========
inoremap ;gui <++>
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
"vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l
"=================================================
set encoding=UTF-8

" rainboar
let g:rainbow_active = 1
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['WhiteSmoke', 'DarkOrange5', 'DarkOrchid3', 'Faux-Green']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'green', 'magenta']
set expandtab
set tabstop=2
set shiftwidth=2 
"=======================================================

"=============easymotion============
nmap <leader>s <Plug>(easymotion-s2)


autocmd FileType javascript nnoremap <buffer> <F5> :w<esc>:FloatermNew node %<CR>
autocmd FileType c nnoremap <buffer> <F5> :w<esc>:FloatermNew gcc % && ./a.out && rm a.out<CR>
autocmd FileType cpp nnoremap <buffer> <F5> :w<esc>:FloatermNew g++ % && ./a.out && rm a.out<CR>
autocmd FileType python nnoremap <buffer> <F5> :w<esc>:FloatermNew python3 %<CR>
autocmd Filetype java nnoremap <buffer> <F5> :w <esc> !javac % && java %:r <CR>
autocmd FileType hs nnoremap <buffer> <F5> :w<esc>:FloatermNew ghc %<CR>


" Commenting blocks of code.
augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType c,cpp,java,scala,javascript let b:comment_leader = '// '
  autocmd FileType ruby,python   let b:comment_leader = '# '
  autocmd FileType conf,fstab       let b:comment_leader = '# '
  autocmd FileType tex              let b:comment_leader = '% '
  autocmd FileType mail             let b:comment_leader = '> '
  autocmd FileType vim              let b:comment_leader = '" '
  autocmd FileType html             let b:comment_leader = ' <!-- '
  autocmd FileType hs             let b:comment_leader = '--'
augroup END
noremap <silent> ,c :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,u :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


augroup pandoc_syntax
    au! BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc
augroup END 

augroup pandoc_syntax
  autocmd! FileType vimwiki set syntax=markdown.pandoc
augroup END

if (has("termguicolors"))
 set termguicolors
endif
"""" enable the theme
nnoremap <F7> :FloatermToggle <CR>
let g:floaterm_keymap_toggle = '<F7>'
let g:floaterm_keymap_next = '<F4>'
let g:floaterm_keymap_prev = '<F2>'
let g:floaterm_keymap_new = '<F3>'
"hi Floaterm guibg=black

nmap <Leader>r :EasyReplaceWord<CR>

"===================ALE=============
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰']
let g:ale_echo_msg_error_str = 'X'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '⛔'
let g:ale_sign_warning = '⚠️ '
let b:ale_fixers = ['prettier', 'eslint']
" Equivalent to the above.
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_completion_autoimport = 1
highlight clear ALEErrorSign
highlight clear ALEWarningSign
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=%{LinterStatus()}
