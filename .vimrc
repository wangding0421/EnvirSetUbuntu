set nocompatible

"======================"
" Vundle configuration "
"======================"

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
if isdirectory(expand('$HOME/.vim/bundle/Vundle.vim'))
  call vundle#begin()
  " Required
  Plugin 'gmarik/vundle'
  " Install plugins that come from github.  Once Vundle is installed, these can be
  " installed with :PluginInstall
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'Valloric/MatchTagAlways'
  Plugin 'vim-scripts/netrw.vim'
  Plugin 'tpope/vim-sensible'
  Plugin 'SirVer/ultisnips'
  " Provide many default snippets for a variety of snippets.
  " Uncomment and :PluginInstall to enable
  " Plugin 'honza/vim-snippets'

  call vundle#end()
else
  echomsg 'Vundle is not installed. You can install Vundle from'
      \ 'https://github.com/VundleVim/Vundle.vim'
endif

" Load the default google configuration
source /usr/share/vim/google/google.vim

filetype plugin indent on

"===================="
" Some basic options "
"===================="

" Enable syntax highlighting
syntax on

" Uncomment if you want to map ; to : to cut down on chording
" nnoremap ; :

" Automatically change the working path to the path of the current file
autocmd BufNewFile,BufEnter * silent! lcd %:p:h

" Show line numbers
set number

" use » to mark Tabs and ° to mark trailing whitespace. This is a
" non-obtrusive way to mark these special characters.
set list listchars=tab:»\ ,trail:°

" Highlight the search term when you search for it.
set hlsearch

" By default, it looks up man pages for the word under the cursor, which isn't
" very useful, so we map it to something else.
nnoremap <s-k> <CR>

" Explicitly set the Leader to comma. You you can use '\' (the default),
" or anything else (some people like ';').
let mapleader=','

"==================================="
" Load and Configure Google Plugins "
"==================================="
" For more plugins, see go/vim/plugins

" :PiperSelectActiveFiles comes by default from google.vim. It's so useful that
" we map it to <leader>p (i.e., ,p).
" Use :h piper for more details about the piper integration
noremap <unique> <leader>p :PiperSelectActiveFiles<CR>

" Load the blaze plugins, with the ,b prefix on all commands.
" Thus, to Blaze build, you can do <leader>bb.
" Since we've set the mapleader to ',' above, this should be ,bb in practice
Glug blaze plugin[mappings]='<leader>b'

" Loads youcompleteme, the awesomest autocompletion engine.
" See go/ycm for more details.
Glug youcompleteme-google

" GTImporter is a script that uses GTags to find and sort Java imports. This is
" only useful for Java, so you will want to remove these lines if you don't use
" Java. You can use with codefmt to auto-sort on write with:
" autocmd FileType java AutoFormatBuffer gtimporter
Glug gtimporter
" Import the work under the cursor
nnoremap <leader>si :GtImporter<CR>
" Sort the imports in the (java) file
nnoremap <leader>ss :GtImporterSort<CR>

" Load the code formatting plugin. We first load the open-source version. Then,
" we load the internal google settings. Then, we automatically enable formatting
" when we write the file for Go, BUILD, proto, and c/cpp files.
" Use :h codefmt-google or :h codefmt for more details.
Glug codefmt
Glug codefmt-google

" Wrap autocmds inside an augroup to protect against reloading this script.
" For more details, see:
" http://learnvimscriptthehardway.stevelosh.com/chapters/14.html
augroup autoformat
  autocmd!
  " Autoformat BUILD files on write.
  autocmd FileType bzl AutoFormatBuffer buildifier
  " Autoformat go files on write.
  autocmd FileType go AutoFormatBuffer gofmt
  " Autoformat proto files on write.
  autocmd FileType proto AutoFormatBuffer clang-format
  " Autoformat c and c++ files on write.
  autocmd FileType c,cpp AutoFormatBuffer clang-format
augroup END

" Load the G4 plugin, which allows G4MoveFile, G4Edit, G4Pending, etc.
" Use :h g4 for more details about this plugin
Glug g4

" Load the Related Files plugin. Use :h relatedfiles for more details
Glug relatedfiles
nnoremap <unique> <leader>rf :RelatedFilesWindow<CR>

" Enable the corpweb plugin, which allows us to open codesearch from vim
Glug corpweb
" search in critique for the word under the cursor
nnoremap <leader>ws :CorpWebCs <cword> <Cr>
" search in critique for the current file
nnoremap <leader>wf :CorpWebCsFile<CR>

" Load the Critique integration. Use :h critique for more details
Glug critique
