if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
       \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   endif
"open folder -> explorer.exe ."
call plug#begin('~/.config/nvim/autoload/plugged')
  "************snipes********
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets' 
  "***************************
  
  "***************airline*******
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'bryanmylee/vim-colorscheme-icons'
  "***************endairline****
  "********theme******
  Plug 'dracula/vim',{'as':'dracula'}
  "*********end_theme***********"

  "**********adicional**********"
  Plug 'junegunn/goyo.vim'"no necesario"
  Plug 'junegunn/seoul256.vim'
  Plug 'junegunn/rainbow_parentheses.vim'"no necesario"
  Plug 'nightsense/forgotten'"themas"
  Plug 'zaki/zazen'
  Plug 'yuttie/hydrangea-vim'
  Plug 'chriskempson/tomorrow-theme', { 'rtp': 'vim' }
  Plug 'rhysd/vim-color-spring-night'
  Plug 'majutsushi/tagbar'"opcional estrucutra"
  "Plug 'enricobacis/vim-airline-clock'
  Plug 'airblade/vim-gitgutter'
  "**********end_adicional******"
  "******************fzf*********"
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  "******************************"

  "***********algunos_importantes*****************"
  Plug 'jiangmiao/auto-pairs'
  Plug 'preservim/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'ryanoasis/vim-devicons'
  Plug 'scrooloose/nerdcommenter'
  Plug 'mhinz/vim-signify'
  Plug 'junegunn/vim-easy-align'
  Plug 'alvan/vim-closetag'
  Plug 'sheerun/vim-polyglot'
  Plug 'chrisbra/Colorizer'
  Plug 'KabbAmine/vCoolor.vim'
  "***********************************************"

  "**************************auto-completado**************"
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/neco-syntax'  " Fuente general de auto completado
  Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
  Plug 'othree/html5.vim', { 'for': 'html' }
  Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
  Plug 'kqito/vim-easy-replace'
  Plug 'easymotion/vim-easymotion'
  Plug 'sainnhe/sonokai'
  Plug 'voldikss/vim-floaterm'
  Plug 'dense-analysis/ale'
  "*******************************************************"

call plug#end()

"**************leader*********"
let mapleader=","
nmap <leader>g :Goyo<CR>
"*****************************"

"*******************themes_and_color*********************"
function! TransparentBackground()
    highlight Normal guibg=NONE ctermbg=NONE
    highlight LineNr guibg=NONE ctermbg=NONE
    set fillchars+=vert:\│
    highlight VertSplit gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=gray
endfunction

function! DraculaPMenu()
    highlight Pmenu guibg=#363948
    highlight PmenuSbar guibg=#363948
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme dracula call DraculaPMenu()
    "autocmd ColorScheme * call TransparentBackground() " uncomment if you are using a translucent terminal and you want nvim to use that
augroup END

" Main Coloring Configurations
syntax on
color dracula

" Enable True Color Support (ensure you're using a 256-color enabled $TERM, e.g. xterm-256color)
set termguicolors

"**********************colorconfig***************************"

"************************SNIPETS*****************************
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsJumpForwardTrigger="<leader>n"
let g:UltiSnipsJumpBackwardTrigger="<leader>b"
"************************************************************
"**********************airline¨*****************************
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
 let g:airline#extensions#tabline#enabled = 1
let g:airline_section_warning = ''
        set showtabline=2
        set noshowmode
let g:lightline = {
      \ 'component': {
      \   'readonly': '%{&readonly?"":""}',
      \ },
      \ 'separator':    { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ }


function! ColorDracula()
  letg:airline_theme = 'dracula'
  color dracula
endfunction
"**********************endairlineconfig*********************

"*************************COLOR_THEME**********************"
function! ColorSonokai()
  let g:sonokai_style = 'andromeda'
  let g:airline_theme = 'sonokai'
  color sonokai
endfunction


" Dracula Mode (Dark)
function! ColorDracula()
    let g:airline_theme='dracula'
    color dracula
endfunction

" Seoul256 Mode (Dark & Light)
function! ColorSeoul256()
    let g:airline_theme='silver'
    color seoul256
endfunction

" Forgotten Mode (Light)
function! ColorForgotten()
    " Other light airline themes: tomorrow, silver, alduin
    let g:airline_theme='tomorrow'
    " Other light colors: forgotten-light, nemo-light
    color forgotten-light
endfunction

" Zazen Mode (Black & White)
function! ColorZazen()
    let g:airline_theme='minimalist'
    color zazen
endfunction

"******************keys******************************"
nmap <leader>ea :AirlineTheme 
nmap <leader>1 :call ColorDracula()<CR>
nmap <leader>2 :call ColorSeoul256()<CR>
nmap <leader>3 :call ColorForgotten()<CR>
nmap <leader>4 :call ColorZazen()<CR>
nmap <leader>5 :call ColorSonokai()<CR>
"**********************************************************"
"*****************tagbar***********************************"
let g:tagbar_width = 30
nmap <leader>w :TagbarToggle<CR>
"**********************************************************"

"******************NERTHRE**************************"
let NERDTreeShowHidden=1
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
autocmd VimEnter *
    \   if !argc()
    \ |   Startify
    \ |   NERDTree
    \ |   wincmd w
    \ | endif

let g:indentLine_fileTypeExclude = ['text','sh','help','terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*','term:.*']


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

let g:NERDTreeDirArrowExpandable = '📥'
let g:NERDTreeDirArrowCollapsible = '🔻'
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

let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
"****************************************************"

"************************vim-signify**************"
let g:signify_sign_add = '│'
let g:signify_sign_delete = '│'
let g:signify_sign_change = '│'
hi DiffDelete guifg=#ff5555 guibg=none
"*************************************************"
"****************easy aling*******************"
" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)"*=  or 2= or ** or -\ or *,"
"*******************************************"

"********************vim-closetag******************"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
":CloseTagToggleBuffer
":CloseTagEnableBuffer
":CloseTagDisableBuffer
"***********************vim-closetag**************"

"********************auto-completado****************"
let g:deoplete#enable_at_startup = 1
"Cerrar automaticamente la ventana de vista previa (donde se muestra documentación, si existe)augroup deopleteCompleteDoneAu
"  autocmd!
"  autocmd CompleteDone * silent! pclose!
"augroup END
set encoding=utf8
"set clipboard^=unnamed,unnamedplus
"***************************************************"


function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction


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
"**************************fzf************************"
let g:fzf_buffers_jump = 1
"********************************************************"


"***************compile**********************"
autocmd FileType javascript nnoremap <buffer> <F5> :w<esc>:FloatermNew node %<CR>
autocmd FileType c nnoremap <buffer> <F5> :w<esc>:FloatermNew gcc % && ./a.out && rm a.out<CR>
autocmd FileType cpp nnoremap <buffer> <F5> :w<esc>:FloatermNew g++ % && ./a.out && rm a.out<CR>
autocmd FileType python nnoremap <buffer> <F5> :w<esc>:FloatermNew python3 %<CR>
autocmd Filetype java nnoremap <buffer> <F5> :w <esc> !javac % && java %:r <CR>
autocmd FileType hs nnoremap <buffer> <F5> :w<esc>:FloatermNew ghc %<CR>
"********************************************"

"**************commet*******************"
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
"***********************************¨****"


"**********************FloatermNew****************"
nnoremap <F7> :FloatermToggle <CR>
let g:floaterm_keymap_toggle = '<F7>'
let g:floaterm_keymap_next = '<F4>'
let g:floaterm_keymap_prev = '<F2>'
let g:floaterm_keymap_new = '<F3>'
hi Floaterm guibg=black

nmap <Leader>r :EasyReplaceWord<CR>
"***************************************************"

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
