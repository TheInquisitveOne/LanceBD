#Persistent
SetTimer, Focus, 250
return

quaterSecondYoutubeCountForYoutubeThings = 0

Focus:
WinGetActiveTitle, Name
NameSplit := StrSplit(Name, A_Space)
CouldMaybeBeChromeIDontKnow := % "" NameSplit[NameSplit.Length()]
if (CouldMaybeBeChromeIDontKnow=="Chrome"){
    if (NameSplit.Length() >= 4) {
        CouldMaybeBeYoutubeIDontKnow = % "" NameSplit[NameSplit.Length() - 3]
    } else {
        CouldMaybeBeYoutubeIDontKnow = "Definitely probably not youtube, probably, I don't know"
    }
    if (CouldMaybeBeYoutubeIDontKnow == "YouTube") {
        quaterSecondYoutubeCountForYoutubeThings++
    } else {
        quaterSecondYoutubeCountForYoutubeThings = 0
    }

    if (quaterSecondYoutubeCountForYoutubeThings >= 4) {
        a := "{Volume_Up}"
	    b := "{Volume_Down}"
	    c := "{Volume_Mute}"
    } else {
        a := "^{Tab}"
	    b := "^+{Tab}"
	    c := "^{w}"
    }
   	
} else if(CouldMaybeBeChromeIDontKnow=="Word") {
    a := "{WheelUp 1}"
	b := "{WheelDown 1}"
	c := ""

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
