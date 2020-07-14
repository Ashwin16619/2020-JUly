On Error Resume Next

Dim oShell, oFSO, sCurDir, Userprofile, sAlluser

Set oShell=CreateObject("WScript.Shell")
Set oFSO=CreateObject("Scripting.FileSystemObject")

sCurDir=Left(WScript.ScriptFullName, InStrRev(WScript.ScriptFullName, "\") - 1)
Userprofile=oShell.ExpandEnvironmentStrings ("%Userprofile%")
AD=oShell.ExpandEnvironmentStrings ("%APPDATA%")
sAlluser=oShell.ExpandEnvironmentStrings ("%AllUsersProfile%")


' To Copy the deployment.properties to under User LocalLow folder
'-----------------------------------------------------------------------
   
If NOT oFSO.FolderExists (AD & "\SAP\") Then oFSO.CreateFolder (AD & "\SAP\")

If NOT oFSO.FolderExists (AD & "\SAP\Cof") Then oFSO.CreateFolder (AD & "\SAP\Cof\")
   If oFSO.FileExists(sCurDir & "\Ao_user_roaming.config") Then

	oFSO.copyfile sCurDir & "\Ao_user_roaming.config" ,AD & "\SAP\Cof\"

   End If

