tree -if --noreport -I 'venv|env|node_modules|.git|__pycache__' -a | grep -v '\/$' > .cache.fzf
