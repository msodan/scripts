alias jumphost='ssh -f msodan@tosjump ls'
alias res="clear && reset" 
export PAGER="most"
DATE=`date +%Y-%m-%d`

function fh() { sed '/^#/d;/^$/d; $!N;s/\n/\t\t/' /etc/ssh/ssh_config |grep $1| awk '{print "ssh " $2}' ; }
function fhl() { sed '/^#/d;/^$/d; $!N;s/\n/\t\t/' /etc/ssh/ssh_config |grep $1 ; }

alias ionmosh='mosh msodan@ion.threadx.de'
alias ionssh='ssh msodan@ion.threadx.de'
alias berndserver='ssh ftp1155415@vwp0646.webpack.hosteurope.de'
alias puppetlint='puppet-lint --no-80chars-check --with-filename'

function gimmi {

    local H="${1}"
    local C="${2}"

    ssh "${H}" -t "sudo puppet resource exec psh command=\"/bin/cat /home/${USER}/.ssh/authorized_keys >> /root/.ssh/authorized_keys\";"
    echo
    echo -e " \e[00;31m \033[5m look mommy, its a rootshell! \e[00m"
    echo

    if [[ "xy" == "x${C}y" ]]
    then
      ssh -t "root@${H}"
    else
      ssh -t "root@${H}" "${C}"
    fi
}

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;37m\]\u\`\h\[\033[01;33m\] \W \$\[\033[00m\] '
