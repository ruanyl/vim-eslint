"% Preliminary validation of global variables
"  and version of the editor.

if v:version < 700
    finish
endif

" check whether this script is already loaded
if exists('g:vim_eslint_loaded')
    finish
endif

let g:vim_eslint_loaded = 1

"% Helper functions and variables
let s:plugin_root_directory = fnamemodify(expand("<sfile>"), ":h:h")
let s:eslint_d_portfile = $HOME . '/.eslint_d_port'
" use local eslint_d.js instead, this is a temporary fix for eslint which has
" plugins installed globally
"let s:vim_eslint_d_exec = s:plugin_root_directory . '/node_modules/eslint_d/bin/eslint_d.js'
let s:vim_eslint_d_exec = s:plugin_root_directory . '/eslint_d.js/bin/eslint_d.js'
let g:syntastic_javascript_eslint_exec = s:vim_eslint_d_exec

func! s:start_eslint_d()
    call system(s:vim_eslint_d_exec . ' start')
endfun

func! s:stop_eslint_d()
    call system(s:vim_eslint_d_exec . ' stop')
endfun

func! s:restart_eslint_d()
    call system(s:vim_eslint_d_exec . ' restart')
endfun

func! s:status_eslint_d()
    return system(s:vim_eslint_d_exec . ' status')
endfunc

let s:status = <SID>status_eslint_d()
" if eslint_d is running, restart it
if s:status ==? "Not running"
    call <SID>start_eslint_d()
else
    call <SID>restart_eslint_d()
endif

command! EslintStart call <SID>start_eslint_d()
command! EslintStop call <SID>stop_eslint_d()
command! EslintRestart call <SID>restart_eslint_d()
