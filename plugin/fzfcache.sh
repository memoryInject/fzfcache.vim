tree -if --noreport -I 'env|node_modules|.git|__pycache__' -a | grep -v '\/$' > .cache.fzf
