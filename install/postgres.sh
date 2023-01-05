#! /bin/sh
RESET="\e[0m" BLACK="\e[30m" RED="\e[31m"
GREEN="\e[32m" YELLOW="\e[33m" BLUE="\e[34m" MAGENTA="\e[35m"
CYAN="\e[36m" WHITE="\e[37m" DEFAULT="\e[39m"

### Color Functions ##
greenprint() { printf "${GREEN}%s${RESET}\n" "$1"; }
blueprint() { printf "${BLUE}%s${RESET}\n" "$1"; }
redprint() { printf "${RED}%s${RESET}\n" "$1"; }
yellowprint() { printf "${YELLOW}%s${RESET}\n" "$1"; }
magentaprint() { printf "${MAGENTA}%s${RESET}\n" "$1"; }
cyanprint() { printf "${CYAN}%s${RESET}\n" "$1"; }

choose_version() {
    echo -ne "
Postgress version:
$(greenprint '1) Latest')
$(yellowprint '2) 14')
$(magentaprint '3) 13')
$(cyanprint '4) 12')
$(blueprint '5) 11')
6) 10
$(yellowprint '7) 9')
$(redprint '0) exit')
    Choose an option DEFAULT = 1:  "
    read -r ans
    case $ans in
        1)
            sudo apt-get -y install postgresql
        ;;
        2)
            sudo apt-get -y install postgresql-14
        ;;
        3)
            sudo apt-get -y install postgresql-13
        ;;
        4)
            sudo apt-get -y install postgresql-12
        ;;
        5)
            sudo apt-get -y install postgresql-11
        ;;
        6)
            sudo apt-get -y install postgresql-10
        ;;
        7)
            sudo apt-get -y install postgresql-9
        ;;
        0)
            echo "Bye bye."
            exit 0
        ;;
        *)
            sudo apt-get -y install postgresql
        ;;
    esac
}

sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - \
&& sudo apt-get update \
&& choose_version
