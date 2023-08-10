Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

function Show-HiddenFiles {
    [CmdletBinding(DefaultParameterSetName = "On")]
    Param (
        [Parameter(Mandatory = $true, ParameterSetName = "On")]
        [System.Management.Automation.SwitchParameter]
        $On,

        [Parameter(Mandatory = $true, ParameterSetName = "Off")]
        [System.Management.Automation.SwitchParameter]
        $Off
    )
    Process {
        # Set a variable with the value we want to set on the registry value/subkey.
        if ($PSCmdlet.ParameterSetName -eq "On") { $Value = 1 }
        if ($PSCmdlet.ParameterSetName -eq "Off") { $Value = 2 }

        # Define the path to the registry key that contains the registry value/subkey
        $Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
        # Set the registry value/subkey.
        Set-ItemProperty -Path $Path -Name Hidden -Value $Value

        # Refresh open Explorer windows.
        # You will need to refresh the window if you have none currently open.
        # Create the Shell.Application ComObject
        $Shell = New-Object -ComObject Shell.Application
        # For each one of the open windows, refresh it.
        $Shell.Windows() | ForEach-Object { $_.Refresh() }
    }
}

function Show-FileExtensions {
    [CmdletBinding(DefaultParameterSetName = "Off")]
    Param (
        [Parameter(Mandatory = $true, ParameterSetName = "On")]
        [System.Management.Automation.SwitchParameter]
        $On,

        [Parameter(Mandatory = $true, ParameterSetName = "Off")]
        [System.Management.Automation.SwitchParameter]
        $Off
    )
    Process {
        # Set a variable with the value we want to set on the registry value/subkey.
        if ($PSCmdlet.ParameterSetName -eq "On") { $Value = 0 }
        if ($PSCmdlet.ParameterSetName -eq "Off") { $Value = 1 }

        # Define the path to the registry key that contains the registry value/subkey
        $Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
        # Set the registry value/subkey.
        Set-ItemProperty -Path $Path -Name HideFileExt -Value $Value

        # Refresh open Explorer windows.
        # You will need to refresh the window if you have none currently open.
        # Create the Shell.Application ComObject
        $Shell = New-Object -ComObject Shell.Application
        # For each one of the open windows, refresh it.
        $Shell.Windows() | ForEach-Object { $_.Refresh() }
    }
}

function Set-DecreaseSpaceBetweenItems {
    [CmdletBinding(DefaultParameterSetName = "Off")]
    Param (
        [Parameter(Mandatory = $true, ParameterSetName = "On")]
        [System.Management.Automation.SwitchParameter]
        $On,

        [Parameter(Mandatory = $true, ParameterSetName = "Off")]
        [System.Management.Automation.SwitchParameter]
        $Off
    )
    Process {
        # Set a variable with the value we want to set on the registry value/subkey.
        if ($PSCmdlet.ParameterSetName -eq "On") { $Value = 1 }
        if ($PSCmdlet.ParameterSetName -eq "Off") { $Value = 0 }

        # Define the path to the registry key that contains the registry value/subkey
        $Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
        # Set the registry value/subkey.
        Set-ItemProperty -Path $Path -Name UseCompactMode -Value $Value

        # Refresh open Explorer windows.
        # You will need to refresh the window if you have none currently open.
        # Create the Shell.Application ComObject
        $Shell = New-Object -ComObject Shell.Application
        # For each one of the open windows, refresh it.
        $Shell.Windows() | ForEach-Object { $_.Refresh() }
    }
}

function Set-DisplayTheFullPathInTheTitleBar {
    [CmdletBinding(DefaultParameterSetName = "Off")]
    Param (
        [Parameter(Mandatory = $true, ParameterSetName = "On")]
        [System.Management.Automation.SwitchParameter]
        $On,

        [Parameter(Mandatory = $true, ParameterSetName = "Off")]
        [System.Management.Automation.SwitchParameter]
        $Off
    )
    Process {
        # Set a variable with the value we want to set on the registry value/subkey.
        if ($PSCmdlet.ParameterSetName -eq "On") { $Value = 1 }
        if ($PSCmdlet.ParameterSetName -eq "Off") { $Value = 0 }

        # Define the path to the registry key that contains the registry value/subkey
        $Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState"
        # Set the registry value/subkey.
        Set-ItemProperty -Path $Path -Name FullPath -Value $Value

        # Refresh open Explorer windows.
        # You will need to refresh the window if you have none currently open.
        # Create the Shell.Application ComObject
        $Shell = New-Object -ComObject Shell.Application
        # For each one of the open windows, refresh it.
        $Shell.Windows() | ForEach-Object { $_.Refresh() }
    }
}

function Set-UITheme {
    [CmdletBinding(DefaultParameterSetName = "Light")]
    Param (
        [Parameter(Mandatory = $true, ParameterSetName = "Light")]
        [System.Management.Automation.SwitchParameter]
        $Light,

        [Parameter(Mandatory = $true, ParameterSetName = "Dark")]
        [System.Management.Automation.SwitchParameter]
        $Dark
    )
    Process {
        # Set a variable with the value we want to set on the registry value/subkey.
        if ($PSCmdlet.ParameterSetName -eq "Light") { $Value = 1 }
        if ($PSCmdlet.ParameterSetName -eq "Dark") { $Value = 0 }

        # Define the path to the registry key that contains the registry value/subkey
        $Path = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
        # Set the registry value/subkey.
        Set-ItemProperty -Path $Path -Name AppsUseLightTheme -Value $Value

        # Refresh open Explorer windows.
        # You will need to refresh the window if you have none currently open.
        # Create the Shell.Application ComObject
        $Shell = New-Object -ComObject Shell.Application
        # For each one of the open windows, refresh it.
        $Shell.Windows() | ForEach-Object { $_.Refresh() }
    }
}

Set-UITheme -Dark
Show-HiddenFiles -On
Show-FileExtensions -On
Set-DecreaseSpaceBetweenItems -On
Set-DisplayTheFullPathInTheTitleBar -On
