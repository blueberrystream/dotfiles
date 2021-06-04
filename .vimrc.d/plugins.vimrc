let s:dein_dir = expand('~/.vim/bundles')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
let s:dein_toml_file = expand('~/.vimrc.d/dein/plugins.toml')
let s:dein_lazy_toml_file = expand('~/.vimrc.d/dein/plugins-lazy.toml')

if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
let &runtimepath = s:dein_repo_dir . ',' . &runtimepath

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  call dein#load_toml(s:dein_toml_file, {'lazy': 0})
  call dein#load_toml(s:dein_lazy_toml_file, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

let s:removed_plugins = dein#check_clean()
if len(s:removed_plugins) > 0
  call map(s:removed_plugins, "delete(v:val, 'rf')")
  call dein#recache_runtimepath()
endif

filetype plugin indent on
