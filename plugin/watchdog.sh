#!/bin/bash
daemon() {
    chsum1=""

    while [[ true ]]
    do
        if command -v tree &> /dev/null
        then 
            chsum2=`tree -if --noreport -I 'env|venv|node_modules|.git|__pycache__' -a | grep -v '\/$';`
            if [[ $chsum1 != $chsum2 ]] ; then           
                if [ -n "$chsum1" ]; then
                    echo "found!"
                    tree -if --noreport -I 'env|venv|node_modules|.git|__pycache__' -a | grep -v '\/$' > .cache.fzf
                fi
                chsum1=$chsum2
            fi
        else
            chsum2=`find ./ -type f -exec cksum <<< {} \;`
            if [[ $chsum1 != $chsum2 ]] ; then           
                if [ -n "$chsum1" ]; then
                    echo "found!"
                    find -type f -not -path '*/venv/*' -not -path '*/env/*' -not -path '*/node_modules/*' -not -path '*/.git/*' -not -path '*/__pycache__/*' > .cache.fzf
                fi
                chsum1=$chsum2
            fi
        fi
        sleep 2
    done
}

daemon
