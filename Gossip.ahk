^-::
{
IB := InputBox("Who are you stalking? ", "OWL", "w100 h200")
if IB.Result = "Cancel"
    MsgBox "You entered '" IB.Value "' but then cancelled."
else
	run "https://jira.argo.local/secure/ViewProfile.jspa?name=" . IB.Value
}