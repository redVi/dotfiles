"Включаем распознавание типов файлов и типо-специфичные плагины:
filetype on
filetype plugin on
"Настройки табов для Python, согласно рекоммендациям
set tabstop=4 
set shiftwidth=4
set smarttab
set expandtab "Ставим табы пробелами
set softtabstop=4 "4 пробела в табе
"Автоотступ
set autoindent
"Подсвечиваем все
let python_highlight_all = 1
"Включаем 256 цветов в терминале
"Нужно во многих терминалах, например в gnome-terminal
set t_Co=256
"Перед сохранением вырезаем пробелы на концах (только в .py файлах)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
"В .py файлах включаем умные отступы после ключевых слов
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"Автодополнение кавычек
:inoremap " ""<LEFT>
:inoremap ' ''<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
imap { {}<LEFT>
imap < <><LEFT>
"Тёмный background терминала
set background=dark
"Отображать символы табуляции
set list lcs=tab:>-,nbsp:-
"fdm, foldopen
set fdm=syntax
set foldopen=all
syntax on "Включить подсветку синтаксиса
set nu "Включить нумерацию строк
set mousehide "Спрятать курсор мыши при наборе текста
set termencoding=utf-8 "Кодировка терминала
set novisualbell "Отключить мигание
set t_vb= "Отключить beep
"Удобное поведение backspace
set backspace=indent,eol,start whichwrap+=<,>,[,]
"Отключаем черты на табах
set showtabline=0
"Колоночка, чтобы показывать плюсики для скрытия блоков кода:
"set foldcolumn=1
"Переносим на другую строчку, разрываем строки
set wrap
set linebreak
"Вырубаем .swp и ~ (резервные) файлы
set nobackup
set noswapfile
set encoding=utf-8 " Кодировка файлов по умолчанию
set fileencodings=utf8,cp1251 " Возможные кодировки файлов, если файл не в unicode кодировке,
" то будет использоваться cp1251
" Цветовая схема из ~/.vim/colors/
:colorscheme darkdevil
"Плагины
"Компиляция скрипто питона с плагином http://www.vim.org/scripts/script.php?script_id=1439
"Для запуска положить в ~/.vim/compiler и запустить :make
":clist посмотреть полный список ошибок компиляции
":cnext переход к следующей ошибке
autocmd BufNewFile,BufRead *.py compiler python
"Для просмотра файловой системы вволим :Vex
"Плагин Project http://www.vim.org/scripts/script.php?script_id=69
"Распаковать в ~/.vim/
"Запустить командой :Project
"VIM TEMPLATES http://www.vim.org/scripts/script.php?script_id=2834
"создать .vim/templates/template.* с необходимыми шаблонами
:autocmd BufNewFile  *.py      0r ~/.vim/templates/template.py
:autocmd BufNewFile  *.html      0r ~/.vim/templates/template.html
