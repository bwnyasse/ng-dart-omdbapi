#!/bin/bash

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`
txtbld=`tput bold`

echo "${txtbld}${green}Activate Global test runner : [pub global activate test_runner] ------------------ ${reset}" \
&& pub global activate test_runner \
&& echo "${txtbld}${green}Test running : [run_tests -c ] ------------------ ${reset}" \
&& run_tests -c \


