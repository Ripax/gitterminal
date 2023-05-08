#! /bin/tcsh
# Author : Anupam Biswas
# Date : 22Feb2023
# Script name : Term Decoration for git.

# Temp Color variable

set red="%{\o33[1;31m%}"
set green="%{\o33[0;32m%}"
set yellow="%{\o33[1;33m%}"
set blue="%{\o33[1;34m%}"
set magenta="%{\o33[1;35m%}"
set cyan="%{\o33[1;36m%}"
set white="%{\o33[1;37m%}"

set end="%{\o33[0m%}"
set darkgray="%{\o33[0;90m%}"

# Bg Color

set bg_blue="%{\o33[2;0;44;33m%}"
set bg_yellow="%{\o33[32;43m%}"
set themes="%{\o33[1;2;36;43m%}"
set bg="%{\o33[1;2;90;43m%}"

set pWd = `pwd`

if ( $?prompt ) then
    set git_branch = `sh -c 'git branch --no-color 2> /dev/null' | sed - e '/^[^*]/d' -e 's/* \(.*\)/\1 \'`
    if ($git_branch != '') then
        printf '\e]11;#383A37\a'
        printf '\e]2;${git_branch}\a'
        set prompt = '${bg}%m.$PL_SITE${end}${bg}${themes}%c${end}${bg}${git_branch}${end}%b%B \n>'
    else
        set prompt = '%n@%m.$PL_SITE:%B%/ >%b '
        printf '\e]2;$pWd\a'
    endif
endif

printf '\e]11;#383A37\a'

#Cleanup
unset red green blue magenta cyan white end bg_blue bg_yellow themes bg
