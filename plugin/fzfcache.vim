echo "fzf cache ..."

let s:this_file_dir = expand('<sfile>:p:h')

function! s:fzf_cache()
    exe 'AsyncRun bash ' . s:this_file_dir . '/fzfcache.sh'
    echo 'fzf caching...'
endfunction

command! Fzfcache call s:fzf_cache()
