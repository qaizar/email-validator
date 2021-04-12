#!/usr/bin/env bash

# RFC standard of the email address could be found in rfc5322, rfc6854, etc.
#
# However, it is hard to escape all the special characters in the bash
# so, in this script, it will only check for the address syntax only
# 
# Please be noted that, it is not design to detect mailbox deliverability


filename=$1
declare -a valid_list=()
declare -a non_valid_list=()

regex="^([A-Za-z]+[A-Za-z0-9]*((\.|\-|\_)?[A-Za-z]+[A-Za-z0-9]*){1,})@(([A-Za-z]+[A-Za-z0-9]*)+((\.|\-|\_)?([A-Za-z]+[A-Za-z0-9]*)+){1,})+\.([A-Za-z]{2,})+$"

#Fucntion for email validation based on Regex
function validator {
  if [[ $1 =~ ${regex} ]]; then
    valid_list+=("${1}")
  else
    non_valid_list+=("${1}")
  fi
}

# Reading each email address from file, 
# validate against the regex and insert into valid or non-valid array
while IFS= read -r newline; do
      validator `echo $newline`
done < $filename

cat <<-EOF

**************************************************

Email address validator in bash

References:
- http://emailregex.com/email-validation-summary/

**************************************************

EOF

echo -e "\e[32m*********************************************\e[0m"
echo -e "\e[32m Total ${#valid_list[@]} Valid email address\e[0m"
echo -e "\e[32m*********************************************\e[0m"

for v_email in "${valid_list[@]}"; do
  printf "* %-48s \e[1;32m[pass]\e[m\n" "${v_email}"
done

echo ""
echo -e "\e[1;31m*********************************************\e[0m"
echo -e "\e[1;31m Total ${#non_valid_list[@]} Non-valid email address\e[0m"
echo -e "\e[1;31m*********************************************\e[0m"

for nv_email in "${non_valid_list[@]}"; do
  printf "* %-48s \e[1;31m[fail]\e[m\n" "${nv_email}"
done
