" ----------- Basic Vim Settings -----------
set scrolloff=8           " Keep 8 lines visible above/below the cursor when scrolling
set number                " Show line numbers
set relativenumber        " Show relative line numbers for easier navigation

" ----------- Tab and Indentation Settings -----------
set tabstop=4             " Set width for a tab character
set softtabstop=4         " Set width for editing as if tabs are 4 spaces
set shiftwidth=4          " Number of spaces for auto-indent
set expandtab             " Convert tabs to spaces
set smartindent           " Automatically indent new lines in a smart way

" ----------- Interface and Colors -----------
set mouse=a               " Enable mouse support in all modes
set termguicolors         " Enable true colors in the terminal (if supported)
let g:desert_termcolors=256 " Set color depth for the 'desert' theme
colorscheme desert        " Set the color scheme to 'desert'

" ----------- Key Mappings -----------
nnoremap <leader>pv :Vex<CR> " Open the file explorer (Vex) with <leader>pv
nnoremap <leader><CR> :so ~/.vimrc<CR> " Source (reload) .vimrc with <leader><CR>

nnoremap <C-6> ^         " Remap Ctrl-6 to switch to the previous buffer
nnoremap <C-p> :Files<CR> " Open fuzzy file finder (Files) with Ctrl-p

" ----------- Quickfix Navigation -----------
nnoremap <C-j> :cnext<CR> " Go to the next item in the quickfix list with Ctrl-j
nnoremap <C-k> :cprev<CR> " Go to the previous item in the quickfix list with Ctrl-k

" ----------- Clipboard Integration -----------
nnoremap <leader>y "+y    " Yank (copy) to the system clipboard with <leader>y
set clipboard=unnamedplus " Use system clipboard for all yank, delete, change, and put operations
