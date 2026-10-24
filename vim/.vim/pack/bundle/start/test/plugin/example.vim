let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

python3 << endPython
import sys
from os.path import normpath, join
import vim
plugin_root_dir = vim.eval('s:plugin_root_dir')
python_root_dir = normpath(join(plugin_root_dir, '..', 'python'))
sys.path.insert(0, python_root_dir)
import sample
endPython

function! PrintCountry()
  python3 sample.print_country()
endfunction
command! -nargs=0 PrintCountry call PrintCountry()

function! InsertCountry()
  python3 sample.insert_country()
endfunction
command! -nargs=0 InsertCountry call InsertCountry()
