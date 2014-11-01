-- Get system date and convert it to mm--dd--yy format --
set todaysDate to (current date)
set {d, m, y} to {day, month, year} of todaysDate

set yearString to text -2 thru -1 of ("0" & (y mod 100))

set monthList to {January, February, March, April, May, June, July, August, September, October, November, December}
repeat with i from 1 to 12
	if m = (item i of monthList) then
		set monthString to text -2 thru -1 of ("0" & i)
		exit repeat
	end if
end repeat

set todaysDate to " - " & monthString & "/" & d & "/" & yearString

set l_backupfolder to "Backup"

tell application "Finder"
	activate
	select window of desktop
	if not (folder (l_backupfolder) exists) then
		make new folder at desktop with properties {name:l_backupfolder}
	else
		display dialog "You seem to have already backed up today. Backing up again may overwrite some files. Continue anyways?" buttons {"Cancel", "OK"} default button 2
	end if
end tell

tell application "iCal" to activate
tell application "System Events"
	tell menu item "Back up Database…" of menu "File" of menu bar 1 of application process "iCal" to click
	delay 3
	keystroke "iCal" & todaysDate
	keystroke "d" using command down
	delay 3
	keystroke tab
	keystroke return
	delay 5
end tell

tell application "Address Book" to activate

tell application "System Events"
	tell menu item "Back up Address Book…" of menu "File" of menu bar 1 of application process "Address Book" to click
	delay 1
	keystroke "Address Book" & todaysDate
	keystroke "d" using command down
	delay 1
	keystroke tab
	keystroke return
	delay 5
end tell


tell application "Finder"
	activate
	move file ("iCal" & todaysDate & ".icbu") in desktop to folder l_backupfolder in desktop
	move file ("Address Book" & todaysDate) in desktop to folder l_backupfolder in desktop
end tell

do shell script "cd ~/Desktop"
do shell script "tar zcvf ~/Desktop/backup.tgz ~/Desktop/" & l_backupfolder
do shell script "scp ~/Desktop/backup.tgz user@host:~/backups/"
do shell script "rm -rfv ~/Desktop/backup.tgz"
