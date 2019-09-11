#Persistent
SetTimer, Focus, 250
return

quaterSecondYoutubeCountForYoutubeThings := 0

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
        rightsies := "{Volume_Up}"
	    leftsies := "{Volume_Down}"
	    clicksies := "{k}"
    } else {
        rightsies := "^{Tab}"
	    leftsies := "^+{Tab}"
	    clicksies := "^{w}"
    }
} else if(CouldMaybeBeChromeIDontKnow=="Word") {
    rightsies := "{WheelDown 1}"
	leftsies := "{WheelUp 1}"
	clicksies := ""
} else if(CouldMaybeBeChromeIDontKnow=="Excel") {
    rightsies := "{WheelDown 1}"
	leftsies := "{WheelUp 1}"
	clicksies := ""
} else{
	rightsies := "{Volume_Up}"
	leftsies := "{Volume_Down}"
	clicksies := "{Volume_Mute}"
}



F22:: Send %rightsies%
return
F23:: Send %leftsies%
return
F24:: 
	Send %clicksies%
	Sleep, 200
return
