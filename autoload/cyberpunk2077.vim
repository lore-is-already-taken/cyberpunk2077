" -----------------------------------------------------------------------------
" File: cyberpunk2077.vim
" Description: Retro cyberpunk color scheme for Vim
" Author: morhetz <lorenzosaavedra.c@gmail.com>
" Source: https://github.com/lore-is-already-taken/cyberpunk2077
" Last Modified: today
" -----------------------------------------------------------------------------

function! cyberpunk2077#invert_signs_toggle()
  if g:cyberpunk2077_invert_signs == 0
    let g:cyberpunk2077_invert_signs=1
  else
    let g:cyberpunk2077_invert_signs=0
  endif

  colorscheme cyberpunk2077
endfunction

" Search Highlighting {{{

function! cyberpunk2077#hls_show()
  set hlsearch
  call cyberpunk2077HlsShowCursor()
endfunction

function! cyberpunk2077#hls_hide()
  set nohlsearch
  call cyberpunk2077HlsHideCursor()
endfunction

function! cyberpunk2077#hls_toggle()
  if &hlsearch
    call cyberpunk2077#hls_hide()
  else
    call cyberpunk2077#hls_show()
  endif
endfunction

" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
