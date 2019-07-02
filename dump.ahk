#NoEnv
#SingleInstance Force
SetBatchLines -1
ListLines Off
ComObjError(False)

; =================================
;		界面
; =================================
Gui, Margin, 0, 0
Gui Add, ActiveX, w800 h500 vWB, Shell.Explorer
Gui, Show

; =================================
;		打开网页，并等待加载完毕
; =================================
OpenDashBoardPage:
WB.Navigate("https://github.com/eyulingo/eyulingo-ci/blob/master/README.md")
While WB.readystate != 4 or WB.busy
	Sleep 10

xpObj := oXML.selectNodes("//*[@id="readme"]/article/table")
msgbox % xpObj.text
return