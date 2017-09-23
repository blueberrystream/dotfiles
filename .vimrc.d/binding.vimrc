" escape highlight mode with Esc x3
nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

" trailing white space
:autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
:nnoremap <silent> <F2> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" tab
nnoremap <silent> <F3> :tabnew<CR>
nnoremap <silent> <F4> :tabp<CR>
nnoremap <silent> <F5> :tabn<CR>

" toggle number
nnoremap <silent> <F10> :setlocal number!<CR>

" paste mode switch
nnoremap <silent> <F11> :setlocal paste!<CR>

" show full path
noremap <silent> <F12> :echo expand("%:p")<CR>
noremap! <silent> <F12> <Esc>:echo expand("%:p")<CR>

" increment
nnoremap <silent> <C-c> <C-a>

" format
nnoremap == gg=G''

" dein
nnoremap deinu :call dein#update()<CR>

" fakeclip
vmap <C-c> "+y
