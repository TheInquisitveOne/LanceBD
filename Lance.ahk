#Persistent
SetTimer, Focus, 250
return

Focus:
WinGetActiveTitle, Name
NameSplit := StrSplit(Name, A_Space)
OutputVar := % "" NameSplit[NameSplit.Length()]
if (OutputVar=="Chrome"){
   	a := "^{Tab}"
	b := "^+{Tab}"
	c := "^{w}"
}
else{
	a := "{Volume_Up}"
	b := "{Volume_Down}"
	c := "{Volume_Mute}"
	
}



F22:: Send %a%
return
F23:: Send %b%
return
F24:: 
	Send %c%
	Sleep, 200
return
