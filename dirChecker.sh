#!/bin/sh
#   \----------------------------------.
#   /   Directories Checker script      |
#   \   version :   0.1                 |    
#   /   By: Osama Momani                |
#   \   CopyLift!                       |
#   /-----------------------------------'

#	University ID : 134746
#	Why this code is huge ? Because it works 100% in all Unix-like Shells (sh) as it only use tools that are available in all Unix-Like systems and does NOT require any other tools like (find,sort, etc). Also it has a STUNNING Styles. 

# inisalize Style Sequences variables  (for Colors)  ((( NOTE : These variables are used in form of '${}' insted of '$'  to make the code more readalbe ))) 
NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
YELLOW='\033[1;33m'
WHITE='\033[1;37m'
#\/\//\/\/\/\/\/\//\/\/\/\/\/\//\/\/\/\/\/\//\/\/\/\/
while true ; do  # Start Loop
clear 

echo " ${RED}╔─╗┬┬─┐┌─┐┌─┐┌┬┐┌─┐┬─┐┬ ┬  ╔═╗┬ ┬┌─┐┌─┐┬┌─┌─┐┬─┐"
echo " ${RED}║ ║│├┬┘├┤ │   │ │ │├┬┘└┬┘  ║  ├─┤├┤ │  ├┴┐├┤ ├┬┘ ${BLUE}${0}"  # "you must use positional parameters to print ScriptName  = OK " 
echo " ${RED}═─╝┴┴└─└─┘└─┘ ┴ └─┘┴└─ ┴   ╚═╝┴ ┴└─┘└─┘┴ ┴└─┘┴└─ ${BLUE}V:0.1"
echo "${BLUE}     ╔╗ ┬ ┬ ${WHITE} ╔═╗┌─┐┌─┐┌┬┐┌─┐  ╔╦╗┌─┐┌┬┐┌─┐┌┐┌ ┬"
echo "${BLUE}     ╠╩╗└┬┘ ${WHITE} ║ ║└─┐├─┤│││├─┤  ║║║│ ││││├─┤│││ │"
echo "${BLUE}     ╚═╝ ┴  ${WHITE} ╚═╝└─┘┴ ┴┴ ┴┴ ┴  ╩ ╩└─┘┴ ┴┴ ┴┘└┘ ┴"                                                                                                                                                                         

#\/\//\/\/\/\/\/\//\/\/\/\/\/\//\/\/\/\/\/\//\/\/\/\/

echo "=-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-==-=-=-=-=-=-=-=-==-=-=-=-${NOCOLOR}"
if [ -z $1 ];then
    echo "${RED}You Should Enter The File Path rel/abs ${WHITE}( ./dirChecker arg1 ) 
	${NOCOLOR}"; break ;
elif [ $2 ];then
    echo "${RED}Only 1 arg is Need ${WHITE}( ./dirChecker arg1 ) 
	${NOCOLOR} "; break ;
fi

#--------

if [  -d "$1" ]; then
    echo "Selcted Path is ${YELLOW} $1" ; 
else
    echo "Directory not exist${NOCOLOR}" ; break ;
fi

case $1 in 
    /*)
        echo "(absolute)";;
    *)
        echo "(relative)";;
esac

# <-- start of program -->
sleep 1 
echo "$IFS ${GREEN}PLEASE SELECT A CHOICE for the given directory ... :-"
echo "${GREEN}   1.${WHITE} List name of all files that end with .sh only."
echo "${GREEN}   2.${WHITE} List name of all files that are writable."
echo "${GREEN}   3.${WHITE} List name and size of the file with largest size."
echo "${GREEN}   4.${WHITE} List all filenames that have at least one digit."
echo "${GREEN}   5.${WHITE} Exit (Ctrl+C)$IFS"

read i
case $i in 
    1)
	echo "${GREEN}End with (.sh) "	
        echo "${PURPLE} $(ls $1*.sh)"
        ;;
    2)
	echo "${GREEN}Writable Files"
        for f in $1/* ;do  # all files in directory
            if [ "$(ls -l $f | cut -d ' ' -f 1 | grep 'w')"  ]; then   # if it has "w" on the fisrt column in ls -l
                echo "${PURPLE} $f "
            fi
        done 
        ;;
    3)
	    echo "     ${GREEN} Largest file :${PURPLE} $(ls -Slash $1 |head -n 2 |tail -1 |rev| cut -d ' ' -f 1 |rev) (${YELLOW}$(ls -Slash $1 |head -n 2 |tail -1 | cut -d ' ' -f 1 )${WHITE})  ";  #reverse columns & text
        ;;
    4)
	echo "Contain Digits"	
        if [ -z "$(ls $1/*[0-9]* 2> /dev/zero)" ];then  #incase of errors throw it to trash
            echo "${RED}There are no files with digits" 
        else 
            echo  "${GREEN}filse are : ${PURPLE}$IFS $(ls $1/*[0-9]* ) " 
        fi
        ;;
    5)
        echo "Exiting ... ${NOCOLOR}"
	sleep 1
	break; 
        ;;
    *)
        echo "${RED} Wrong Choice, Try Again " ; sleep 1 ; continue
        ;;
esac

echo "$IFS ${GREEN}Press any key to try again, or ${RED} C ${NOCOLOR} to exit"
read a

if [  "$a" = "C" -o "$a" = "c" ]; then
    break ;
fi
# <-- end of program -->

done  
