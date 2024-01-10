#!/bin/bash

version="v0.1.0"

# Level Easy 

if [ "$2" = "getinfo" ]; then
        case $1 in
                "cpu")
                        lscpu
                ;;
                "memory")
                        free 
                ;;
        esac
elif [ "$1" = "--version" ]; then
        echo $0 $version
elif [ "$1" = "--help" ]; then
        man ./manual-internsctl

# Level Intermediate

elif [ "$1" = "user" ]; then
        case $2 in
                "create")
                        sudo useradd -m $3
                        sudo su --shell=/bin/bash - $3
                ;;
                "list")
                        if [ "$3" = "--sudo-only" ]; then
                                grep -Po '^sudo.+:\K.*$' /etc/group
                        else
                                awk -F: '$3 >= 1000 && $3 < 65534 { print $1 }' /etc/passwd
                        fi
                ;;             
        esac
# Level Advanced

elif [ "$1" = "file" ]; then
        if [ "$2" = "--size" || "$2" = "-s" ]; then
                code
        elif [ "$2" = "--permissions" || "$2" = "-p" ]; then
                code
        elif [ "$2" = "--owner" || "$2" = "-o" ]; then
                code
        elif [ "$2" = "--last-modified" || "$2" = "-m" ]; then
                code
        else
                code
        fi

else
        man ./manual-internsctl

fi