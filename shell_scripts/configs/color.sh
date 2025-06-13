#!/bin/bash4

# Color variables
black='\033[0;30m'
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
blue='\033[0;34m'
magenta='\033[0;35m'
cyan='\033[0;36m'
lightgray='\033[0;37m'

dardgray='\033[1;30m'
lightred='\033[1;31m'
lightgreen='\033[1;32m'
lightyellow='\033[1;33m'
lightblue='\033[1;34m'
lightpurple='\033[1;35m'
lightcyan='\033[1;36m'
white='\033[1;37m'

# Clear the color after that
clear='\033[0m'

case EXPRESSION in

  PATTERN_1)
    STATEMENTS
    ;;

  PATTERN_2)
    STATEMENTS
    ;;

  PATTERN_N)
    STATEMENTS
    ;;

  *)
    STATEMENTS
    ;;
esac


echo -e "The color is: ${red}red${clear}!"
echo -e "The color is: ${green}green${clear}!"
echo -e "The color is: ${yellow}yellow${clear}!"
echo -e "The color is: ${blue}blue${clear}!"
echo -e "The color is: ${magenta}magenta${clear}!"
echo -e "The color is: ${cyan}cyan${clear}!"

echo -e "The color is: ${dardgray}dardgray${clear}!"
echo -e "The color is: ${lightred}lightred${clear}!"
echo -e "The color is: ${lightgreen}yellow${clear}!"
echo -e "The color is: ${lightyellow}lightyellow${clear}!"
echo -e "The color is: ${lightblue}lightblue${clear}!"
echo -e "The color is: ${lightpurple}lightpurple${clear}!"
echo -e "The color is: ${lightcyan}lightpurple${clear}!"
echo -e "The color is: ${white}white${lightpurple}!"
