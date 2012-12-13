" Darkdevil Vim color scheme
"
" Name:    darkdevil
" Autor:   redVi (based on "darkdevel" Hallison Batista's )
" Version: 
" Release: 
" License: Vim License

highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name   = "darkdevil"
let s:config        = {}
let s:config.colors = &t_Co


" General settings
" ================
"set background=dark
if v:version > 700
  set cursorline
  "set cursorcolumn
endif

let s:config.plain     = "term=NONE   cterm=NONE   gui=NONE"
let s:config.bold      = "term=bold   cterm=bold   gui=bold"
let s:config.emphasis  = "term=italic cterm=italic gui=italic"
let s:config.underline = "term=underline cterm=underline gui=underline"

let s:brightness = { 'cterm': 'White'    , 'gui': '#FFFFFF' }
let s:darkness   = { 'cterm': 'Black'    , 'gui': '#000000' }
let s:backward   = { 'cterm': 'DarkGray' , 'gui': '#121212' }
let s:forefront  = { 'cterm': 'Gray'     , 'gui': '#767676' }

let s:processor  = { 'cterm': 'DarkBlue' , 'gui': '#000087' }
let s:identifier = { 'cterm': 'DarkCyan' , 'gui': '#00afaf' }
let s:statement  = { 'cterm': 'Brown'    , 'gui': '#af5f00' }
let s:keyword    = { 'cterm': 'Brown'    , 'gui': '#5f5f00' }
let s:type       = { 'cterm': 'DarkRed'  , 'gui': '#af0000' }
let s:operator   = { 'cterm': 'HotPink3'   , 'gui': '#af5f87'}
let s:function   = { 'cterm': 'Yellow'   , 'gui': '#dfaf00' }
let s:string     = { 'cterm': 'SkyBlue2', 'gui': '#87afff' }

let s:message    = { 'cterm': 'DarkViolet'    , 'gui': '#8700d7' }
let s:error      = { 'cterm': 'Red'      , 'gui': '#df0000' }
let s:warning    = { 'cterm': 'Yellow'   , 'gui': '#ffdf00' }

if s:config.colors == 256
  let s:brightness.cterm = 255
  let s:darkness.cterm   = 0
  let s:backward.cterm   = 233
  let s:forefront.cterm  = 244

  let s:processor.cterm  = 18
  let s:identifier.cterm = 37
  let s:statement.cterm  = 130
  let s:keyword.cterm    = 58
  let s:type.cterm       = 124
  let s:operator.cterm   = 132
  let s:function.cterm   = 178
  let s:string.cterm     = 111

  let s:message.cterm    = 92
  let s:error.cterm      = 160
  let s:warning.cterm    = 220
endif

execute "highlight Cursor       ".s:config.plain." ctermfg=".s:darkness.cterm  ." ctermbg=".s:brightness.cterm." guifg=".s:darkness.gui   ." guibg=".s:brightness.gui
execute "highlight CursorColumn ".s:config.plain." ctermfg=NONE                   ctermbg=".s:backward.cterm  ." guifg=NONE                  guibg=".s:backward.gui
execute "highlight CursorLine   ".s:config.plain." ctermfg=NONE                   ctermbg=".s:backward.cterm  ." guifg=NONE                  guibg=".s:backward.gui
execute "highlight DiffAdd      ".s:config.plain." ctermfg=".s:message.cterm   ." ctermbg=NONE                   guifg=".s:message.gui    ." guibg=NONE"
execute "highlight DiffDelete   ".s:config.plain." ctermfg=".s:error.cterm     ." ctermbg=NONE                   guifg=".s:error.gui      ." guibg=NONE"
execute "highlight DiffChange   ".s:config.plain." ctermfg=".s:warning.cterm   ." ctermbg=NONE                   guifg=".s:warning.gui    ." guifg=NONE"
execute "highlight ErrorMsg     ".s:config.plain." ctermfg=".s:error.cterm     ." ctermbg=NONE                   guifg=".s:error.gui      ." guibg=NONE"
execute "highlight WarningMsg   ".s:config.plain." ctermfg=".s:warning.cterm   ." ctermbg=NONE                   guifg=".s:warning.gui    ." guibg=NONE"
execute "highlight ModeMsg      ".s:config.plain." ctermfg=".s:brightness.cterm." ctermbg=NONE                   guifg=".s:brightness.gui ." guibg=NONE"
execute "highlight MoreMsg      ".s:config.plain." ctermfg=".s:message.cterm   ." ctermbg=NONE                   guifg=".s:message.cterm  ." guibg=NONE"
execute "highlight VertSplit    ".s:config.plain." ctermfg=".s:forefront.cterm ." ctermbg=".s:forefront.cterm ." guifg=".s:forefront.gui  ." guibg=".s:forefront.gui
execute "highlight Folded       ".s:config.plain." ctermfg=".s:forefront.cterm ." ctermbg=".s:backward.cterm  ." guifg=".s:forefront.gui  ." guibg=".s:backward.gui
execute "highlight LineNr       ".s:config.plain." ctermfg=".s:forefront.cterm ." ctermbg=".s:backward.cterm  ." guifg=".s:forefront.gui  ." guibg=".s:backward.gui
execute "highlight NonText      ".s:config.plain." ctermfg=".s:forefront.cterm ." ctermbg=NONE                   guifg=".s:forefront.gui  ." guibg=".s:darkness.gui
execute "highlight Normal       ".s:config.plain." ctermfg=".s:brightness.cterm." ctermbg=NONE                  guifg=".s:brightness.gui  ." guibg=".s:darkness.gui
execute "highlight Pmenu        ".s:config.plain." ctermfg=".s:forefront.cterm ." ctermbg=".s:backward.cterm  ." guifg=".s:brightness.gui ." guibg=".s:backward.gui
execute "highlight PmenuSel     ".s:config.plain." ctermfg=".s:backward.cterm  ." ctermbg=".s:forefront.cterm ." guifg=".s:backward.gui   ." guibg=".s:forefront.gui
execute "highlight PmenuSbar    ".s:config.plain." ctermfg=NONE                   ctermbg=".s:backward.cterm  ." guifg=NONE                  guibg=".s:forefront.gui
execute "highlight PmenuThumb   ".s:config.plain." ctermfg=".s:forefront.cterm ." ctermbg=NONE                   guifg=".s:forefront.gui  ." guibg=NONE"
execute "highlight StatusLine   ".s:config.bold ." ctermfg=".s:backward.cterm  ." ctermbg=".s:forefront.cterm ." guifg=".s:backward.gui   ." guibg=".s:forefront.gui.""
execute "highlight StatusLineNC ".s:config.bold ." ctermfg=NONE                   ctermbg=".s:backward.cterm  ." guifg=".s:forefront.gui  ." guibg=".s:backward.gui
execute "highlight Title        ".s:config.plain." ctermfg=".s:forefront.cterm ." ctermbg=NONE                   guifg=".s:forefront.gui  ." guibg=NONE"
execute "highlight Visual       ".s:config.plain." ctermfg=".s:brightness.cterm." ctermbg=".s:processor.cterm ." guifg=".s:brightness.gui ." guibg=".s:processor.gui
execute "highlight VisualNOS    ".s:config.plain." ctermfg=NONE                   ctermbg=".s:string.cterm    ." guifg=NONE                  guibg=".s:string.gui
execute "highlight WildMenu     ".s:config.plain." ctermfg=NONE                   ctermbg=".s:backward.cterm  ." guifg=".s:forefront.gui  ." guibg=".s:backward.gui
execute "highlight Constant     ".s:config.plain." ctermfg=".s:identifier.cterm." ctermbg=NONE                   guifg=".s:identifier.gui ." guibg=NONE"
execute "highlight Identifier   ".s:config.plain." ctermfg=".s:identifier.cterm." ctermbg=NONE                   guifg=".s:identifier.gui ." guibg=NONE"
execute "highlight Statement    ".s:config.plain." ctermfg=".s:statement.cterm ." ctermbg=NONE                   guifg=".s:statement.gui  ." guibg=NONE"
execute "highlight Keyword      ".s:config.plain." ctermfg=".s:keyword.cterm   ." ctermbg=NONE                   guifg=".s:keyword.gui    ." guibg=NONE"
execute "highlight Function     ".s:config.plain." ctermfg=".s:function.cterm  ." ctermbg=NONE                   guifg=".s:function.gui   ." guibg=NONE"
execute "highlight Comment      ".s:config.plain." ctermfg=".s:forefront.cterm ." ctermbg=NONE                   guifg=".s:forefront.gui  ." guibg=NONE"
execute "highlight Type         ".s:config.plain." ctermfg=".s:type.cterm      ." ctermbg=NONE                   guifg=".s:type.gui       ." guibg=NONE"
execute "highlight Operator     ".s:config.plain." ctermfg=".s:operator.cterm  ." ctermbg=NONE                   guifg=".s:operator.gui   ." guibg=NONE"
execute "highlight String       ".s:config.plain." ctermfg=".s:string.cterm    ." ctermbg=NONE                   guifg=".s:string.gui     ." guibg=NONE"
execute "highlight Character    ".s:config.plain." ctermfg=".s:identifier.cterm." ctermbg=NONE                   guifg=".s:identifier.gui ." guibg=NONE"
execute "highlight Number       ".s:config.plain." ctermfg=".s:string.cterm    ." ctermbg=NONE                   guifg=".s:string.gui     ." guibg=NONE"
execute "highlight Boolean      ".s:config.plain." ctermfg=".s:identifier.cterm." ctermbg=NONE                   guifg=".s:identifier.gui ." guibg=NONE"
execute "highlight Float        ".s:config.plain." ctermfg=".s:string.cterm    ." ctermbg=NONE                   guifg=".s:string.gui     ." guibg=NONE"
execute "highlight PreProc      ".s:config.plain." ctermfg=".s:identifier.cterm." ctermbg=NONE                   guifg=".s:identifier.gui ." guibg=NONE"
execute "highlight Include      ".s:config.plain." ctermfg=".s:statement.cterm ." ctermbg=NONE                   guifg=".s:statement.gui  ." guibg=NONE"
execute "highlight SpecialKey   ".s:config.plain." ctermfg=".s:backward.cterm  ." ctermbg=NONE                   guifg=".s:backward.gui   ." guibg=NONE"

execute "highlight htmlTitle    ".s:config.bold

highlight link xmlTag       Statement
highlight link xmlTagName   Statement
highlight link xmlEndTag    Statement

highlight link htmlTag      xmlTag
highlight link htmlTagName  xmlTagName
highlight link htmlEndTag   xmlEndTag
highlight link htmlH1       htmlTitle

highlight link Conditional  Statement
highlight link Repeat       Statement
highlight link Label        Statement
highlight link Exception    Statement
highlight link Define       Include
highlight link Macro        Include
highlight link PreCondit    Include
highlight link StorageClass Type
highlight link Structure    Type
highlight link Typedef      Type
highlight link Special      SpecialKey

highlight link rubyBlockParameter        Normal
highlight link rubyClass                 Normal
highlight link rubyConstant              Type
highlight link rubyInstanceVariable      Identifier
highlight link rubyInterpolation         Operator
highlight link rubyLocalVariableOrMethod Identifier
highlight link rubyPredefinedConstant    Type
highlight link rubyPseudoVariable        Identifier
highlight link rubyStringDelimiter       Operator
highlight link rubyDoBlock               Statement
highlight link rubyControl               Statement

"highlight DiffText  
"highlight CursorIM
"highlight Directory
"highlight FoldColumn
"highlight SignColumn
"highlight IncSearch
"highlight MatchParen
"highlight Question
"highlight Search
"highlight Error                     guifg=s:brightness.gui   guibg=#990000
"highlight SpellBad
"highlight SpellCap
"highlight SpellLocal
"highlight SpellRare
"highlight TabLine
"highlight TabLineFill
"highlight TabLineSel
" Win32 specific style
" --------------------
"highlight Menu
"highlight Scrollbar
"highlight Tooltip
"highlight SpecialChar     
"highlight Tag             
"highlight Delimiter       
"highlight SpecialComment  
"highlight Debug           
"highlight Underlined 
"highlight Ignore     
"highlight Error      
"highlight Todo       
"highlight shTest
"highlight shCase
"highlight shCaseExSingleQuote
"highlight shCaseEsac
"highlight shDo
"highlight shExpr
"highlight shFor
"highlight shIf
"highlight shSubSh
"highlight shComma
"highlight shDerefVarArray
"highlight shDblBrace
"highlight shSpecialVar
"highlight shDblParen
"highlight shCurlyIn
"highlight bashSpecialVariables
"highlight bashStatement
"highlight bashAdminStatement
"highlight kshSpecialVariables
"highlight kshStatement
"highlight shSetIdentifier
"highlight shFunctionTwo
"highlight shFunctionStart
"highlight shFunctionOne
"highlight shDerefPattern
"highlight shDerefEscape
"highlight shDerefPPSleft
"highlight shDerefPPSright
"highlight shCaseEsacSync
"highlight shDoSync
"highlight shForSync
"highlight shIfSync
"highlight shUntilSync
"highlight shWhileSync

if s:config.colors <= 16
  highlight Comment    ctermfg=DarkGray
  highlight CursorLine term=underline cterm=underline ctermbg=NONE
endif
