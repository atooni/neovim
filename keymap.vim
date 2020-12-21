nnoremap <C-Up> :resize +2<cr>
nnoremap <C-Down> :resize -2<cr>
nnoremap <C-Right> :vertical resize +2<cr>
nnoremap <C-Left> :vertical resize -2<cr>

" Easier navigation in vi windows
nnoremap <M-Right> <C-w><Right>
nnoremap <M-Left>  <C-w><Left>
nnoremap <M-Down>  <C-w><Down>
nnoremap <M-Up>    <C-w><Up>

inoremap <M-Right> <ESC><C-w><Right>
inoremap <M-Left>  <ESC><C-w><Left>
inoremap <M-Down>  <ESC><C-w><Down>
inoremap <M-Up>    <ESC><C-w><Up>

vnoremap <M-Right> <ESC><C-w><Right>
vnoremap <M-Left>  <ESC><C-w><Left>
vnoremap <M-Down>  <ESC><C-w><Down>
vnoremap <M-Up>    <ESC><C-w><Up>

" Some mappings for terminal mode 
tnoremap <ESC> <C-\><C-n>
 
tnoremap <M-Right> <C-\><C-n><C-w><Right>
tnoremap <M-Left>  <C-\><C-n><C-w><Left>
tnoremap <M-Down>  <C-\><C-n><C-w><Down>
tnoremap <M-Up>    <C-\><C-n><C-w><Up>


