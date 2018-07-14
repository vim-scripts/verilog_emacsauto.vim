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

## Feature
Two emacs verilog-mode functions are mapped.
- \<Leader>a expands all the verilog-mode autos (similar to C-c C-a in emacs).
- \<Leader>d collapses all the verilog-mode autos (similar to C-c C-d in emacs).

