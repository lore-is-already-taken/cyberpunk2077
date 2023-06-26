" -----------------------------------------------------------------------------
" File: cyberpunk2077.vim
" Description: Retro groove color scheme for Vim
" Author: morhetz <morhetz@gmail.com>
" Source: https://github.com/morhetz/cyberpunk2077
" Last Modified: 12 Aug 2017
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{

if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='cyberpunk2077'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}


"
" Global Settings: {{{

if !exists('g:cyberpunk2077_bold')
  let g:cyberpunk2077_bold=1
endif
if !exists('g:cyberpunk2077_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:cyberpunk2077_italic=1
  else
    let g:cyberpunk2077_italic=0
  endif
endif
if !exists('g:cyberpunk2077_undercurl')
  let g:cyberpunk2077_undercurl=1
endif
if !exists('g:cyberpunk2077_underline')
  let g:cyberpunk2077_underline=1
endif
if !exists('g:cyberpunk2077_inverse')
  let g:cyberpunk2077_inverse=1
endif

if !exists('g:cyberpunk2077_guisp_fallback') || index(['fg', 'bg'], g:cyberpunk2077_guisp_fallback) == -1
  let g:cyberpunk2077_guisp_fallback='NONE'
endif

if !exists('g:cyberpunk2077_improved_strings')
  let g:cyberpunk2077_improved_strings=0
endif

if !exists('g:cyberpunk2077_improved_warnings')
  let g:cyberpunk2077_improved_warnings=0
endif

if !exists('g:cyberpunk2077_termcolors')
  let g:cyberpunk2077_termcolors=256
endif

if !exists('g:cyberpunk2077_invert_indent_guides')
  let g:cyberpunk2077_invert_indent_guides=0
endif

if exists('g:cyberpunk2077_contrast')
  echo 'g:cyberpunk2077_contrast is deprecated; use g:cyberpunk2077_contrast_light and g:cyberpunk2077_contrast_dark instead'
endif

if !exists('g:cyberpunk2077_contrast_dark')
  let g:cyberpunk2077_contrast_dark='medium'
endif

if !exists('g:cyberpunk2077_contrast_light')
  let g:cyberpunk2077_contrast_light='medium'
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{
let s:cp = {}

let s:cp.background = ['#030d22',1]
let s:cp.pink = ['#ff2cf1',1]
let s:cp.dark_pink = ['#ff2e97',1]
let s:cp.orange = ['#ffd400',1]
let s:cp.dark_blue = ['#0098df',1]
let s:cp.light_blue = ['#0ef3ff',1]
let s:cp.soft_blue = ['#3ec8ff',1]
let s:cp.white = ['#fdfeff',1]



" setup palette dictionary
let s:gb = {}

" fill it with absolute colors

let s:gb.dark0_hard = ['#030D22', 1]
let s:gb.dark0 = ['#030d22', 1]
let s:gb.dark0_soft = ['#1A1079', 1]
let s:gb.dark1 = ['#310072', 1]
let s:gb.dark2 = ['#171033', 1]
let s:gb.dark3 = ['#120961', 1]
let s:gb.dark4 = ['#0E0952', 1]
let s:gb.dark4_256 = ['#06113B', 1]
let s:gb.gray_245 = ['#440083', 1]
let s:gb.gray_244 = ['#35008B', 1]
let s:gb.light0_hard = ['#E4EEFF', 1]
let s:gb.light0 = ['#F2F8FF', 1]
let s:gb.light0_soft = ['#E1EFFF', 1]
let s:gb.light1 = ['#D600DD', 1]
let s:gb.light2 = ['#FF15EF', 1]
let s:gb.light3 = ['#FF25F0', 1]
let s:gb.light4 = ['#FF0081', 1]
let s:gb.light4_256 = ['#EC0076', 1]
let s:gb.bright_red = ['#FF0081', 1]
let s:gb.bright_green = ['#06AD00', 1]
let s:gb.bright_yellow = ['#FFD400', 1]
let s:gb.bright_blue = ['#1183B8', 1]
let s:gb.bright_purple = ['#A83DFF', 1]
let s:gb.bright_aqua = ['#0EF3FF', 1]
let s:gb.bright_orange = ['#FFD400', 1]
let s:gb.neutral_red = ['#D31B77', 1]
let s:gb.neutral_green = ['#3DD69C', 1]
let s:gb.neutral_yellow = ['#FFD400', 1]
let s:gb.neutral_blue = ['#063475', 1]
let s:gb.neutral_purple = ['#9E0A52', 1]
let s:gb.neutral_aqua = ['#0AB2FA', 1]
let s:gb.neutral_orange = ['#FF8C00', 1]
let s:gb.faded_red = ['#D31B77', 1]
let s:gb.faded_green = ['#67B3FF', 1]
let s:gb.faded_yellow = ['#FDD81D', 1]
let s:gb.faded_blue = ['#003496', 1]
let s:gb.faded_purple = ['#AF21E7', 1]
let s:gb.faded_aqua = ['#3E8EFD', 1]
let s:gb.faded_orange = ['#EC8000', 1]



" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:cyberpunk2077_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:cyberpunk2077_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:cyberpunk2077_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:cyberpunk2077_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:cyberpunk2077_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:gb.dark0
  if g:cyberpunk2077_contrast_dark == 'soft'
    let s:bg0  = s:gb.dark0_soft
  elseif g:cyberpunk2077_contrast_dark == 'hard'
    let s:bg0  = s:gb.dark0_hard
  endif

  let s:bg1  = s:gb.dark1
  let s:bg2  = s:gb.dark2
  let s:bg3  = s:gb.dark3
  let s:bg4  = s:gb.dark4

  let s:gray = s:gb.gray_245

  let s:fg0 = s:gb.light0
  let s:fg1 = s:gb.light1
  let s:fg2 = s:gb.light2
  let s:fg3 = s:gb.light3
  let s:fg4 = s:gb.light4

  let s:fg4_256 = s:gb.light4_256

  let s:red    = s:gb.bright_red
  let s:green  = s:gb.bright_green
  let s:yellow = s:gb.bright_yellow
  let s:blue   = s:gb.bright_blue
  let s:purple = s:gb.bright_purple
  let s:aqua   = s:gb.bright_aqua
  let s:orange = s:gb.bright_orange
  let s:pink = s:cp.pink
  let s:white = s:cp.white

else
  let s:bg0  = s:gb.light0
  if g:cyberpunk2077_contrast_light == 'soft'
    let s:bg0  = s:gb.light0_soft

  elseif g:cyberpunk2077_contrast_light == 'hard'
    let s:bg0  = s:gb.light0_hard

  endif

  let s:bg1  = s:gb.light1
  let s:bg2  = s:gb.light2
  let s:bg3  = s:gb.light3
  let s:bg4  = s:gb.light4

  let s:gray = s:gb.gray_244

  let s:fg0 = s:gb.dark0
  let s:fg1 = s:gb.dark1
  let s:fg2 = s:gb.dark2
  let s:fg3 = s:gb.dark3
  let s:fg4 = s:gb.dark4

  let s:fg4_256 = s:gb.dark4_256

  let s:red    = s:gb.faded_red
  let s:green  = s:gb.faded_green
  let s:yellow = s:gb.faded_yellow
  let s:blue   = s:gb.faded_blue
  let s:purple = s:gb.faded_purple
  let s:aqua   = s:gb.faded_aqua
  let s:orange = s:gb.faded_orange
endif

" reset to 16 colors fallback
if g:cyberpunk2077_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:gb.bg0 = s:bg0
let s:gb.bg1 = s:bg1
let s:gb.bg2 = s:bg2
let s:gb.bg3 = s:bg3
let s:gb.bg4 = s:bg4

let s:gb.gray = s:gray

let s:gb.fg0 = s:fg0
let s:gb.fg1 = s:fg1
let s:gb.fg2 = s:fg2
let s:gb.fg3 = s:fg3
let s:gb.fg4 = s:fg4

let s:gb.fg4_256 = s:fg4_256

let s:gb.red    = s:red
let s:gb.green  = s:green
let s:gb.yellow = s:yellow
let s:gb.blue   = s:blue
let s:gb.purple = s:purple
let s:gb.aqua   = s:aqua
let s:gb.orange = s:orange

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:gb.neutral_red[0]
  let g:terminal_color_9 = s:red[0]

  let g:terminal_color_2 = s:gb.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:gb.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4 = s:gb.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:gb.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:gb.neutral_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:cyberpunk2077_hls_cursor')
  let s:hls_cursor = get(s:gb, g:cyberpunk2077_hls_cursor)
endif

let s:number_column = s:none
if exists('g:cyberpunk2077_number_column')
  let s:number_column = get(s:gb, g:cyberpunk2077_number_column)
endif

let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:cyberpunk2077_sign_column')
    let s:sign_column = get(s:gb, g:cyberpunk2077_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:cyberpunk2077_color_column')
  let s:color_column = get(s:gb, g:cyberpunk2077_color_column)
endif

let s:vert_split = s:bg0
if exists('g:cyberpunk2077_vert_split')
  let s:vert_split = get(s:gb, g:cyberpunk2077_vert_split)
endif

let s:invert_signs = ''
if exists('g:cyberpunk2077_invert_signs')
  if g:cyberpunk2077_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:cyberpunk2077_invert_selection')
  if g:cyberpunk2077_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:cyberpunk2077_invert_tabline')
  if g:cyberpunk2077_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:cyberpunk2077_italicize_comments')
  if g:cyberpunk2077_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:cyberpunk2077_italicize_strings')
  if g:cyberpunk2077_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:cyberpunk2077_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:cyberpunk2077_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction

" }}}
" cyberpunk2077 Hi Groups: {{{

" memoize common hi groups
call s:HL('cyberpunk2077Fg0', s:fg0)
call s:HL('cyberpunk2077Fg1', s:fg1)
call s:HL('cyberpunk2077Fg2', s:fg2)
call s:HL('cyberpunk2077Fg3', s:fg3)
call s:HL('cyberpunk2077Fg4', s:fg4)
call s:HL('cyberpunk2077Gray', s:gray)
call s:HL('cyberpunk2077Bg0', s:bg0)
call s:HL('cyberpunk2077Bg1', s:bg1)
call s:HL('cyberpunk2077Bg2', s:bg2)
call s:HL('cyberpunk2077Bg3', s:bg3)
call s:HL('cyberpunk2077Bg4', s:bg4)

call s:HL('cyberpunk2077Red', s:red)
call s:HL('cyberpunk2077RedBold', s:red, s:none, s:bold)
call s:HL('cyberpunk2077Green', s:green)
call s:HL('cyberpunk2077GreenBold', s:green, s:none, s:bold)
call s:HL('cyberpunk2077Yellow', s:yellow)
call s:HL('cyberpunk2077YellowBold', s:yellow, s:none, s:bold)
call s:HL('cyberpunk2077Blue', s:blue)
call s:HL('cyberpunk2077BlueBold', s:blue, s:none, s:bold)
call s:HL('cyberpunk2077Purple', s:purple)
call s:HL('cyberpunk2077PurpleBold', s:purple, s:none, s:bold)
call s:HL('cyberpunk2077Aqua', s:aqua)
call s:HL('cyberpunk2077AquaBold', s:aqua, s:none, s:bold)
call s:HL('cyberpunk2077Orange', s:orange)
call s:HL('cyberpunk2077OrangeBold', s:orange, s:none, s:bold)

call s:HL('cyberpunk2077RedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('cyberpunk2077GreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('cyberpunk2077YellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('cyberpunk2077BlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('cyberpunk2077PurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('cyberpunk2077AquaSign', s:aqua, s:sign_column, s:invert_signs)
call s:HL('cyberpunk2077OrangeSign', s:orange, s:sign_column, s:invert_signs)

" }}}
call s:HL('cyberpunk2077PinkCursive',s:pink, )
call s:HL('pene',s:white, )

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text
call s:HL('Normal', s:fg1, s:bg0)

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
" --- https://github.com/morhetz/cyberpunk2077/issues/7
if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:yellow, s:bg1)
endif

hi! link NonText cyberpunk2077Bg2
hi! link SpecialKey cyberpunk2077Bg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory cyberpunk2077GreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title cyberpunk2077GreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg cyberpunk2077YellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg cyberpunk2077YellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question cyberpunk2077OrangeBold
" Warning messages
hi! link WarningMsg cyberpunk2077RedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:cyberpunk2077_improved_strings == 0
  hi! link Special cyberpunk2077Orange
else
  call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement cyberpunk2077Red
" if, then, else, endif, swicth, etc.
hi! link Conditional cyberpunk2077Red
" for, do, while, etc.
hi! link Repeat cyberpunk2077Red
" case, default, etc.
hi! link Label cyberpunk2077Red
" try, catch, throw
hi! link Exception cyberpunk2077Red
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword cyberpunk2077Red

" Variable name
hi! link Identifier cyberpunk2077Blue
" Function name
hi! link Function cyberpunk2077GreenBold

" Generic preprocessor
hi! link PreProc cyberpunk2077Aqua
" Preprocessor #include
hi! link Include cyberpunk2077Aqua
" Preprocessor #define
hi! link Define cyberpunk2077Aqua
" Same as Define
hi! link Macro cyberpunk2077Aqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit cyberpunk2077Aqua

" Generic constant
hi! link Constant cyberpunk2077Purple
" Character constant: 'c', '/n'
hi! link Character cyberpunk2077Purple
" String constant: "this is a string"
if g:cyberpunk2077_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean cyberpunk2077Purple
" Number constant: 234, 0xff
hi! link Number cyberpunk2077Purple
" Floating point constant: 2.3e10
hi! link Float cyberpunk2077Purple

" Generic type
hi! link Type cyberpunk2077Yellow
" static, register, volatile, etc
hi! link StorageClass cyberpunk2077Orange
" struct, union, enum, etc.
hi! link Structure cyberpunk2077Aqua
" typedef
hi! link Typedef cyberpunk2077Yellow

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:cyberpunk2077_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link Sneak Search
hi! link SneakLabel Search

" }}}
" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:cyberpunk2077_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

" }}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue', '#458588'], ['magenta', '#b16286'],
      \ ['red',  '#cc241d'], ['166',     '#d65d0e']
    \ ]
endif

let g:rainbow_guifgs = [ '#d65d0e', '#cc241d', '#b16286', '#458588' ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd cyberpunk2077GreenSign
hi! link GitGutterChange cyberpunk2077AquaSign
hi! link GitGutterDelete cyberpunk2077RedSign
hi! link GitGutterChangeDelete cyberpunk2077AquaSign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile cyberpunk2077Green
hi! link gitcommitDiscardedFile cyberpunk2077Red

" }}}
" Signify: {{{

hi! link SignifySignAdd cyberpunk2077GreenSign
hi! link SignifySignChange cyberpunk2077AquaSign
hi! link SignifySignDelete cyberpunk2077RedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign cyberpunk2077RedSign
hi! link SyntasticWarningSign cyberpunk2077YellowSign

" }}}
" Signature: {{{
hi! link SignatureMarkText   cyberpunk2077BlueSign
hi! link SignatureMarkerText cyberpunk2077PurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl cyberpunk2077BlueSign
hi! link ShowMarksHLu cyberpunk2077BlueSign
hi! link ShowMarksHLo cyberpunk2077BlueSign
hi! link ShowMarksHLm cyberpunk2077BlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch cyberpunk2077Yellow
hi! link CtrlPNoEntries cyberpunk2077Red
hi! link CtrlPPrtBase cyberpunk2077Bg2
hi! link CtrlPPrtCursor cyberpunk2077Blue
hi! link CtrlPLinePre cyberpunk2077Bg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket cyberpunk2077Fg3
hi! link StartifyFile cyberpunk2077Fg1
hi! link StartifyNumber cyberpunk2077Blue
hi! link StartifyPath cyberpunk2077Gray
hi! link StartifySlash cyberpunk2077Gray
hi! link StartifySection cyberpunk2077Yellow
hi! link StartifySpecial cyberpunk2077Bg2
hi! link StartifyHeader cyberpunk2077Orange
hi! link StartifyFooter cyberpunk2077Bg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign cyberpunk2077RedSign
hi! link ALEWarningSign cyberpunk2077YellowSign
hi! link ALEInfoSign cyberpunk2077BlueSign

" }}}
" Dirvish: {{{

hi! link DirvishPathTail cyberpunk2077Aqua
hi! link DirvishArg cyberpunk2077Yellow

" }}}
" Netrw: {{{

hi! link netrwDir cyberpunk2077Aqua
hi! link netrwClassify cyberpunk2077Aqua
hi! link netrwLink cyberpunk2077Gray
hi! link netrwSymLink cyberpunk2077Fg1
hi! link netrwExe cyberpunk2077Yellow
hi! link netrwComment cyberpunk2077Gray
hi! link netrwList cyberpunk2077Blue
hi! link netrwHelpCmd cyberpunk2077Aqua
hi! link netrwCmdSep cyberpunk2077Fg3
hi! link netrwVersion cyberpunk2077Green

" }}}
" NERDTree: {{{

hi! link NERDTreeDir cyberpunk2077Aqua
hi! link NERDTreeDirSlash cyberpunk2077Aqua

hi! link NERDTreeOpenable cyberpunk2077Orange
hi! link NERDTreeClosable cyberpunk2077Orange

hi! link NERDTreeFile cyberpunk2077Fg1
hi! link NERDTreeExecFile cyberpunk2077Yellow

hi! link NERDTreeUp cyberpunk2077Gray
hi! link NERDTreeCWD cyberpunk2077Green
hi! link NERDTreeHelp cyberpunk2077Fg1

hi! link NERDTreeToggleOn cyberpunk2077Green
hi! link NERDTreeToggleOff cyberpunk2077Red

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

" }}}
" coc.nvim: {{{

hi! link CocErrorSign cyberpunk2077RedSign
hi! link CocWarningSign cyberpunk2077OrangeSign
hi! link CocInfoSign cyberpunk2077YellowSign
hi! link CocHintSign cyberpunk2077BlueSign
hi! link CocErrorFloat cyberpunk2077Red
hi! link CocWarningFloat cyberpunk2077Orange
hi! link CocInfoFloat cyberpunk2077Yellow
hi! link CocHintFloat cyberpunk2077Blue
hi! link CocDiagnosticsError cyberpunk2077Red
hi! link CocDiagnosticsWarning cyberpunk2077Orange
hi! link CocDiagnosticsInfo cyberpunk2077Yellow
hi! link CocDiagnosticsHint cyberpunk2077Blue

hi! link CocSelectedText cyberpunk2077Red
hi! link CocCodeLens cyberpunk2077Gray

call s:HL('CocErrorHighlight', s:none, s:none, s:undercurl, s:red)
call s:HL('CocWarningHighlight', s:none, s:none, s:undercurl, s:orange)
call s:HL('CocInfoHighlight', s:none, s:none, s:undercurl, s:yellow)
call s:HL('CocHintHighlight', s:none, s:none, s:undercurl, s:blue)

" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded cyberpunk2077Green
hi! link diffRemoved cyberpunk2077Red
hi! link diffChanged cyberpunk2077Aqua

hi! link diffFile cyberpunk2077Orange
hi! link diffNewFile cyberpunk2077Yellow

hi! link diffLine cyberpunk2077Blue

" }}}
" Html: {{{

hi! link htmlTag cyberpunk2077Blue
hi! link htmlEndTag cyberpunk2077Blue

hi! link htmlTagName cyberpunk2077AquaBold
hi! link htmlArg cyberpunk2077Aqua

hi! link htmlScriptTag cyberpunk2077Purple
hi! link htmlTagN cyberpunk2077Fg1
hi! link htmlSpecialTagName cyberpunk2077AquaBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar cyberpunk2077Orange

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag cyberpunk2077Blue
hi! link xmlEndTag cyberpunk2077Blue
hi! link xmlTagName cyberpunk2077Blue
hi! link xmlEqual cyberpunk2077Blue
hi! link docbkKeyword cyberpunk2077AquaBold

hi! link xmlDocTypeDecl cyberpunk2077Gray
hi! link xmlDocTypeKeyword cyberpunk2077Purple
hi! link xmlCdataStart cyberpunk2077Gray
hi! link xmlCdataCdata cyberpunk2077Purple
hi! link dtdFunction cyberpunk2077Gray
hi! link dtdTagName cyberpunk2077Purple

hi! link xmlAttrib cyberpunk2077Aqua
hi! link xmlProcessingDelim cyberpunk2077Gray
hi! link dtdParamEntityPunct cyberpunk2077Gray
hi! link dtdParamEntityDPunct cyberpunk2077Gray
hi! link xmlAttribPunct cyberpunk2077Gray

hi! link xmlEntity cyberpunk2077Orange
hi! link xmlEntityPunct cyberpunk2077Orange
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimNotation cyberpunk2077Orange
hi! link vimBracket cyberpunk2077Orange
hi! link vimMapModKey cyberpunk2077Orange
hi! link vimFuncSID cyberpunk2077Fg3
hi! link vimSetSep cyberpunk2077Fg3
hi! link vimSep cyberpunk2077Fg3
hi! link vimContinue cyberpunk2077Fg3

" }}}
" Clojure: {{{

hi! link clojureKeyword cyberpunk2077Blue
hi! link clojureCond cyberpunk2077Orange
hi! link clojureSpecial cyberpunk2077Orange
hi! link clojureDefine cyberpunk2077Orange

hi! link clojureFunc cyberpunk2077Yellow
hi! link clojureRepeat cyberpunk2077Yellow
hi! link clojureCharacter cyberpunk2077Aqua
hi! link clojureStringEscape cyberpunk2077Aqua
hi! link clojureException cyberpunk2077Red

hi! link clojureRegexp cyberpunk2077Aqua
hi! link clojureRegexpEscape cyberpunk2077Aqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen cyberpunk2077Fg3
hi! link clojureAnonArg cyberpunk2077Yellow
hi! link clojureVariable cyberpunk2077Blue
hi! link clojureMacro cyberpunk2077Orange

hi! link clojureMeta cyberpunk2077Yellow
hi! link clojureDeref cyberpunk2077Yellow
hi! link clojureQuote cyberpunk2077Yellow
hi! link clojureUnquote cyberpunk2077Yellow

" }}}
" C: {{{

hi! link cOperator cyberpunk2077Purple
hi! link cStructure cyberpunk2077Orange

" }}}
" Python: {{{

hi! link pythonBuiltin cyberpunk2077PinkCursive
"hi! link pythonBuiltinObj cyberpunk2077Orange
hi! link pythonBuiltinObj cyberpunk2077Orange
"hi! link pythonBuiltinFunc cyberpunk2077Orange
hi! link pythonBuiltinFunc cyberpunk2077Orange
"hi! link pythonFunction cyberpunk2077Aqua
"hi! link pythonFunction cyberpunk2077PinkCursive
hi! link pythonFunction pene
hi! link pythonDecorator cyberpunk2077Red
hi! link pythonInclude cyberpunk2077Blue
hi! link pythonImport cyberpunk2077Blue
hi! link pythonRun cyberpunk2077Blue
hi! link pythonCoding cyberpunk2077Blue
hi! link pythonOperator cyberpunk2077Red
hi! link pythonException cyberpunk2077Red
hi! link pythonExceptions cyberpunk2077Purple
hi! link pythonBoolean cyberpunk2077Purple
hi! link pythonDot cyberpunk2077Fg3
hi! link pythonConditional cyberpunk2077Red
hi! link pythonRepeat cyberpunk2077Red
hi! link pythonDottedName cyberpunk2077GreenBold

" }}}
" CSS: {{{

hi! link cssBraces cyberpunk2077Blue
hi! link cssFunctionName cyberpunk2077Yellow
hi! link cssIdentifier cyberpunk2077Orange
hi! link cssClassName cyberpunk2077Green
hi! link cssColor cyberpunk2077Blue
hi! link cssSelectorOp cyberpunk2077Blue
hi! link cssSelectorOp2 cyberpunk2077Blue
hi! link cssImportant cyberpunk2077Green
hi! link cssVendor cyberpunk2077Fg1

hi! link cssTextProp cyberpunk2077Aqua
hi! link cssAnimationProp cyberpunk2077Aqua
hi! link cssUIProp cyberpunk2077Yellow
hi! link cssTransformProp cyberpunk2077Aqua
hi! link cssTransitionProp cyberpunk2077Aqua
hi! link cssPrintProp cyberpunk2077Aqua
hi! link cssPositioningProp cyberpunk2077Yellow
hi! link cssBoxProp cyberpunk2077Aqua
hi! link cssFontDescriptorProp cyberpunk2077Aqua
hi! link cssFlexibleBoxProp cyberpunk2077Aqua
hi! link cssBorderOutlineProp cyberpunk2077Aqua
hi! link cssBackgroundProp cyberpunk2077Aqua
hi! link cssMarginProp cyberpunk2077Aqua
hi! link cssListProp cyberpunk2077Aqua
hi! link cssTableProp cyberpunk2077Aqua
hi! link cssFontProp cyberpunk2077Aqua
hi! link cssPaddingProp cyberpunk2077Aqua
hi! link cssDimensionProp cyberpunk2077Aqua
hi! link cssRenderProp cyberpunk2077Aqua
hi! link cssColorProp cyberpunk2077Aqua
hi! link cssGeneratedContentProp cyberpunk2077Aqua

" }}}
" JavaScript: {{{

hi! link javaScriptBraces cyberpunk2077Fg1
hi! link javaScriptFunction cyberpunk2077Aqua
hi! link javaScriptIdentifier cyberpunk2077Red
hi! link javaScriptMember cyberpunk2077Blue
hi! link javaScriptNumber cyberpunk2077Purple
hi! link javaScriptNull cyberpunk2077Purple
hi! link javaScriptParens cyberpunk2077Fg3

" }}}
" YAJS: {{{

hi! link javascriptImport cyberpunk2077Aqua
hi! link javascriptExport cyberpunk2077Aqua
hi! link javascriptClassKeyword cyberpunk2077Aqua
hi! link javascriptClassExtends cyberpunk2077Aqua
hi! link javascriptDefault cyberpunk2077Aqua

hi! link javascriptClassName cyberpunk2077Yellow
hi! link javascriptClassSuperName cyberpunk2077Yellow
hi! link javascriptGlobal cyberpunk2077Yellow

hi! link javascriptEndColons cyberpunk2077Fg1
hi! link javascriptFuncArg cyberpunk2077Fg1
hi! link javascriptGlobalMethod cyberpunk2077Fg1
hi! link javascriptNodeGlobal cyberpunk2077Fg1
hi! link javascriptBOMWindowProp cyberpunk2077Fg1
hi! link javascriptArrayMethod cyberpunk2077Fg1
hi! link javascriptArrayStaticMethod cyberpunk2077Fg1
hi! link javascriptCacheMethod cyberpunk2077Fg1
hi! link javascriptDateMethod cyberpunk2077Fg1
hi! link javascriptMathStaticMethod cyberpunk2077Fg1

" hi! link javascriptProp cyberpunk2077Fg1
hi! link javascriptURLUtilsProp cyberpunk2077Fg1
hi! link javascriptBOMNavigatorProp cyberpunk2077Fg1
hi! link javascriptDOMDocMethod cyberpunk2077Fg1
hi! link javascriptDOMDocProp cyberpunk2077Fg1
hi! link javascriptBOMLocationMethod cyberpunk2077Fg1
hi! link javascriptBOMWindowMethod cyberpunk2077Fg1
hi! link javascriptStringMethod cyberpunk2077Fg1

hi! link javascriptVariable cyberpunk2077Orange
" hi! link javascriptVariable cyberpunk2077Red
" hi! link javascriptIdentifier cyberpunk2077Orange
" hi! link javascriptClassSuper cyberpunk2077Orange
hi! link javascriptIdentifier cyberpunk2077Orange
hi! link javascriptClassSuper cyberpunk2077Orange

" hi! link javascriptFuncKeyword cyberpunk2077Orange
" hi! link javascriptAsyncFunc cyberpunk2077Orange
hi! link javascriptFuncKeyword cyberpunk2077Aqua
hi! link javascriptAsyncFunc cyberpunk2077Aqua
hi! link javascriptClassStatic cyberpunk2077Orange

hi! link javascriptOperator cyberpunk2077Red
hi! link javascriptForOperator cyberpunk2077Red
hi! link javascriptYield cyberpunk2077Red
hi! link javascriptExceptions cyberpunk2077Red
hi! link javascriptMessage cyberpunk2077Red

hi! link javascriptTemplateSB cyberpunk2077Aqua
hi! link javascriptTemplateSubstitution cyberpunk2077Fg1

" hi! link javascriptLabel cyberpunk2077Blue
" hi! link javascriptObjectLabel cyberpunk2077Blue
" hi! link javascriptPropertyName cyberpunk2077Blue
hi! link javascriptLabel cyberpunk2077Fg1
hi! link javascriptObjectLabel cyberpunk2077Fg1
hi! link javascriptPropertyName cyberpunk2077Fg1

hi! link javascriptLogicSymbols cyberpunk2077Fg1
hi! link javascriptArrowFunc cyberpunk2077Yellow

hi! link javascriptDocParamName cyberpunk2077Fg4
hi! link javascriptDocTags cyberpunk2077Fg4
hi! link javascriptDocNotation cyberpunk2077Fg4
hi! link javascriptDocParamType cyberpunk2077Fg4
hi! link javascriptDocNamedParamType cyberpunk2077Fg4

hi! link javascriptBrackets cyberpunk2077Fg1
hi! link javascriptDOMElemAttrs cyberpunk2077Fg1
hi! link javascriptDOMEventMethod cyberpunk2077Fg1
hi! link javascriptDOMNodeMethod cyberpunk2077Fg1
hi! link javascriptDOMStorageMethod cyberpunk2077Fg1
hi! link javascriptHeadersMethod cyberpunk2077Fg1

hi! link javascriptAsyncFuncKeyword cyberpunk2077Red
hi! link javascriptAwaitFuncKeyword cyberpunk2077Red

" }}}
" PanglossJS: {{{

hi! link jsClassKeyword cyberpunk2077Aqua
hi! link jsExtendsKeyword cyberpunk2077Aqua
hi! link jsExportDefault cyberpunk2077Aqua
hi! link jsTemplateBraces cyberpunk2077Aqua
hi! link jsGlobalNodeObjects cyberpunk2077Fg1
hi! link jsGlobalObjects cyberpunk2077Fg1
hi! link jsFunction cyberpunk2077Aqua
hi! link jsFuncParens cyberpunk2077Fg3
hi! link jsParens cyberpunk2077Fg3
hi! link jsNull cyberpunk2077Purple
hi! link jsUndefined cyberpunk2077Purple
hi! link jsClassDefinition cyberpunk2077Yellow

" }}}
" TypeScript: {{{

hi! link typeScriptReserved cyberpunk2077Aqua
hi! link typeScriptLabel cyberpunk2077Aqua
hi! link typeScriptFuncKeyword cyberpunk2077Aqua
hi! link typeScriptIdentifier cyberpunk2077Orange
hi! link typeScriptBraces cyberpunk2077Fg1
hi! link typeScriptEndColons cyberpunk2077Fg1
hi! link typeScriptDOMObjects cyberpunk2077Fg1
hi! link typeScriptAjaxMethods cyberpunk2077Fg1
hi! link typeScriptLogicSymbols cyberpunk2077Fg1
hi! link typeScriptDocSeeTag Comment
hi! link typeScriptDocParam Comment
hi! link typeScriptDocTags vimCommentTitle
hi! link typeScriptGlobalObjects cyberpunk2077Fg1
hi! link typeScriptParens cyberpunk2077Fg3
hi! link typeScriptOpSymbols cyberpunk2077Fg3
hi! link typeScriptHtmlElemProperties cyberpunk2077Fg1
hi! link typeScriptNull cyberpunk2077Purple
hi! link typeScriptInterpolationDelimiter cyberpunk2077Aqua

" }}}
" PureScript: {{{

hi! link purescriptModuleKeyword cyberpunk2077Aqua
hi! link purescriptModuleName cyberpunk2077Fg1
hi! link purescriptWhere cyberpunk2077Aqua
hi! link purescriptDelimiter cyberpunk2077Fg4
hi! link purescriptType cyberpunk2077Fg1
hi! link purescriptImportKeyword cyberpunk2077Aqua
hi! link purescriptHidingKeyword cyberpunk2077Aqua
hi! link purescriptAsKeyword cyberpunk2077Aqua
hi! link purescriptStructure cyberpunk2077Aqua
hi! link purescriptOperator cyberpunk2077Blue

hi! link purescriptTypeVar cyberpunk2077Fg1
hi! link purescriptConstructor cyberpunk2077Fg1
hi! link purescriptFunction cyberpunk2077Fg1
hi! link purescriptConditional cyberpunk2077Orange
hi! link purescriptBacktick cyberpunk2077Orange

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp cyberpunk2077Fg3
hi! link coffeeSpecialOp cyberpunk2077Fg3
hi! link coffeeCurly cyberpunk2077Orange
hi! link coffeeParen cyberpunk2077Fg3
hi! link coffeeBracket cyberpunk2077Orange

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter cyberpunk2077Green
hi! link rubyInterpolationDelimiter cyberpunk2077Aqua

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier cyberpunk2077Red
hi! link objcDirective cyberpunk2077Blue

" }}}
" Go: {{{

hi! link goDirective cyberpunk2077Aqua
hi! link goConstants cyberpunk2077Purple
hi! link goDeclaration cyberpunk2077Red
hi! link goDeclType cyberpunk2077Blue
hi! link goBuiltins cyberpunk2077Orange

" }}}
" Lua: {{{

hi! link luaIn cyberpunk2077Red
hi! link luaFunction cyberpunk2077Aqua
hi! link luaTable cyberpunk2077Orange

" }}}
" MoonScript: {{{

hi! link moonSpecialOp cyberpunk2077Fg3
hi! link moonExtendedOp cyberpunk2077Fg3
hi! link moonFunction cyberpunk2077Fg3
hi! link moonObject cyberpunk2077Yellow

" }}}
" Java: {{{

hi! link javaAnnotation cyberpunk2077Blue
hi! link javaDocTags cyberpunk2077Aqua
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen cyberpunk2077Fg3
hi! link javaParen1 cyberpunk2077Fg3
hi! link javaParen2 cyberpunk2077Fg3
hi! link javaParen3 cyberpunk2077Fg3
hi! link javaParen4 cyberpunk2077Fg3
hi! link javaParen5 cyberpunk2077Fg3
hi! link javaOperator cyberpunk2077Orange

hi! link javaVarArg cyberpunk2077Green

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter cyberpunk2077Green
hi! link elixirInterpolationDelimiter cyberpunk2077Aqua

hi! link elixirModuleDeclaration cyberpunk2077Yellow

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition cyberpunk2077Fg1
hi! link scalaCaseFollowing cyberpunk2077Fg1
hi! link scalaCapitalWord cyberpunk2077Fg1
hi! link scalaTypeExtension cyberpunk2077Fg1

hi! link scalaKeyword cyberpunk2077Red
hi! link scalaKeywordModifier cyberpunk2077Red

hi! link scalaSpecial cyberpunk2077Aqua
hi! link scalaOperator cyberpunk2077Fg1

hi! link scalaTypeDeclaration cyberpunk2077Yellow
hi! link scalaTypeTypePostDeclaration cyberpunk2077Yellow

hi! link scalaInstanceDeclaration cyberpunk2077Fg1
hi! link scalaInterpolation cyberpunk2077Aqua

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:fg3, s:none, s:italic)

hi! link markdownH1 cyberpunk2077GreenBold
hi! link markdownH2 cyberpunk2077GreenBold
hi! link markdownH3 cyberpunk2077YellowBold
hi! link markdownH4 cyberpunk2077YellowBold
hi! link markdownH5 cyberpunk2077Yellow
hi! link markdownH6 cyberpunk2077Yellow

hi! link markdownCode cyberpunk2077Aqua
hi! link markdownCodeBlock cyberpunk2077Aqua
hi! link markdownCodeDelimiter cyberpunk2077Aqua

hi! link markdownBlockquote cyberpunk2077Gray
hi! link markdownListMarker cyberpunk2077Gray
hi! link markdownOrderedListMarker cyberpunk2077Gray
hi! link markdownRule cyberpunk2077Gray
hi! link markdownHeadingRule cyberpunk2077Gray

hi! link markdownUrlDelimiter cyberpunk2077Fg3
hi! link markdownLinkDelimiter cyberpunk2077Fg3
hi! link markdownLinkTextDelimiter cyberpunk2077Fg3

hi! link markdownHeadingDelimiter cyberpunk2077Orange
hi! link markdownUrl cyberpunk2077Purple
hi! link markdownUrlTitleDelimiter cyberpunk2077Green

call s:HL('markdownLinkText', s:gray, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType cyberpunk2077Yellow
" hi! link haskellOperators cyberpunk2077Orange
" hi! link haskellConditional cyberpunk2077Aqua
" hi! link haskellLet cyberpunk2077Orange
"
hi! link haskellType cyberpunk2077Fg1
hi! link haskellIdentifier cyberpunk2077Fg1
hi! link haskellSeparator cyberpunk2077Fg1
hi! link haskellDelimiter cyberpunk2077Fg4
hi! link haskellOperators cyberpunk2077Blue
"
hi! link haskellBacktick cyberpunk2077Orange
hi! link haskellStatement cyberpunk2077Orange
hi! link haskellConditional cyberpunk2077Orange

hi! link haskellLet cyberpunk2077Aqua
hi! link haskellDefault cyberpunk2077Aqua
hi! link haskellWhere cyberpunk2077Aqua
hi! link haskellBottom cyberpunk2077Aqua
hi! link haskellBlockKeywords cyberpunk2077Aqua
hi! link haskellImportKeywords cyberpunk2077Aqua
hi! link haskellDeclKeyword cyberpunk2077Aqua
hi! link haskellDeriving cyberpunk2077Aqua
hi! link haskellAssocType cyberpunk2077Aqua

hi! link haskellNumber cyberpunk2077Purple
hi! link haskellPragma cyberpunk2077Purple

hi! link haskellString cyberpunk2077Green
hi! link haskellChar cyberpunk2077Green

" }}}
" Json: {{{

hi! link jsonKeyword cyberpunk2077Green
hi! link jsonQuote cyberpunk2077Green
hi! link jsonBraces cyberpunk2077Fg1
hi! link jsonString cyberpunk2077Fg1

" }}}


" Functions -------------------------------------------------------------------
" Search Highlighting Cursor {{{

function! Cyberpunk2077HlsShowCursor()
  call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! Cyberpunk2077HlsHideCursor()
  call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
