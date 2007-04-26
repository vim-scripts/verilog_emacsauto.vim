" Vim filetype plugin for using emacs verilog-mode
" Last Change: 2007 April 26
" Maintainer:  Seong Kang <seongk@wwcoms.com>
" License:     This file is placed in the public domain.

if exists("loaded_verilog_emacsauto")
   finish
endif
let loaded_verilog_emacsauto = 1

if !hasmapto('<Plug>VerilogEmacsAutoAdd')
   map <unique> <Leader>a <Plug>VerilogEmacsAutoAdd
endif

if !hasmapto('<Plug>VerilogEmacsAutoDelete')
   map <unique> <Leader>d <Plug>VerilogEmacsAutoDelete
endif

noremap <unique> <script> <Plug>VerilogEmacsAutoAdd    <SID>Add
noremap <unique> <script> <Plug>VerilogEmacsAutoDelete <SID>Delete
noremap <SID>Add    :call <SID>Add()<CR>
noremap <SID>Delete :call <SID>Delete()<CR>
noremenu <script> Plugin.Verilog\ AddAuto    <SID>Add
noremenu <script> Plugin.Verilog\ DeleteAuto <SID>Delete

" uncomment the two if blocks to leave the tabs alone
function s:Add()
   if &expandtab
      let s:save_tabstop = &tabstop
      let &tabstop=8
   endif
   " maybe add /tmp so the files don't clutter or uncomment the rm line
   " it needs a tmp file 'cause emacs uses stdin for something else
   w! %.emacsautotmp
   %!emacs -batch -l ~/elisp/verilog-mode.el %.emacsautotmp -f verilog-batch-auto >& /dev/null; cat %.emacsautotmp 
   if &expandtab
      retab
      let &tabstop=s:save_tabstop
   endif
   "!rm %.emacsautotmp
endfunction

function s:Delete()
   " maybe add /tmp so the files don't clutter or uncomment the rm line
   " it needs a tmp file 'cause emacs uses stdin for something else
   w! %.emacsautotmp
   %!emacs -batch -l ~/elisp/verilog-mode.el %.emacsautotmp -f verilog-batch-delete-auto >& /dev/null; cat %.emacsautotmp 
   "!rm %.emacsautotmp
endfunction

