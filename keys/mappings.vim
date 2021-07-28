" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
noremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>
" I hate escape more than anything else
inoremap lk <Esc>
inoremap kl <Esc>
" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>
" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <C-z> :u<CR>
nnoremap <S-TAB> :bprevious<CR>
" Alternate way to save
" nnoremap <C-s> :w<CR>
map <leader>ss :w<CR>
" Alternate way to quit
map <leader>qq :q!<CR>
" Use control-c instead of escape
nnoremap <C-c> <Esc>
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
"nnoremap <s-tab> :bp<CR>
"nnoremap <leader>bd :bd<CR>
"nnoremap <C-f> :FZF<CR>
"map <C-m> :FZF<CR>
let g:NERDTreeChDirMode = 2  " Cambia el directorio actual al nodo padre actual
map <leader>n :NERDTreeToggle<CR>
map <C-V> :vsplit<CR>
map <C-p> :split<CR>
map <C-j> :FloatermNew<CR>
map <C-r> :FloatermNew ranger<CR>
map <C-o> :IndentLinesToggle<CR>
map <f6> :vnew<CR>
" nnoremap h f
" vnoremap h 
map f <Left>
map j <Up>
map l <Right>
map k <Down>
map i <insert>
"map <C-d>:NERDTreeFind<CR>
"map <C-v> :p<CR>
"map <C-f> :BLines<CR>

