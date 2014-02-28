syn on
filetype plugin on
set autoindent
set background=dark
set hlsearch
set list
set listchars=tab:»·,trail:¢

map <F2> :NERDTreeToggle<CR>
map <F3> :TlistToggle<CR>
map <F8> :TlistAddFilesRecursive .<CR>

set ts=3
set sw=3
set tw=0
set expandtab
set nu

colorscheme fu
" git branch
set statusline=%f " tail of the filename

"set statusline+=%{fugitive#statusline()}

set statusline+=%=      "left/right separator
set statusline+=%{StatuslineCurrentHighlight()}\ \ "current highlight
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set laststatus=2        " Always show status line

" warning for mixed indenting
set statusline+=%#error#
set statusline+=%{StatuslineTabWarning()}
set statusline+=%*

set statusline+=%h      "help file flag
set statusline+=%y      "filetype
set statusline+=%r      "read only flag
set statusline+=%m      "modified flag

set cursorline
if has("gui_running")
   set cursorcolumn
endif



function! StatuslineTabWarning()
    if !exists("b:statusline_tab_warning")
        let tabs = search('^\t', 'nw') != 0
        let spaces = search('^ ', 'nw') != 0

        if tabs && spaces
            let b:statusline_tab_warning =  '[mixed-indenting]'
        elseif (spaces && !&et) || (tabs && &et)
            let b:statusline_tab_warning = '[&et]'
        else
            let b:statusline_tab_warning = ''
        endif
    endif
    return b:statusline_tab_warning
endfunction

" return the syntax highlight group under the cursor ''
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction

set visualbell
set autoread

set noswapfile
set nobackup
set nowb

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2

filetype on
filetype plugin on
filetype indent on
filetype plugin indent on
