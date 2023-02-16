#!/bin/bash
# premissa: o chrome deve estar aberto
# o web.whatsapp.com deve estar logado na segunda aba

function whats()
{
	search="$1"
	texto="$2"
	file="$3"
	DOWN=125
	UP=126
	osascript -e 'tell application "Google Chrome" to activate'	# Abrir o Chrome

	osascript -e 'tell application "System Events" to keystroke "2" using {command down}'	# Selecionar a segunda aba
	osascript -e 'tell application "System Events" to keystroke "l" using {command down}'	# ir para a location bar
	osascript -e 'tell application "System Events" to keystroke tab' 	# Comunidades
	osascript -e 'tell application "System Events" to keystroke "n" using {control down, command down}' # new chat shortcut

	osascript -e 'tell application "System Events" to keystroke "'"${search}"'"'
	sleep 1;
	osascript -e 'tell application "System Events" to keystroke tab' 	# Select the first
	osascript -e 'tell application "System Events" to keystroke return'			# enter
	sleep 1;
	osascript -e 'tell application "System Events" to keystroke "s" using {control down, command down}' # emoj shortcut
	osascript -e 'tell application "System Events" to key code 53'		# cancel to select message box
	if [ -e "$file" ]; then
	{
		osascript -e 'tell application "System Events" to keystroke return'			# to select contact and focus on the message field
		osascript -e 'tell application "System Events" to keystroke tab using {shift down}' 	# to select attachment
		osascript -e 'tell application "System Events" to keystroke return'			# to activate attach button
		osascript -e 'tell application "System Events" to key code '${UP} 			# up, to select document
		osascript -e 'tell application "System Events" to keystroke return'			# to open file input dialog
		sleep 2
		osascript -e 'tell application "System Events" to keystroke "/"'
		sleep 1
		osascript -e 'tell application "System Events" to keystroke "'"${file}"'"'
		sleep 1
		osascript -e 'tell application "System Events" to keystroke tab'
		osascript -e 'tell application "System Events" to keystroke return'			# accept the selected file
		sleep 1
		osascript -e 'tell application "System Events" to keystroke return'			# accept the selected file
		sleep 1;
	}
	fi;

	osascript -e 'tell application "System Events" to keystroke "'"${texto}"'"'
	osascript -e 'tell application "System Events" to keystroke return'
}

whats "$1" "$2" "$3"
