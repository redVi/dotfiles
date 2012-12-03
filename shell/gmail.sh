#! /bin/bash
login="your@mail"
psswd="your_password"

new=`curl -u ${login}:${psswd} -s "https://mail.google.com/mail/feed/atom" | grep -c "<entry>"`
echo $new new
if [ $new != "0" ]
then
	aplay ~/.scripts/message.wav
fi
