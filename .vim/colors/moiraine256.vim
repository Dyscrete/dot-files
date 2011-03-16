" moiraine256.vim ------------------------------------------------------------
" Dwayne Hunter <dwaynehunter1@gmail.com>
" Last modified: March 16, 2011
"
" moiraine256 based largely on xoria256 for 256 color terms only
" ----------------------------------------------------------------------------

if &t_Co != 256 
  echomsg ""
  echomsg "err: Use a 256-color terminal"
  echomsg ""
  finish
endif

set background=dark
hi clear

if exists("syntax_on")
  syntax reset
endif

let colors_name = "moiraine256"

" General colors -------------------------------------------------------------
hi Normal       ctermfg=252  ctermbg=234  cterm=none 
hi CursorColumn              ctermbg=238 
hi Cursor                    ctermbg=214 
hi CursorLine                ctermbg=238 
hi FoldColumn   ctermfg=248  ctermbg=bg  
hi Folded       ctermfg=255  ctermbg=60  
hi IncSearch    ctermfg=0    ctermbg=223  cterm=none 
hi NonText      ctermfg=248               cterm=bold 
hi Pmenu        ctermfg=0    ctermbg=246 
hi PmenuSbar                 ctermbg=243 
hi PmenuSel     ctermfg=0    ctermbg=243 
hi PmenuThumb                ctermbg=252 
hi Search       ctermfg=0    ctermbg=149 
hi SignColumn   ctermfg=248 
hi SpecialKey   ctermfg=77  
hi StatusLine   ctermfg=252  ctermbg=0    cterm=bold 
hi StatusLineNC ctermfg=252  ctermbg=0    cterm=none
hi TabLine      ctermfg=fg   ctermbg=242  cterm=underline 
hi TabLineFill  ctermfg=fg   ctermbg=242  cterm=underline 
hi VertSplit    ctermfg=237  ctermbg=237  cterm=none 
hi Visual       ctermfg=24   ctermbg=153 
hi VIsualNOS    ctermfg=24   ctermbg=153  cterm=none 
hi WildMenu     ctermfg=0    ctermbg=184  cterm=bold 
hi ColorColumn                            ctermbg=0

" Syntax highlighting --------------------------------------------------------
hi Comment      ctermfg=244 
hi Constant     ctermfg=229 
hi Error        ctermfg=15   ctermbg=1   
hi ErrorMsg     ctermfg=15   ctermbg=1   
hi Identifier   ctermfg=182               cterm=none
hi Ignore       ctermfg=238 
hi LineNr       ctermfg=248 
hi MatchParen   ctermfg=188  ctermbg=68   cterm=bold 
hi Number       ctermfg=180 
hi PreProc      ctermfg=150 
hi Special      ctermfg=174 
hi Statement    ctermfg=110               cterm=none 
hi Todo         ctermfg=0    ctermbg=184 
hi Type         ctermfg=146               cterm=none 
hi Underlined   ctermfg=39                cterm=underline 

" Special --------------------------------------------------------------------
hi diffAdded    ctermfg=150 
hi diffRemoved  ctermfg=174 
hi diffAdd      ctermfg=bg   ctermbg=151 
hi diffDelete   ctermfg=bg   ctermbg=246  cterm=none 
hi diffChange   ctermfg=bg   ctermbg=181 
hi diffText     ctermfg=bg   ctermbg=174  cterm=none 
