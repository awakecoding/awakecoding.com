---
title: 'Import-RDMSession'
date: 2024-11-06
---


# Import-RDMSession

## SYNOPSIS
Import RDM sessions from a file

## SYNTAX

```
Import-RDMSession [[-DuplicateAction] <String>] [[-Group] <String>] [-Path] <String>
 [[-Password] <SecureString>] [-KeepID] [-SetSession] [-ForcePromptAnswer <DialogResult[]>]
 [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
Import RDM sessions from a file.
To save the sessions in the data source, the parameter SetSession must be used.
The supported files are '.rdm' and '.json'.

## EXAMPLES

### EXAMPLE 1
```
PS C:\> $sessions = Import-RDMSession -Path "C:\MyFile.rdm" -Group "DestinationGroup" -DuplicateAction "Add"
```

Obtain all sessions in the file "MyFile.rdm" and prepend their group with DestinationGroup.
In case a session already existed, a new ID will be assigned to it.

### EXAMPLE 2
```
PS C:\> $pwd = ConvertTo-SecureString "myPassword" -AsPlainText; $sessions = Import-RDMSession -Path "C:\MyFile.rdm" -Password $pwd | Set-RDMSession
```

Obtain all sessions in the password protected file "MyFile.rdm".
In case a session already existed, it will be ignored.
All sessions are saved in the current data source.

## PARAMETERS

### -DuplicateAction
Action when a duplicate is found.
Must be one of the following:

"Add", "Overwrite", "Ignore"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ForcePromptAnswer
Switch to use with caution.
It will automatically answer prompt asking yes/no, yes/no/cancel, or ok/cancel questions.
In case of multiple prompts, multiple values can be passed to this parameter.
Here are the accepted values:
- Yes: Accept the prompt.
Cover the OK and Automatic value.
- No: Refuse the yes/no/cancel prompt.
Cancel is the fallback option if there is not an option No.
- Cancel: Cancel the yes/no/cancel prompt.
No is the fallback option if there is not an option Cancel.

```yaml
Type: DialogResult[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Group
The group where the sessions will be saved.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -KeepID
Keep the entries' ID.
Unwanted behaviors, such as moving an entry if imported in the same database, might occurs if this option is present.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Password
Password to access a password protected file.

```yaml
Type: SecureString
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Path
Path where the file is loaded.
Must be finish:

"RDM: .rdm", "XML: .xml", "JSON: .json"

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SetSession
Save all imported sessions.
Required to import the documents and attachments included in sessions.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ProgressAction
{{ Fill ProgressAction Description }}

```yaml
Type: ActionPreference
Parameter Sets: (All)
Aliases: proga

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None
## OUTPUTS

### RemoteDesktopManager.PowerShellModule.PSOutputObject.PSConnection
## NOTES
For more information, type "Get-Help Import-RDMSession -detailed".
For technical information, type "Get-Help Import-RDMSession -full".

## RELATED LINKS

[Set-RDMSession](http://127.0.0.1:1111/docs/Set-RDMSession/)

