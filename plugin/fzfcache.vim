" FZF Cache Setup Start!
let s:this_file_dir = expand('<sfile>:p:h')

function! s:fzf_cache()
    exe 'AsyncRun bash ' . s:this_file_dir . '/fzfcache.sh'
    echo 'fzf caching...'
endfunction

function! s:fzf_watchdog_cache()
    exe 'silent !bash ' . s:this_file_dir . '/watchdog.sh > /tmp/output 2>&1 &'
    echo 'Activate watchdog for fzf cache...'
endfunction

function! s:fzf_kill_watchdog()
    exe 'AsyncRun bash ' . s:this_file_dir . '/kill_watchdog.sh'
    echo 'Kill watchdog for fzf cache...'
endfunction

" Only cache when open nvim with .
" Check out session.vim plugin for more detailed info
function! s:session_load()
    if argv(0)=='.' || argv(0)=='./'
        if argv(1)!='ns'
            :call s:fzf_cache()
        endif
    endif
endfunction

" Create custom FZF setup for loading .cache.fzf file
function! s:ag_handler(lines)
    if len(a:lines) < 2 | return | endif

    let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
    execute cmd escape(a:lines[1], ' %#\')
endfunction


" Open .cache.fzf file in vim fzf
function! s:fzf_open_cache()
    " Open cache file
    let s:cache = './.cache.fzf'

    " Incase .cache.fzf delete on a session
    if !filereadable(s:cache) && (argv(0)=='./' || argv(0)=='.') && argv(1)!='ns'
        :call s:fzf_cache()
        :sleep 500m
    endif

    if filereadable(s:cache)
        let s:filenames = readfile(s:cache)
        :call fzf#run({
                \ 'source': s:filenames, 
                \ 'sink*':  function('s:ag_handler'),
                \ 'options': '--ansi --expect=ctrl-t,ctrl-v,ctrl-x',
                \ 'down': '40%'
                \ })
        :call s:fzf_cache()
    else 
        echo 'Can not find cache file'
    endif
endfunction
" FZF Cache Setup End!

" Create cache when open vim (only create cache when start like nvim .)
au VimEnter * nested :call s:session_load()

command! Fzfcache call s:fzf_cache()
command! Fzfopencache call s:fzf_open_cache()
command! Fzfwatchdog call s:fzf_watchdog_cache()
command! Fzfkillwatchdog call s:fzf_kill_watchdog()
