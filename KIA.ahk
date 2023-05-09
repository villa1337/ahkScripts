^0::
{
IB := InputBox("What do you wanna know about? ", "OWL", "w100 h200")
if IB.Result = "Cancel"
    MsgBox "You entered '" IB.Value "' but then cancelled."
else
	run "https://en.wikipedia.org/w/index.php?search=" . IB.Value
}