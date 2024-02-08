mkdir -p $HOME/.local/nvimunity

if [[ -n `/opt/homebrew/bin/nvr --serverlist | grep '/tmp/nvimunity'` ]]; then
	echo "$(date +"%Y-%m-%d %H:%M:%S") | $@" >> $HOME/.local/nvimunity/output.log
	/opt/homebrew/bin/nvr --servername /tmp/nvimunity --remote-silent $@
else
	echo "$(date +"%Y-%m-%d %H:%M:%S") | $@" >> $HOME/.local/nvimunity/output.log
	echo "NO_SERVER::$@"
fi
