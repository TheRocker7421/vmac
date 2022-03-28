#disable spotlight indexing
sudo mdutil -i off -a

#Create new account
sudo dscl . -create /Users/TheRocker7421
sudo dscl . -create /Users/TheRocker7421 UserShell /bin/bash
sudo dscl . -create /Users/TheRocker7421 RealName $4
sudo dscl . -create /Users/TheRocker7421 UniqueID 1001
sudo dscl . -create /Users/TheRocker7421 PrimaryGroupID 80
sudo dscl . -create /Users/TheRocker7421 NFSHomeDirectory /Users/tcv
sudo dscl . -passwd /Users/TheRocker7421 TheRocker7421-MacOS
sudo dscl . -passwd /Users/TheRocker7421 TheRocker7421-MacOS
sudo createhomedir -c -u TheRocker7421 > /dev/null
sudo dscl . -append /Groups/admin GroupMembership username

#Enable VNC
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -allowAccessFor -allUsers -privs -all
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -configure -clientopts -setvnclegacy -vnclegacy yes 

echo $2 | perl -we 'BEGIN { @k = unpack "C*", pack "H*", "1734516E8BA8C5E2FF1C39567390ADCA"}; $_ = <>; chomp; s/^(.{8}).*/$1/; @p = unpack "C*", $_; foreach (@k) { printf "%02X", $_ ^ (shift @p || 0) }; print "\n"' | sudo tee /Library/Preferences/com.apple.VNCSettings.txt

#Start VNC/reset changes
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -restart -agent -console
sudo /System/Library/CoreServices/RemoteManagement/ARDAgent.app/Contents/Resources/kickstart -activate

#install ngrok
brew install --cask ngrok

#configure ngrok and start it
ngrok authtoken 271QWb0iwinppFn84UEzGBCX7qz_3MtDfRQUUmjyW3gcr6rH4
ngrok tcp 5900 --region=eu &
