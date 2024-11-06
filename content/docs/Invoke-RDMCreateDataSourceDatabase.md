---
title: 'Invoke-RDMCreateDataSourceDatabase'
date: 2024-11-06
---


# Invoke-RDMCreateDataSourceDatabase

## SYNOPSIS
Create a new Database

## SYNTAX

```
Invoke-RDMCreateDataSourceDatabase [[-AzureDatabaseEdition] <AzureDatabaseEdition>]
 [[-AzureDatabaseMaxSize] <AzureDatabaseMaxSize>]
 [[-AzureDatabaseServiceObjective] <AzureDatabaseServiceObjective>] [-DataSource] <PSDataSource>
 [-ForcePromptAnswer <DialogResult[]>] [-ProgressAction <ActionPreference>] [<CommonParameters>]
```

## DESCRIPTION
## EXAMPLES

### EXAMPLE
```
PS C:\> $ds = New-RDMDataSource -SQLServer -Database 'PSTestCreation5' -Name 'PSSQLServerCreation' -Server 'localhost' -Username 'sa' -Password (ConvertTo-SecureString 'masterkey' ∩┐╜asplaintext ∩┐╜force); Invoke-RDMCreateDataSourceDatabase -DataSource $ds
```

Create a SQL Server data source and create the database

## PARAMETERS

### -AzureDatabaseEdition
Azure database edition.

```yaml
Type: AzureDatabaseEdition
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -AzureDatabaseMaxSize
Azure database maximum size.

```yaml
Type: AzureDatabaseMaxSize
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -AzureDatabaseServiceObjective
Azure database service objective.

```yaml
Type: AzureDatabaseServiceObjective
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -DataSource
PSSession object, must be retrieved from Get-RDMSession or created via New-RDMSession that you want to unparented.

```yaml
Type: PSDataSource
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
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

### None
## NOTES
For more information, type "Get-Help Invoke-RDMCreateDataSourceDatabase -detailed".
For technical information, type "Get-Help Invoke-RDMCreateDataSourceDatabase -full".

## RELATED LINKS
