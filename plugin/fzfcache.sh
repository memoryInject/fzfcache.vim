if command -v tree &> /dev/null
then 
    tree -if --noreport -I 'venv|env|node_modules|.git|__pycache__' -a | grep -v '\/$' > .cache.fzf
else
    find -type f -not -path '*/venv/*' -not -path '*/env/*' -not -path '*/node_modules/*' -not -path '*/.git/*' -not -path '*/__pycache__/*' > .cache.fzf
fi
