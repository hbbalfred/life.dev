on run {input, parameters}
	
	set prevResult to item 1 of input
	
	if prevResult begins with "NO_SERVER::" then
		set AppleScript's text item delimiters to "NO_SERVER::"
		set remainingText to text item 2 of prevResult
		set AppleScript's text item delimiters to ""
		
		set command to "nvr --servername /tmp/nvimunity --remote-silent " & remainingText
		
		display dialog "Execute the command to start server:

" & command with title "Server is not running" buttons ("OK") with icon caution
		
		set the clipboard to command
	else
		tell application "Alacritty"
			activate
		end tell
		
	end if
	
	return input
end run
