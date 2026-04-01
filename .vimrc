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

if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    " Let dein manage dein
    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

    call dein#add('Shougo/neosnippet.vim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('Shougo/neosnippet-snippets')
    call dein#add('flazz/vim-colorschemes')
    call dein#add('scrooloose/syntastic')
    call dein#add('scrooloose/nerdtree')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('majutsushi/tagbar')
    call dein#add('jlfwong/vim-mercenary')
    call dein#add('dense-analysis/ale')
    call dein#add('tpope/vim-fugitive')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('junegunn/gv.vim', {'depends': 'fugitive'})
    call dein#end()
    call dein#save_state()
endif

" install not installed plugins on startup.

if dein#check_install()
  call dein#install()
endif


" Настройки ALE (после dein#end())
let g:ale_linters = {
            \ 'python': ['flake8', 'mypy', 'ruff', 'pylsp'],
            \ 'cpp': ['clangtidy', 'cppcheck'],
            \ 'c': ['clangtidy', 'cppcheck']
            \ }

let g:ale_fixers = {
            \ '*': ['remove_trailing_lines', 'trim_whitespace'],
            \ 'python': ['black', 'isort'],
            \ 'cpp': ['clang-format'],
            \ 'c': ['clang-format']
            \ }

let g:ale_fix_on_enter = 1
let g:ale_lint_on_text_changed = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚠'

" Навигация по ошибкам
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" ALE команды
nmap <silent> <C-b> <Plug>(ale_go_to_definition)
nmap <silent> <C-t> <Plug>(ale_go_to_type_definition)
nmap <silent> <C-f> :ALEFix<CR>

set nocompatible
filetype plugin indent on
set hidden               " Не выгружать буфер когда переключаешься на другой
"Настройка буферов set autowrite            " Записывать всё перед изменением
"Подключение мыши
set mouse=a
"if has('mouse')
    "set mouse=a
"endif

" режим вставки из внешних источников
set pastetoggle=<F10>

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

" for cpy
autocmd FileType py set textwidth=78 foldmethod=marker tabstop=4 shiftwidth=4 softtabstop=4 expandtab

" for cpp
autocmd FileType cpp set foldmethod=indent textwidth=78 softtabstop=4 shiftwidth=4 tabstop=4 expandtab

autocmd FileType xml set textwidth=178 foldmethod=indent
autocmd FileType qml set textwidth=78 foldmethod=indent

autocmd FileType html set textwidth=178 foldmethod=indent tabstop=4 softtabstop=2 shiftwidth=4
autocmd FileType js set textwidth=178 foldmethod=indent tabstop=4 softtabstop=2 shiftwidth=4

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
"imap    <F3>    <Esc>:set spell!<CR>
"nmap    <F3>    <Esc>:set spell!<CR>
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

function! SetProjectTwoScreens()
    let g:is_one_screen=0
    :!urxvt -T "launch_board" -e zsh -c "tmux new-session -s launch \\; send-keys -t 0 'cd ~/Downloads/Emulator\\ Nord' Enter \\; send-keys -t 0 'wmctrl -r launch_board -e 0,1920,0,800,600' Enter \\; split-window -h \\; send-keys -t 1 'cd ~/testing' Enter \\; split-window -v -t 1 \\; send-keys -t 2 'cd ~/testing' Enter \\; split-window -v -t 2 \\; send-keys -t 3 'cd ~/testing' Enter \\; select-pane -t 0" &
endfunction

function! SetProject(emulator_on)
    if a:emulator_on
        :!tmux split-window -h && tmux send-keys -t .1 "cd ~/projects/trip" Enter && tmux split-window -t .1 -v && tmux send-keys -t .2 "cd ~/Downloads/Emulator\\ Nord" Enter
    else
        :!tmux split-window -h && tmux send-keys -t .1 "cd ~/projects/trip" Enter
    endif
endfunction

function! Makefpo()
    :rightbelow vertical terminal ++close zsh -c "source ~/py_environments/radar_envy/bin/activate; source /opt/ros/humble/setup.zsh; ./build.sh; echo Build completed. Press Enter to close...; read; exit"
endfunction

function! MakefpoCLANG()
    :!tmux send-keys -t .1  "make -f makefile.gnu clean-all" Enter "make -f makefile.gnu fpo217 CXX=clang++ CC=clang SANITIZE=yes" Enter
endfunction

function! RunFPO()
    :!tmux send-keys -t .2 "./server -e 0 -f nord_17-57-37_17-10-2024_patched.bin" Enter
    :!tmux send-keys -t .1 "source /home/aeryn/projects/radar/install/setup.zsh" Enter 'export RCUTILS_CON SOLE_OUTPUT_FORMAT="[{time}] [{name}:]: {message}"' Enter "ros2 launch radar_gui radar_gui.launch.py" Enter
endfunction

function! KillFPO()
    :!tmux send-keys -t .1 C-c Enter
    :!tmux send-keys -t .2 C-c Enter
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
map<F7> :call SetProject(1) <enter>
map<F8> :call KillFPO() <enter>
map<F9> :call MakefpoCLANG() <enter>
