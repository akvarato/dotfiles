" ============================================================================

" INTELLIGENTES AUTOMATISCHES KLAMMERN-SCHLIESSEN (OHNE PLUGINS)
" ============================================================================

" 1. Öffnende Klammern setzen das Paar und setzen den Cursor in die Mitte
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

" 2. Überspringen, wenn die schließende Klammer bereits vor dem Cursor steht
inoremap <expr> ) strpart(getline('.'), col('.') - 1, 1) == ')' ? '<Right>' : ')'
inoremap <expr> ] strpart(getline('.'), col('.') - 1, 1) == ']' ? '<Right>' : ']'
inoremap <expr> } strpart(getline('.'), col('.') - 1, 1) == '}' ? '<Right>' : '}'

" 3. Anführungszeichen: Schließen oder Überspringen (Kontextabhängig)
inoremap <expr> " strpart(getline('.'), col('.') - 1, 1) == '"' ? '<Right>' : '""<Left>'
inoremap <expr> ' strpart(getline('.'), col('.') - 1, 1) == "'" ? '<Right>' : "''<Left>"
inoremap <expr> ` strpart(getline('.'), col('.') - 1, 1) == "`" ? '<Right>' : "``<Left>"

" 4. Intelligenter Zeilenumbruch bei geschweiften Klammern
" Wenn der Cursor zwischen { und } steht und Enter gedrückt wird:
" Erzeuge sauberen Umbruch, rücke ein und halte die Syntax-Struktur.
inoremap <expr> <CR> strpart(getline('.'), col('.') - 1, 1) == '}' ? '<CR><Esc>O' : '<CR>'

" ============================================================================
" LOKALER FEINSCHLIFF: NAVIGATION & BORDEIGENE SUCHE
" ============================================================================

" Leertaste im Normal- und visuellen Modus komplett funktionslos machen
nnoremap <Space> <Nop>
xnoremap <Space> <Nop>

" 2. Erst danach die Leertaste als globalen Mapleader definieren
let g:mapleader = " "

" 1. Netrw (Eingebauter Dateibrowser) wie eine IDE-Seitenleiste konfigurieren
let g:netrw_banner = 0        " Entfernt den störenden Header-Text
let g:netrw_liststyle = 3     " Aktiviert die Baumansicht (Tree View)
let g:netrw_browse_split = 4  " Öffnet Dateien in einem neuen vertikalen Split
let g:netrw_altv = 1          " Splitzt neue Fenster standardmäßig nach rechts
let g:netrw_winsize = 25      " Setzt die Breite der Seitenleiste auf 25%

" Umschalter für die Seitenleiste auf die Taste <Leader>e legen (Leertaste + e)
" :Lexplore öffnet/schließt das Netrw-Fenster links als Explorer
nnoremap <leader>e :Lexplore<CR>

" 2. Hochleistungs-Suche mit internen Bordmitteln
set path+=** set wildmenu " Rekursive Suche in allen Unterordnern für :find
                          " Aktiviert die visuelle Befehlszeilen-Vervollständigung

" Verzeichnisse und Dateien, die Vim bei der Suche komplett ignorieren soll
set wildignore+=**/node_modules/**,**/Build/**,**/.git/**
set wildignore+=*.o,*.obj,*.pyc,*.so,*.png,*.jpg,*.gif,*.pdf

" Schnelles Wechseln zwischen offenen Buffern (Dateien) im Arbeitsspeicher
" Schaltet mit <Leader>n zum nächsten und <Leader>p zum vorherigen Buffer
nnoremap <leader>n :bnext<CR>
nnoremap <leader>p :bprev<CR>

" ============================================================================
"  EDITOR OPTIONEN
" ============================================================================
set number            " Zeigt Zeilennummern an
set relativenumber    " Erleichtert das Springen mit Key-Commands (z.B. 5j)
set mouse=            " Deaktiviert die Maussteuerung im Terminal
set undofile          " Speichert den Änderungsverlauf dauerhaft in Dateien
set noswapfile        " Verhindert die lästigen .swp-Dateien bei Abstürzen
set scrolloff=8       " Lässt beim Scrollen immer 8 Zeilen Platz zum Rand
set ignorecase        " Ignoriert Groß-/Kleinschreibung bei der Suche...
set smartcase         " ...außer du suchst explizit nach Großbuchstaben



" ============================================================================
" CODE-FORMATTING & EINRÜCKUNG (INDENT)
" ============================================================================
set expandtab     " Konvertiert jeden echten Tabulator in Leerzeichen (Spaces)
set tabstop=4     " Ein Tabulator entspricht visuell 4 Leerzeichen
set shiftwidth=4  " Automatische Einrückungen (z.B. nach ':') nutzen 4 Leerzeichen
set softtabstop=4 " Bestimmt, wie viele Leerzeichen beim Drücken von Backspace gelöscht werden
set smarttab      " Nutzt 'shiftwidth' am Zeilenanfang für intelligentes Tabben
set autoindent    " Kopiert die Einrückung der vorherigen Zeile beim Zeilenumbruch
set smartindent   " Erkennt Programmierstrukturen (z.B. nach geschweiften Klammern)

" ============================================================================
" STATUSZEILEN-TUNING (OHNE PLUGINS)
" ============================================================================
set laststatus=2  " Die Statuszeile wird IMMER angezeigt, nicht nur bei Splits

" Definition des Layouts der Statuszeile (statusline)
" %F: Voller Dateipfad | %m: Modifiziert-Flag [+] | %r: Schreibgeschützt-Flag [RO]
" %=: Trenner (alles danach wird rechtsbündig ausgerichtet)
" %Y: Dateityp (z.B. python, yaml) | %v: Spaltenposition | %l/%L: Aktuelle Zeile/Gesamtzeilen
set statusline=%F%m%r%=%Y\ \|\ Spalte:\ %v\ \|\ Zeile:\ %l/%L\ (%p%%)
