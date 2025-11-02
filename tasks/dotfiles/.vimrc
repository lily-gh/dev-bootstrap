set number
syntax on
set relativenumber
set showmode

" Move 1 more lines up or down in normal and visual selection modes.
nnoremap E :m .-2<CR>==
nnoremap N :m .+1<CR>==
vnoremap E :m '<-2<CR>gv=gv
vnoremap N :m '>+1<CR>gv=gv
