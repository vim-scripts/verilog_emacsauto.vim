# verilog_emacsauto

## Introduction
This is one improved version of [original verilog mode](https://github.com/vim-scripts/verilog_emacsauto.vim)
There are several issues in origional version:
- doesn't work on windows
- need enter "any key" twice to continue 
- doesn't work for systemverilog

## Installation

### vim-plug
```vimscript
Plug 'zhuzhzh/verilog_emacsauto.vim', {'for': ['verilog', 'systemverilog'] }
```

### Vundle
```vimscript
Plugin 'zhuzhzh/verilog_emacsauto.vim'
```

## Windows
In order to work on windows, you need to install unix bins for windows.
Actually, git-for-windows already contains it.
Please add the path like D:\Git\usr\bin to system variable PATH
The bin path including emacs also needs to be added to PATH
if it still doesn't work , please consider to use the absolute path.
```vimscript
function s:Add()
   if &expandtab
      let s:save_tabstop = &tabstop
      let &tabstop=8
   endif
   " a tmp file is need 'cause emacs doesn't support the stdin to stdout flow
   " maybe add /tmp to the temporary filename
   w! %.emacsautotmp
   !"D:\Program Files\emacs\bin\emacs.exe" -batch -l "D:\Program Files\emacs\share\emacs\site-lisp\verilog-mode.el" %.emacsautotmp -f verilog-batch-auto
   %!"D:\Git\usr\bin\cat.exe" %.emacsautotmp 
   if &expandtab
      retab
      let &tabstop=s:save_tabstop
   endif
   !"D:\Git\usr\bin\rm.exe" %.emacsautotmp
endfunction
```

## Feature
Two emacs verilog-mode functions are mapped.
- \<Leader>a expands all the verilog-mode autos (similar to C-c C-a in emacs).
- \<Leader>d collapses all the verilog-mode autos (similar to C-c C-d in emacs).

## config
User can define the shortkeys for auto-add and auto-delete. Here is the example.
```vim
let g:VerilogModeAddKey = <Leader>va
let g:VerilogModeDeleteKey = <Leader>vd
let g:VerilogModePath = ~/.elisp/verilog-mode.el
``

