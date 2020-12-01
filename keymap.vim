nnoremap <C-Up> :resize +2<cr>
nnoremap <C-Down> :resize -2<cr>
nnoremap <C-Right> :vertical resize +2<cr>
nnoremap <C-Left> :vertical resize -2<cr>

" Easier navigation in vi windows
nnoremap <A-Right> <C-w><Right>
nnoremap <A-Left>  <C-w><Left>
nnoremap <A-Down>  <C-w><Down>
nnoremap <A-Up>    <C-w><Up>

inoremap <A-Right> <ESC><C-w><Right>
inoremap <A-Left>  <ESC><C-w><Left>
inoremap <A-Down>  <ESC><C-w><Down>
inoremap <A-Up>    <ESC><C-w><Up>

vnoremap <A-Right> <ESC><C-w><Right>
vnoremap <A-Left>  <ESC><C-w><Left>
vnoremap <A-Down>  <ESC><C-w><Down>
vnoremap <A-Up>    <ESC><C-w><Up>

" Some mappings for terminal mode 
tnoremap <ESC> <C-\><C-n>
 
tnoremap <A-Right> <C-\><C-n><C-w><Right>
tnoremap <A-Left>  <C-\><C-n><C-w><Left>
tnoremap <A-Down>  <C-\><C-n><C-w><Down>
tnoremap <A-Up>    <C-\><C-n><C-w><Up>


