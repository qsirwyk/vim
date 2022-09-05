" 自定义调用命令 :DS 实现和 ,<Space> 一样的效果 也可以写成插件 (具体用法查看文档)
" -nargs=* 为参数属性，指这个命令后面可以带0个或多个参数
" 在函数的参数部分设置 <f-args> 标记，这样命令后面带的参数就能传递到函数中去
command! -nargs=* DS call DelSpaceLine(<f-args>)

" 函数首字母得大写固定格式
" 脚本中的语句相当于在命令行中输入的 不需要<CR>
" 因此普通模式命令 在命令前面加 normal
" function后面的感叹号 可以强制定义同名函数
function! DelSpaceLine()
   silent! %s/\s\+$//g " 删除行尾空格
   silent! %s/^\s\+$//g " 替换有空格的空行为没有空格的空行
   silent! %s/^\n\{2,\}/\r/g " 替换超过2行的空行为1个空行
endfunction
