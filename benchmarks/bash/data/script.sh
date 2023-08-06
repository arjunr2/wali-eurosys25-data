set -x
ls -la > /dev/null
head -c 262144 </dev/urandom > randomfile
cat randomfile
echo "done catting"
ps aux --sort pid | head -n30 | awk {'print $2" "$10'}
