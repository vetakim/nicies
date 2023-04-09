let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE . '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' . substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

"set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('/home/vetakim/.cache/dein')
    call dein#begin('/home/vetakim/.cache/dein')

    " Let dein manage dein
    call dein#add('/home/vetakim/.cache/dein/repos/github.com/Shougo/dein.vim')

    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('flazz/vim-colorschemes')
    call dein#add('scrooloose/syntastic')
    call dein#add('scrooloose/nerdtree')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('majutsushi/tagbar')
    call dein#add('jlfwong/vim-mercenary')
    call dein#end()
    call dein#save_state()
endif

" install not installed plugins on startup.

if dein#check_install()
  call dein#install()
endif

set nocompatible
filetype plugin indent on
set hidden               " Не выгружать буфер когда переключаешься на другой
"Настройка буферов set autowrite            " Записывать всё перед изменением
"Подключение мыши
set mouse=a
"if has('mouse')
    "set mouse=a
"endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" " Редактирование
" поведение строк set scrolloff=6         " количество строк вокруг курсора
set number              " показывать номера строк
set wrap                " разрывать строки
set lbr                 " перенос по словам
set textwidth=74

"""""""""""""""""""""" Табуляция""""""""""""""""""""""""""""""""""""""""

set softtabstop=4
set shiftwidth=4        "табуляция авто отступов
set tabstop=4           "табуляция

set autoindent          " авто отступ
" set cindent             " Indentation in the style of C
set smarttab
set expandtab           " Вместо табуляции пробелы
set smartindent         " Включаем умные отступы (например после { )
set spl=ru,en
" for makefile tabs
autocmd FileType make set noexpandtab tabstop=8 shiftwidth=8

" for tex
autocmd FileType tex set textwidth=78 foldmethod=marker tabstop=4 shiftwidth=4 softtabstop=4 expandtab
"autocmd FileType tex set textwidth=78 foldmethod=indent tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" for cpp
autocmd FileType cpp set foldmethod=indent textwidth=78 softtabstop=4 shiftwidth=4 tabstop=4 expandtab
autocmd FileType xml set textwidth=178 foldmethod=indent
autocmd FileType qml set textwidth=78 foldmethod=indent

" for octave
au BufNewFile,BufRead *.m set filetype=octave
autocmd FileType octave set softtabstop=2 shiftwidth=2 tabstop=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" показывать выделения после сдвига
vnoremap < >gv
vnoremap > <gv

set showmatch           " Показывать совпадающую скобку

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" интерфейс

set backspace=2             " Influences of <BS> in Insert mode
set termencoding=utf-8      " Кодировка терминала
syntax on                   " Подсветка синтаксиса
set ruler                   " Строка статуса
set mousehide               " Скрывать курсор мыши когда печатаем

"настройка цветовой схемы
set t_ut=
"set t_Co=256                " поддержка 256 цветов в терминале ( необходимо TERM=xterm-256color)
"colorscheme solarized " Неплохие схемы: calmar256-dark (только ее нет), peaksea, lucius, wombat256
colorscheme zenburn " Неплохие схемы: calmar256-dark (только ее нет), peaksea, lucius, wombat256
set background=dark
set winminheight=0          " Минимальная высота окна
set winminwidth=0           " Минимальная ширина окна
set laststatus=2            " Всегда показывать строку статуса
set wildmenu                " Более удобное дополнение
set wildmode=list:longest
set wildcharm=<Tab>
set showcmd                 " Показывать незавершённые команды в статусбаре
set autoread                " После изменения файл сам перечитывается

" Опции автодополнения - включаем только меню с доступными вариантами
set completeopt=menu
"
" задает формат строки статуса.
set statusline=%<%f%h%m%r%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" list mode: on. ( Show tabs as >--- and trail spaces as - )""
set list                                                    ""
set listchars=tab:>-,trail:-                                ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nobackup                " Отключить бэкапы
set noswapfile              " Отключить свап файлы

set visualbell t_vb=        " Отключить пищалку
set splitbelow              " Новое окно появляется внизу

" вначале открывает в utf8, если не подходит то в cp1251
set fileencodings=utf8,cp1251,koi8-r,koi-7
set encoding=utf8

set browsedir=current       " ????? TODO: I don't now!
"""""""""""""""""""""""""""" Search settings"""""""""""""""""""""""""""""""""""
                                                                             ""
set ignorecase              " Case of normal letter is ignored               ""
set smartcase               " If search pattern contain upper -> noignorecase""
set incsearch               " Поиск по набору текста                         ""
set hlsearch                " Подсвечивать найденные элементы                ""
                                                                             ""
function! MyHlSearch()                                                       ""
    if &hlsearch == 0                                                        ""
        :set hlsearch                                                        ""
    else                                                                     ""
        :set nohlsearch                                                      ""
    endif                                                                    ""
endfunction                                                                  ""
                                                                             ""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""" Folding""""""""""""""""""""""""""""""""""""""""""""""""
                                                                             ""
set foldenable              "                                                ""
set foldmethod=syntax                                                ""
set foldcolumn=3            "                                                ""
set foldlevel=1             "                                                ""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set tags+=~/.vim/tags/qt4tags
" switch on/off spelling
imap    <F3>    <Esc>:set spell!<CR>
nmap    <F3>    <Esc>:set spell!<CR>
" Очистить подсветку последнего найденного выражения
" следующий буфер
 nmap    <S-F5>  :bn<CR>
 imap    <S-F5>  <esc>:bn<CR>i
 vmap    <S-F5>  <esc>:bn<CR>

" предыдущий буфер
 nmap    <C-F5>  :bp<CR>
 imap    <C-F5>  <esc>:bp<CR>i
 vmap    <C-F5>  <esc>:bp<CR>

" сохраняет все файлы и выполняет команду :make / :make clean
 map     <F7>    :wall \| make clean && make <CR>
 "map     <F7>    :wall \| make clean<CR>

" выход из редактора по F12
map     <F12>   :q<CR>
imap    <F12>   <Esc>:q<CR>
cmap    <F12>   <Esc><Esc>:q<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap    <S-F3> :call MyHlSearch()<CR>
imap    <S-F3> <Esc>:call MyHlSearch()<CR>
vmap    <S-F3> <Esc>:call MyHlSearch()<CR>gv

"" F4 -- просмотр ошибок
"nmap    <F8>    :copen<CR>
"imap    <F8>    <esc>:copen<CR>
"vmap    <F8>    <esc>:copen<CR>

" переход к следующей/предыдущей ошибке + развернуть fold + в центр экрана + сообщение об ошибке
map     <C-F8>  :cn<CR>zvzz:cc<CR>
map     <S-F8>  :cp<CR>zvzz:cc<CR>
imap    <F3>    <Esc>:set spell!<CR>
nmap    <F3>    <Esc>:set spell!<CR>
if ('gui')
    source $MYGVIMRC
endif

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
setlocal spell

set switchbuf=newtab

"autocmd vimenter * NERDTree
"autocmd vimenter * TagbarToggle

let paneopened=0
let paneopened2=0

function! SetProject()
    :!tmux split-window -h && tmux send-keys -t .1 "cd common" Enter && tmux split-window -t 1 -v && tmux send-keys -t.2 "cd bin" Enter
endfunction

function! Makefpo()
    :!tmux send-keys -t .1 "cd ../common" Enter "make -f makefile.gnu clean-all" Enter "make -f makefile.gnu fpo217" Enter "date" Enter
endfunction

function! RunFPO()
    :!tmux send-keys -t .2 "cd ./bin" Enter "cp ../../regserv.xml ." Enter "./regservm start" Enter "cp ~/libtypical/* ../lib/" cp Enter "./FPO217" Enter
endfunction

function! KillFPO()
    :!tmux send-keys -t .2 C-c Enter "cd ../" Enter
endfunction

"Показать NERDTree по нажатию F3
map <F1> :NERDTreeToggle<CR>
"Показать Tagbar по нажатию F3
map <F2> :TagbarToggle<CR>
"This mapping uses <cword> to get the word under the cursor, and searches for it in the current directory and all subdirectories, opening the quickfix window when done:
map <F4> :execute "vimgrep /\\" . expand("<cword>") . "/j **/*.{cpp,h,py,tex,txt}" <Bar> cw<CR>
"искать строку по команде Search среди файлов с расширениями cpp, h, py, tex, txt
command -nargs=1 Search vimgrep /<args>/gj ./**/*.{cpp,h,py,tex,txt} <Bar> cw
"map<F5> :new !cd ~/src77ya6vp-fpo/common && export RTSET_ROOT=~/7mcf3 && make -f makefile.gnu fpo217 <Bar>  <enter>
map<F5> :call Makefpo() <enter>
map<F6> :call RunFPO() <enter>
map<F7> :call SetProject() <enter>
map<F8> :call KillFPO() <enter>

