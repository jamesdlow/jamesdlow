do shell script "date +%m-%d-%y"
set todaysDate to result
set fileName to "ABBackup_" & todaysDate & ".abbu"
do shell script "echo $USER"
set userName to result
UIscript_check()
tell application "Address Book" to activate
tell application "System Events"
	tell menu item "Back up Address BookÉ" of menu "File" of menu bar 1 of application process "Address Book" to click
	delay 1
	keystroke fileName
	keystroke "d" using command down
	delay 1
	keystroke return
	delay 10
end tell
(*if not (folder (l_backupfolder) exists) then
       make new folder at desktop with properties {name:l_backupfolder}
   else*)
do shell script "mv -f /Users/$USER/Desktop/" & fileName & " /Users/$USER/Documents/ABBackup/"

tell application "Address Book"
	quit
end tell

on UIscript_check()
	-- get the system version
	set the hexData to system attribute "sysv"
	set hexString to {}
	repeat 4 times
		set hexString to ((hexData mod 16) as string) & hexString
		set hexData to hexData div 16
	end repeat
	set the OS_version to the hexString as string
	if the OS_version is less than "1030" then
		display dialog "This script requires the installation of " & Â
			"Mac OS X 10.3 or higher." buttons {"Cancel"} Â
			default button 1 with icon 2
	end if
	-- check to see if assistive devices is enabled
	tell application "System Events"
		set UI_enabled to UI elements enabled
	end tell
	if UI_enabled is false then
		tell application "System Preferences"
			activate
			set current pane to Â
				pane "com.apple.preference.universalaccess"
			set the dialog_message to "This script utilizes " & Â
				"the built-in Graphic User Interface Scripting " & Â
				"architecture of Mac OS X " & Â
				"which is currently disabled." & return & return & Â
				"You can activate GUI Scripting by selecting the " & Â
				"checkbox ÒEnable access for assistive devicesÓ " & Â
				"in the Universal Access preference pane."
			display dialog dialog_message buttons {"Cancel"} Â
				default button 1 with icon 1
		end tell
	end if
end UIscript_check