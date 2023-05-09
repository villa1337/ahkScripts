#n::{
IB := InputBox("FRD-XXXX", "Enter Ticket Number", "w300 h100")
if IB.Result = "Cancel"
    MsgBox "You entered '" IB.Value "' but then cancelled."
else
	if DirExist("D:\Tickets\FRD-" . IB.Value)
		MsgBox "D:\Tickets\FRD-" . IB.Value " already exists."
	else
		DirCreate "D:\Tickets\FRD-" . IB.Value 
		RunWait "D:\src-f\buildFraud.bat"
		FileCopy "D:\src-f\fraudaml\fraud.core\fcs-deploy\target\argo-fraud-4.4.0.0-install-package.zip", "D:\Tickets\FRD-" . IB.Value
		RunWait A_ComSpec " /c wzunzip -d -q D:\Tickets\FRD-" . IB.Value "\argo-fraud-4.4.0.0-install-package.zip D:\Tickets\FRD-" . IB.Value 
		FileCopy "C:\Users\villafra\Documents\AutoHotkey\AuxFiles\image.analysis.config.xml", "D:\Tickets\FRD-" . IB.Value "\etc",  1
		FileCopy "C:\Users\villafra\Documents\AutoHotkey\AuxFiles\image.analysis.reanalyze.config.xml", "D:\Tickets\FRD-" . IB.Value "\etc", 1
		RunWait A_ComSpec " /c D:\Tickets\FRD-" . IB.Value "\bin\installer.bat --replay C:\Users\villafra\Documents\AutoHotkey\AuxFiles\def_install.txt"
		RunWait A_ComSpec " /c D:\Tickets\FRD-" . IB.Value "\bin\migrateDatabase.bat"
		RunWait A_ComSpec " /c D:\Tickets\FRD-" . IB.Value "\bin\run_FraudCoreService_Console.bat"
}
