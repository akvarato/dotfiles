" ============================================================================
" PORTABLES HIGH-PERFORMANCE VIM SETUP (FINAL & FEHLERFREI)
" ============================================================================

" --- 1. ZUERST: DIE MAPLEADER DEFINITION ---
nnoremap <Space> <Nop>
xnoremap <Space> <Nop>
let g:mapleader = " "

" --- 2. EDITOR OPTIONEN & PERFORMANCE ---
set nocompatible      " Schaltet den alten VI-Kompatibilitätsmodus aus
syntax on             " Aktiviert das standardmäßige Syntax-Highlighting
filetype plugin indent on

set encoding=utf-8    " Garantiert saubere Darstellung von Sonderzeichen
set number            " Zeigt Zeilennummern an
set relativenumber    " Erleichtert das Springen mit Key-Commands (z.B. 5j)
set mouse=            " Deaktiviert die Maussteuerung im Terminal
set undofile          " Speichert den Änderungsverlauf dauerhaft in Dateien
set noswapfile        " Verhindert die lästigen .swp-Dateien bei Abstürzen
set scrolloff=8       " Lässt beim Scrollen immer 8 Zeilen Platz zum Rand
set ignorecase        " Ignoriert Groß-/Kleinschreibung bei der Suche...
set smartcase         " ...außer du suchst explizit nach Großbuchstaben
set incsearch         " Springt bereits beim Tippen zum ersten Suchtreffer
set hlsearch          " Hebt alle Suchtreffer im Dokument farblich hervor

" --- PFEILTASTEN DEAKTIVIEREN (MUSKELGEDÄCHTNIS-TRAINING) ---
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

xnoremap <Up> <Nop>
xnoremap <Down> <Nop>
xnoremap <Left> <Nop>
xnoremap <Right> <Nop>

inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

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

" --- 6. NATIVE HOCHLEISTUNGS-SUCHE ---
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

" --- 8. FENSTER MANAGEMENT (STRG + HJKL) ---
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" --- 9. STATUSZEILE ---
set laststatus=2  
set statusline=%F%m%r%=%Y\ \|\ Spalte:\ %v\ \|\ Zeile:\ %l/%L\ (%p%%)

" --- 10. INTEGRIERTES INTERAKTIVES CHEAT-SHEET ---
function! OpenVimCheatSheet()
    let l:bufnum = bufnr('__Vim_Cheat_Sheet__')
    if l:bufnum != -1
        let l:winnum = bufwinnr(l:bufnum)
        if l:winnum != -1
            execute l:winnum . 'wincmd w'
            close
            return
        endif
    endif

    botright 14split __Vim_Cheat_Sheet__

    setlocal buftype=nofile
    setlocal bufhidden=delete
    setlocal noswapfile
    setlocal nobuflisted
    setlocal nowrap

    call append(0,  "=============================================================================")
    call append(1,  "                   VIM SPICKZETTEL (Hände auf der Tastatur!)                  ")
    call append(2,  "=============================================================================")
    call append(3,  "  BEWEGUNG (Normalmodus):   h (links) | j (runter) | k (hoch) | l (rechts)     ")
    call append(4,  "  WORTSPRÜNGE:              w (Wort vorwärts) | b (Wort zurück)                 ")
    call append(5,  "  ZEILENSPRÜNGE:            0 (Zeilenanfang)   | $ (Zeilenende)                 ")
    call append(6,  "  DATEISPRÜNGE:             gg (Anfang) | G (Ende) | :<Nummer><CR> (Zu Zeile)  ")
    call append(7,  "  SUCHE IN ZEILE:           f<Buchstabe> (Springe auf) | ; (Wiederholen)        ")
    call append(8,  "-----------------------------------------------------------------------------")
    call append(9,  "  TEXT-OBJEKTE (Befehl = Aktion + Bereich + Objekt):                          ")
    call append(10, "  AKTIONEN:                 d (löschen) | c (ändern/löschen+Insert) | y (copy) ")
    call append(11, "  BEREICH / OBJEKT:         i\" (innen Anführungszeichen) | i( (innen Klammer)  ")
    call append(12, "  BEISPIELE:                ci\" (Ändere String) | di( (Lösche Klammerinhalt) ")
    call append(13, "-----------------------------------------------------------------------------")
    call append(14, "  BUFFER:    <Leader>n (Next) | <Leader>p (Prev) | <Leader>b (Liste) | <Leader>c (Close) ")
    call append(15, "=============================================================================")

    setlocal readonly
    setlocal nomodifiable
endfunction

nnoremap <leader>? :call OpenVimCheatSheet()<CR>
