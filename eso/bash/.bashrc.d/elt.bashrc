#!/bin/bash

set +x

function msg {
    local port=""
    local cmdaddr=""
    local cmdns=""
    local cmd="$4"

    case $1 in
        ms)
            cmdaddr="${2^}Cmds"
            cmdns="msif"
            ;;

        std)
            cmdaddr="StdCmds"
            cmdns="stdif"
            ;;

        stub)
            cmdaddr="${2^}Cmds"
            cmdns="stubif"
            ;;
    esac

    case $2 in
        track)
            case $3 in
                ctr)
                    port=12082
                    ;;
            esac
            ;;

        foo)
            case $3 in
                ctr)
                    port=12543
                    ;;

                est)
                    port=12344
                    ;;
            esac
            ;;
    esac

    ( set -x; msgsend -u zpb.rr://127.0.0.1:"$port"/"$cmdaddr" ::"$cmdns"::"$cmdaddr"::"$cmd" ${5+"$5"} )
}

function njr {
    local appname=$1

    nomad job run \
-verbose \
-address http://127.0.0.1:4646 \
-var=prefix="$INTROOT" \
"$INTROOT"/resource/nomad/"$appname".nomad.hcl
}

# Nomad job stop
function njs {
    local args=()
    local posargs=()

    while [[ $# -gt 0 ]]; do
        case $1 in
            p)
                args+=('--purge')
                shift
                ;;
            *)
                posargs+=("$1")
                shift
                ;;
        esac
    done

    nomad job stop "${args[@]}" "${posargs[@]}"
}

# UA tools
function ua {
    local app=()
    local path=$2

    case $1 in
        b)
            app="uabrowse"
            ;;
        r)
            app="uaread"
            ;;
        w)
            app="uawrite"
            ;;
    esac

    "$app" -u 127.0.0.1:7677 -i 4 -p "$path" "${@:3}"
}

alias r='ranger'

alias ww='waf clean build install'
alias www='waf clean distclean configure build install'
alias wc='waf configure'
alias wcc='waf clean distclean configure'
alias wb='waf build'
alias wi='waf install'
alias wbi='waf build install'
alias wt='waf test --alltests'
alias wl='waf lint --lintall'

alias ns='nomad status'

alias servs='cii-services start all && sudo systemctl start consul && sudo systemctl start nomad'

alias ccp='cookiecutter /eltdev/lsv/template/project'
alias ccc='cookiecutter /eltdev/lsv/template/controller'
alias cce='cookiecutter /eltdev/lsv/template/estimator'
alias cco='cookiecutter /eltdev/lsv/template/opcuasim'

alias opcsim='opcuasim_testserver -a 127.0.0.1 -p 7677 -l INFO'

alias seqsrv='seqtool server --address 127.0.0.1:4444'
alias seqgui='seqtool gui --address 127.0.0.1:4444'

if [[ $- != *i* ]]; then
       export INTROOT=/INTROOT
       export DATAROOT=/DATAROOT
       export PREFIX=$INTROOT
       export CFGPATH=${INTROOT}/resource:${CFGPATH}
       export PATH=${INTROOT}/bin:${PATH}
       export LD_LIBRARY_PATH=${INTROOT}/lib64:${LD_LIBRARY_PATH}
       export PYTHONPATH=${INTROOT}/lib/python3.11/site-packages:${PYTHONPATH}
       export CII_LOGS=/var/log/elt
fi

export NOMAD_ADDR='http://127.0.0.1:4646'

# if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
#     cd /eltdev
# fi

export PROMPT_COMMAND='history -a;history -r'
shopt -s histappend

HISTSIZE=-1
HISTFILESIZE=-1
