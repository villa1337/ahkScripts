#Z::
{
if WinExist("ahk_exe idea64.exe")
	WinKill
	Sleep 10000
	Run "C:\Users\villafra\Documents\Personal\Scripts\themeGenerator.bat"
	Sleep 11000
	if WinExist("ahk_exe idea64.exe")
		WinActivate
}