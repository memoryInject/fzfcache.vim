# Vim FZF Cache Plugin 💾


Vim fzf cache for fast access large project directories and files.   
When running vim on project directory root ( nvim . ) this plugin will create   
.cache.fzf file to cache all files in the project (except for node_modules, env, venv, pycache, .git).  

This is a complementary plugin for session.vim: https://github.com/memoryInject/session.vim 

**Note: To use this plugin make sure to install   
- fzf for shell
- fzf vim: https://github.com/junegunn/fzf.vim
- AsyncRun: https://github.com/skywind3000/asyncrun.vim

****This plugin only works in linux and macos only**   
There is a workaround when using git bash on windows if you want to run this plugin under git bash on windows send me an email.

## Installation

Install with your favourite plugin manager but make sure it installed after vim fzf and AsyncRun


```vim
  Plug 'junegunn/fzf.vim'
  Plug 'skywind3000/asyncrun.vim'
  Plug 'memoryInject/fzfcache.vim'
```
    
## Usage/Examples

Setup a macro in vimrc to open fzf cache window

```vim
nnoremap <silent> <Leader>fc : Fzfopencache<return> 
```

To run manually on command:

```vim
" Create cache at root ./.cache.fzf
:Fzfcache

" Open fzf cache window
:Fzfopencache
```

This plugin does not need any other additional setup.  
When running ' nvim . ' on bash, it will create .cache.fzf file on the root directory. You can add .cache.fzf on .gitignore and delete after the project finish. 

```bash
nvim .
```

If there is no cache file and try to open  :Fzfopencache this will output 'Can not find cache file'   
If accedently delete .cache.fzf at root and open :Fzfopencache it will create new cache  
  
If you pass 'ns' argument when opening nvim ( nvim . ns ) this will disable the cache and won't create .cache.fzf file.

```bash
nvim . ns
```

## Contributing

Contributions are always welcome!  
For major changes, please open an issue first to discuss what you would like to change.


## License

[MIT](https://choosealicense.com/licenses/mit/)
