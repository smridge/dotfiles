set number
set list listchars=tab:»·,trail:·,nbsp:·,space:·
set softtabstop=2
set tabstop=2
set incsearch
set hlsearch

syntax enable

filetype plugin indent on
filetype on
filetype indent on

call plug#begin('~/.vim/plugged')
  Plug 'patstockwell/vim-monokai-tasty'
  Plug 'tpope/vim-rails'
  Plug 'vim-ruby/vim-ruby'
  Plug 'sheerun/vim-polyglot'
  Plug 'tomtom/tcomment_vim'
  Plug 'luochen1990/rainbow'
call plug#end()

"Plug vim-ruby/vim-ruby
let ruby_operators = 1
let ruby_pseudo_operators = 1
let ruby_space_errors = 1
let ruby_no_expensive = 1
let ruby_spellcheck_strings = 1

"Plug patstockwell/vim-monokai-tasty
let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty

"Plug luochen1990/rainbow
let g:rainbow_active = 1

"Syntax

"Language Defintion/Grammar - https://github.com/patstockwell/vim-monokai-tasty/blob/master/README.md
command! What echo synIDattr(synID(line('.'), col('.'), 1), 'name')

"light_green
hi rubyClassName ctermfg=148 guifg=#a4e400

"light_blue
hi rubyConstant ctermfg=081 guifg=#62d8f1
hi rubySuperClassOperator ctermfg=081 guifg=#62d8f1
hi vimHiGroup ctermfg=081 guifg=#62d8f1
hi vimIsCommand ctermfg=081 guifg=#62d8f1

"magenta
hi rubyScopeOperator ctermfg=197 guifg=#fc1a70
hi rubyLambdaOperator ctermfg=197 guifg=#fc1a70
hi rubyDotOperator ctermfg=197 guifg=#fc1a70
hi rubyProcOperator ctermfg=197 guifg=#fc1a70
hi vimUserFunc ctermfg=197 guifg=#fc1a70
hi vimHiKeyList ctermfg=197 guifg=#fc1a70
hi vimSetEqual ctermfg=197 guifg=#fc1a70

"purple
hi rubyMethodDeclaration ctermfg=141 guifg=#af87ff
hi vimSet ctermfg=141 guifg=#af87ff
hi vimSynType ctermfg=141 guifg=#af87ff

"orange
hi rubyPseudoVariable ctermfg=208 guifg=#ff9700
hi rubyBlockParameterList ctermfg=208 guifg=#ff9700
hi rubyInstanceVariable ctermfg=208 guifg=#ff9700
hi vimVar ctermfg=208 guifg=#ff9700
hi vimHiGuiFgBg ctermfg=208 guifg=#ff9700
hi vimHiCtermFgBg ctermfg=208 guifg=#ff9700

"darker_gray, dont_highlight, Invisible Characters
hi SpecialKey ctermbg=NONE guibg=NONE ctermfg=238 guifg=#444444

"dark_gray, dont_highlight
hi RubyComment ctermbg=NONE guibg=NONE ctermfg=59 guifg=#5f5f5f
hi vimLineComment ctermbg=NONE guibg=NONE ctermfg=59 guifg=#5f5f5f
hi netrwComment ctermbg=NONE guibg=NONE ctermfg=59 guifg=#5f5f5f
