let mapleader = "\<Space>"

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

fun! s:DetectLanguage()
    if getline(1) =~ "^#!.*/bin/env gosh"          | set ft=scheme     | endif
    if getline(1) =~ "^#!.*/bin/env ruby"          | set ft=ruby       | endif
    if getline(1) =~ "^#!.*/bin/env python"        | set ft=python     | endif
    if getline(1) =~ "^#!.*/bin/env sbcl --script" | set ft=lisp       | endif
    if getline(1) =~ "^#!.*/bin/env deno"          | set ft=typescript | endif
    if getline(1) =~ "^#!.*/bin/env -S nim .*"     | set ft=nim        | endif
endfun

" fileのspace指定
if has("autocmd")
    filetype plugin on
    filetype indent on

    au BufRead,BufNewFile *.ejs    setfiletype ejs
    au BufRead,BufNewFile *._ejs   setfiletype ejs
    au BufRead,BufNewFile *.pug    setfiletype pug
    au BufRead,BufNewFile *.fs     setfiletype fsharp
    au BufRead,BufNewFile *.fsx    setfiletype fsharp
    au BufRead,BufNewFile *.fsproj setfiletype xml
    au BufRead,BufNewFile *.es6    setfiletype javascript
    au BufRead,BufNewFile *.ros    setfiletype lisp
    au BufRead,BufNewFile *.asd    setfiletype lisp
    au BufRead,BufNewFile *.phtml  setfiletype html
    au BufRead,BufNewFile *.conf   setfiletype conf
    au BufRead,BufNewFile *.ts     setfiletype typescript
    au BufRead,BufNewFile *.tsx    let         b:tsx_ext_found =1
    au BufRead,BufNewFile *.tsx    setfiletype typescript.tsx
    au BufRead,BufNewFile *        call        s:DetectLanguage()

    au FileType c              setlocal sw=2 sts=2 ts=2 et
    au FileType html           setlocal sw=2 sts=2 ts=2 et
    au FileType pug            setlocal sw=2 sts=2 ts=2 et
    au FileType ejs            setlocal sw=2 sts=2 ts=2 et
    au FileType ruby           setlocal sw=2 sts=2 ts=2 et
    au FileType markdown       setlocal sw=2 sts=2 ts=2 et
    au FileType yaml           setlocal sw=2 sts=2 ts=2 et
    au FileType javascript     setlocal sw=2 sts=2 ts=2 et
    au FileType typescript     setlocal sw=2 sts=2 ts=2 et
    au FileType typescript.tsx setlocal sw=2 sts=2 ts=2 et
    au FileType python         setlocal sw=4 sts=4 ts=4 et
    au FileType json           setlocal sw=2 sts=2 ts=2 et
    au FileType css            setlocal sw=4 sts=4 ts=4 et
    au FileType scss           setlocal sw=4 sts=4 ts=4 et
    au FileType sass           setlocal sw=4 sts=4 ts=4 et
    au FileType nim            setlocal sw=2 sts=2 ts=2 et
    au FileType go             setlocal sw=4 sts=4 ts=4 et
    au FileType rust           setlocal sw=4 sts=4 ts=4 et
    au FileType rs             setlocal sw=4 sts=4 ts=4 et
    au FileType lisp           setlocal sw=2 sts=2 ts=2 et
endif



