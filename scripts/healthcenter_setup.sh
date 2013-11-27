#!/bin/bash

chflags hidden /Applications/Utilities/GeekTool\ Helper.app

cd /Users
for USER in *
do
if test $USER != "Shared"
then
prefname=org.tynsoe.geeklet.shell.plist
if [ -f /Users/$USER/Library/Preferences/$prefname ]
then
sudo rm /Users/$USER/Library/Preferences/$prefname
fi
cp /tmp/$prefname /Users/$USER/Library/Preferences/
chown $USER:admin /Users/$USER/Library/Preferences/$prefname
chmod 744 /Users/$USER/Library/Preferences/$prefname

prefname=org.tynsoe.GeekTool.plist
if [ -f /Users/$USER/Library/Preferences/$prefname ]
then
rm /Users/$USER/Library/Preferences/$prefname
fi
cp /tmp/$prefname /Users/$USER/Library/Preferences/
chown $USER:admin /Users/$USER/Library/Preferences/$prefname
chmod 744 /Users/$USER/Library/Preferences/$prefname

prefname=org.tynsoe.geektool3.plist
if [ -f /Users/$USER/Library/Preferences/$prefname ]
then
rm /Users/$USER/Library/Preferences/$prefname
fi
cp /tmp/$prefname /Users/$USER/Library/Preferences/
chown $USER:admin /Users/$USER/Library/Preferences/$prefname
chmod 744 /Users/$USER/Library/Preferences/$prefname

APPNAME="GeekTool Helper"
for FILE in /Users/$USER/Library/Application\ Support/Dock/*
do
DBFILE=`echo $FILE | fgrep -c ".db"`
if test $DBFILE != "0"
then
sudo sqlite3 "$FILE" "DELETE from apps WHERE title='$APPNAME'"
fi
done
killall Dock
fi

cp /tmp/org.tynsoe.geeklet.shell.plist /System/Library/User\ Template/English.lproj/Library/Preferences/
cp /tmp/org.tynsoe.geeklet.shell.plist /System/Library/User\ Template/German.lproj/Library/Preferences/
cp /tmp/org.tynsoe.GeekTool.plist /System/Library/User\ Template/English.lproj/Library/Preferences/
cp /tmp/org.tynsoe.GeekTool.plist /System/Library/User\ Template/German.lproj/Library/Preferences/
cp /tmp/org.tynsoe.geektool3.plist /System/Library/User\ Template/English.lproj/Library/Preferences/
cp /tmp/org.tynsoe.geektool3.plist /System/Library/User\ Template/German.lproj/Library/Preferences/
done