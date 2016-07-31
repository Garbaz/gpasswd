
Dir="$( dirname "$0")"
. $Dir/conf.sh

if [ -z "$1" ];then
gpg -d "$File"
else
gpg -d "$File" | grep -i "$1"
fi
