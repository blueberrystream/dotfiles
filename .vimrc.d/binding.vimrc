" tab
nmap <silent> <F4> :tabnew<CR>
nmap <silent> <F5> :tabn<CR>

" paste mode switch
set pastetoggle=<F11>

" trailing white space
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
:nnoremap <silent> <F3> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" escape highlight mode with Esc x3
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" toggle number
nmap <silent> <F10> :<C-u>setlocal number!<CR>

nmap <silent> <F12> :echo expand("%:p")<CR>
