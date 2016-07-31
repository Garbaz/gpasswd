
# THERE IS NO GUARANTEE THAT THIS SCRIPT IS SECURE!

# Adds given combination of Title, Name and Password to ".p.gpg" in the users home directory.
#  Modify the File variable to change this behaviour.
# The values will be appended in the following form:
#  "$title | $name | $pass"
#  Modify the Delim variable to change the delimiter (Default: '|').
# The script should be POSIX compliant and therefore work in any shell (Tested in bash & sh).


title="$1"
name="$2"
pass="$3"

if [ -z "$title" ];then
	printf "Title:"
	read title
fi
if [ -z "$name" ];then
	printf "Name:"
	read name
fi
if [ -z "$pass" ];then
	again="again"
	while [ "$pass" != "$again" ];do
		printf "\nPass:\033[8m"
		stty -echo
		trap 'stty echo' EXIT
		read pass
		stty echo
		trap - EXIT
		printf "\033[0m"
		printf "\nAgain:\033[8m"
		stty -echo
		trap 'stty echo' EXIT
		read again
		stty echo
		trap - EXIT
		printf "\033[0m"
	done
fi
printf "\n"
printf "Decrypt pass file:\n"
if [ -e "$File" ];then
while true;do
passwds="$(gpg -d "$File")" && break
done
fi
if [ "${passwds:-1}" != "\n" ];then
	passwds="$passwds\n"
fi

printf "Append pass & Encrypt file:\n"
passwds="$passwds$title $Delim $name $Delim $pass\n"
if [ -e "$File" ];then mv "$File" "$File.old";fi
printf "$passwds" | gpg -c -o "$File"
