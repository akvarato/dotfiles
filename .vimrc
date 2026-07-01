" ============================================================================
" PORTABLES HIGH-PERFORMANCE VIM SETUP (BEREINIGT & STRUKTURIERT)
" ============================================================================

" --- 1. ZUERST: DIE MAPLEADER DEFINITION ---
" Muss ganz oben stehen, damit alle nachfolgenden <leader> Mappings greifen!
nnoremap <Space> <Nop>
xnoremap <Space> <Nop>
let g:mapleader = " "

" --- 2. EDITOR OPTIONEN & PERFORMANCE ---
set nocompatible      " Schaltet den alten VI-Kompatibilitätsmodus aus
syntax on             " Aktiviert das standardmäßige Syntax-Highlighting
filetype plugin indent on

set number            " Zeigt Zeilennummern an
set relativenumber    " Erleichtert das Springen mit Key-Commands (z.B. 5j)
set mouse=            " Deaktiviert die Maussteuerung im Terminal
set undofile          " Speichert den Änderungsverlauf dauerhaft in Dateien
set noswapfile        " Verhindert die lästigen .swp-Dateien bei Abstürzen
set scrolloff=8       " Lässt beim Scrollen immer 8 Zeilen Platz zum Rand
set ignorecase        " Ignoriert Groß-/Kleinschreibung bei der Suche...
set smartcase         " ...außer du suchst explizit nach Großbuchstaben

" --- 3. CODE-FORMATTING & EINRÜCKUNG ---
set expandtab         " Konvertiert jeden echten Tabulator in Leerzeichen (Spaces)
set tabstop=4         " Ein Tabulator entspricht visuell 4 Leerzeichen
set shiftwidth=4      " Automatische Einrückungen nutzen 4 Leerzeichen
set softtabstop=4     " Bestimmt gelöschte Leerzeichen bei Backspace
set smarttab          " Nutzt 'shiftwidth' am Zeilenanfang
set autoindent        " Kopiert die Einrückung der vorherigen Zeile
set smartindent       " Erkennt Programmierstrukturen automatisch

" --- 4. INTELLIGENTES AUTOMATISCHES KLAMMERN-SCHLIESSEN ---
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

inoremap <expr> ) strpart(getline('.'), col('.') - 1, 1) == ')' ? '<Right>' : ')'
inoremap <expr> ] strpart(getline('.'), col('.') - 1, 1) == ']' ? '<Right>' : ']'
inoremap <expr> } strpart(getline('.'), col('.') - 1, 1) == '}' ? '<Right>' : '}'

inoremap <expr> " strpart(getline('.'), col('.') - 1, 1) == '"' ? '<Right>' : '""<Left>'
inoremap <expr> ' strpart(getline('.'), col('.') - 1, 1) == "'" ? '<Right>' : "''<Left>"
inoremap <expr> ` strpart(getline('.'), col('.') - 1, 1) == "`" ? '<Right>' : "``<Left>"
inoremap <expr> <CR> strpart(getline('.'), col('.') - 1, 1) == '}' ? '<CR><Esc>O' : '<CR>'

" --- 5. NAVIGATION & NETRW FILERESOURCE ---
let g:netrw_banner = 0        
let g:netrw_liststyle = 3     
let g:netrw_browse_split = 4  
let g:netrw_altv = 1          
let g:netrw_winsize = 25      
nnoremap <leader>e :Lexplore<CR>

" --- 6. NATIVE HOCHLEISTUNGS-SUCHE (KORRIGIERT) ---
set path+=** " Rekursive Suche in allen Unterordnern für :find
set wildmenu                  " Aktiviert die visuelle Befehlszeilen-Vervollständigung

" Such-Ausschlüsse
set wildignore+=**/node_modules/**,**/Build/**,**/.git/**
set wildignore+=*.o,*.obj,*.pyc,*.so,*.png,*.jpg,*.gif,*.pdf

" --- 7. BUFFER MANAGEMENT ---
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprev<CR>
nnoremap <leader>c :bp\|bd #<CR>
nnoremap <leader>b :ls<CR>:buffer<Space>

" --- 8. STATUSZEILE ---
set laststatus=2  
set statusline=%F%m%r%=%Y\ \|\ Spalte:\ %v\ \|\ Zeile:\ %l/%L\ (%p%%)
