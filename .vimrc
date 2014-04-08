set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb
set nu
"set nonu

set ai
set ci
set si


set csverb
set title
set hlsearch
set tabstop=8
set sw=8
color evening

"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

map <F5> :cs add /home/iamjoonsoo.kim/Project/lap/android/cscope.out<CR>
map <F7> :cs kill 1<CR>
map <F8> :cs find f %:t:r.h<CR>
map <F9> :cs find f %:t:r.cpp<CR>
nmap <C-[>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-[>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-[>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-[>d :cs find d <C-R>=expand("<cword>")<CR><CR>
nmap <C-x> :pop<CR>
nmap <C-c> :tag <C-R>=expand("<cword>")<CR><CR>
vmap <Leader>g :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

cs add /home/js1304/Projects/remote_git/linux/cscope.out
