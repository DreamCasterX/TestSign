
$_creator = "Mike Lu"
$_version = 1.0
$_changedate = 7/29/2025



# User defined settings
$PROJECT_ID = "8480"
$SSID = "%ADSP.DeviceDesc%=SUBSYS_Device_ADSP_ext, ACPI\VEN_QCOM&DEV_0F1B&SUBSYS_103C8E91"
$EXTENSION_ID_ADSP = "671a02c8-b9d6-42e1-a135-298e452bd2aa"


# Fixed settings
$PROJECT_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path
$BIN_DIR = Join-Path $PROJECT_DIR "bin"
$SRC_DIR = Join-Path $PROJECT_DIR "src"
$UNSIGNED_DIR = Join-Path $PROJECT_DIR "Unsigned"
$SIGNED_DIR = Join-Path $PROJECT_DIR "Signed"
$CABARC_PATH = Join-Path $BIN_DIR "cabarc.exe"
$SIGNTOOL_PATH = Join-Path $BIN_DIR "signtool.exe"
$INF_NAME_FOUND = $false

function Write-ColorOutput {
    param(
        [string]$Message,
        [string]$Color = "White"
    )
    Write-Host $Message -ForegroundColor $Color
}

function Process-InfFile {
    param(
        [string]$InfFilePath,
        [string]$TargetInfName
    )
    
    Write-ColorOutput "Found target INF file: $TargetInfName.inf" "Green"
	Write-Host ""
    
    try {
        $infContent = Get-Content -Path $InfFilePath -Encoding UTF8
        $contentModified = $false
        
        # First, check and replace ExtensionId GUID if needed
        Write-ColorOutput "Checking for ExtensionId in INF file..." "Cyan"
        for ($i = 0; $i -lt $infContent.Count; $i++) {
            if ($infContent[$i] -match "ExtensionId=\{[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}\}") {
                $originalLine = $infContent[$i]
                # Replace any GUID in ExtensionId with the target GUID
                $infContent[$i] = $infContent[$i] -replace "ExtensionId=\{[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}\}", "ExtensionId={$EXTENSION_ID_ADSP}"
                
                if ($originalLine -ne $infContent[$i]) {
                    Write-ColorOutput "Updated ExtensionId from: $originalLine" "Yellow"
                    Write-ColorOutput "Updated ExtensionId to: $($infContent[$i])" "Green"
					Write-Host "`n"
                    $contentModified = $true
                } else {
                    Write-ColorOutput "ExtensionId already has the correct GUID" "Green"
                }
                break
            }
        }
        
        # Check if SSID is empty - skip SSID processing if so
		
        if ([string]::IsNullOrEmpty($SSID)) {
            Write-ColorOutput "SSID is empty - skipping SSID modification" "Yellow"
        } else {
            # Check if SSID already exists
            $ssidExists = $false
            foreach ($line in $infContent) {
                if ($line.Contains($SSID)) {
                    $ssidExists = $true
                    break
                }
            }
        
            if (-not $ssidExists) {
                Write-ColorOutput "SSID not found in INF file. Adding it..." "Yellow"
                
                # Find the last occurrence of "%ADSP.DeviceDesc%=SUBSYS_Device_ADSP_ext"
                $lastMatchIndex = -1
                for ($i = $infContent.Count - 1; $i -ge 0; $i--) {
                    if ($infContent[$i] -match ".*%ADSP\.DeviceDesc%=SUBSYS_Device_ADSP_ext.*") {
                        $lastMatchIndex = $i
                        Write-ColorOutput "Found matching line at index $i`: $($infContent[$i])" "Cyan"
                        break
                    }
                }
                
                if ($lastMatchIndex -ne -1) {
                    # Insert the SSID line after the last match
                    $newContent = @()
                    for ($i = 0; $i -le $lastMatchIndex; $i++) {
                        $newContent += $infContent[$i]
                    }
                    $newContent += $SSID
                    for ($i = $lastMatchIndex + 1; $i -lt $infContent.Count; $i++) {
                        $newContent += $infContent[$i]
                    }
                    
                    # Update the content array
                    $infContent = $newContent
                    Write-ColorOutput "Successfully added SSID to INF file content" "Green"
                    $contentModified = $true
                } else {
                    Write-ColorOutput "Warning: Could not find '%ADSP.DeviceDesc%=SUBSYS_Device_ADSP_ext' line in .inf file" "Yellow"
                }
            } else {
                Write-ColorOutput "SSID already exists in .inf file" "Green"
            }
        }
        
        # Write back to file if any modifications were made
        if ($contentModified) {
            Set-Content -Path $InfFilePath -Value $infContent -Encoding UTF8
            Write-ColorOutput "Successfully updated INF file" "Green"
        } else {
            Write-ColorOutput "No modifications needed" "Green"
        }
    }
    catch {
        Write-ColorOutput "Error reading/modifying .inf file: $($_.Exception.Message)" "Red"
    }
}

function Create-CabFile {
    Write-Host ""

    # Check if the src directory exists
    if (-not (Test-Path $SRC_DIR)) {
        Write-ColorOutput "Error: The src directory does not exist." "Red"
        return $false
    }

    # Check if the src directory is empty
    $srcFiles = Get-ChildItem -Path $SRC_DIR -File
    if ($srcFiles.Count -eq 0) {
        Write-ColorOutput "Warning: Skipping cab creation and moving to signing" "Yellow"
        return $false
    }

    # Find the .inf file to name the cab file
    Write-ColorOutput "Searching for INF file in src directory..." "Cyan"
    $infFiles = Get-ChildItem -Path $SRC_DIR -Filter "*.inf"

    $CAB_NAME = ""
    if ($infFiles.Count -gt 0) {
        $INF_NAME = $infFiles[0].BaseName
        $CAB_NAME = "$INF_NAME.cab"
        $script:INF_NAME_FOUND = $true
        Write-ColorOutput "Found INF file: $($infFiles[0].Name)" "Green"
		
        # Check if this is the specific inf file we need to modify
        $targetInfName = "qcsubsys_ext_adsp$PROJECT_ID"
        if ($INF_NAME -eq $targetInfName) {
            Process-InfFile -InfFilePath $infFiles[0].FullName -TargetInfName $targetInfName
        }
    } else {
        Write-ColorOutput "Warning: No INF file found in src directory. Using default cab name 'No_INF.cab'" "Yellow"
        $CAB_NAME = "No_INF.cab"
    }

    $CAB_FILE = Join-Path $UNSIGNED_DIR $CAB_NAME

    # Make the CAB file
    if (-not (Test-Path $CABARC_PATH)) {
        Write-ColorOutput "Error: cabarc.exe not found. Please ensure the file exists in the $BIN_DIR directory." "Red"
        return $false
    }

    if (-not (Test-Path $UNSIGNED_DIR)) {
        Write-ColorOutput "The Unsigned directory does not exist, creating it now..." "Yellow"
        New-Item -ItemType Directory -Path $UNSIGNED_DIR -Force | Out-Null
    }
	
	Write-Host ""
    Write-ColorOutput "Packaging CAB files..." "Cyan"

    # Change to project directory and execute cabarc
    $currentLocation = Get-Location
    try {
        Set-Location $PROJECT_DIR
        
        # Execute the cabarc.exe command to include the src folder and its contents
        $cabarcArgs = @("-r", "-p", "n", $CAB_FILE, "src\*")
        $process = Start-Process -FilePath $CABARC_PATH -ArgumentList $cabarcArgs -Wait -PassThru -NoNewWindow
        
        if ($process.ExitCode -ne 0) {
            Write-ColorOutput "Error: cabarc.exe execution failed." "Red"
            Write-ColorOutput "Error code: $($process.ExitCode)" "Red"
            return $false
        } else {
            Write-ColorOutput "Files were successfully packaged into $CAB_FILE" "Green"
            return $true
        }
    }
    catch {
        Write-ColorOutput "Error during CAB creation: $($_.Exception.Message)" "Red"
        return $false
    }
    finally {
        Set-Location $currentLocation
    }
}

function Sign-CabFiles {
    Write-ColorOutput "`nSigning cab files in Unsigned directory..." "Cyan"

    if (-not (Test-Path $SIGNTOOL_PATH)) {
        Write-ColorOutput "Error: signtool.exe not found. Please ensure the file exists in the $BIN_DIR directory." "Red"
        return $false
    }

    if (-not (Test-Path $SIGNED_DIR)) {
        Write-ColorOutput "The Signed directory does not exist, creating it now..." "Yellow"
        New-Item -ItemType Directory -Path $SIGNED_DIR -Force | Out-Null
    }

    if (-not (Test-Path $UNSIGNED_DIR)) {
        Write-ColorOutput "Warning: Unsigned directory does not exist. No files to sign." "Yellow"
        return $true
    }

    $cabFiles = Get-ChildItem -Path $UNSIGNED_DIR -Filter "*.cab"
    if ($cabFiles.Count -eq 0) {
        Write-ColorOutput "No CAB files found in Unsigned directory." "Yellow"
        return $true
    }

    foreach ($cabFile in $cabFiles) {
        $UNSIGNED_CAB_PATH = $cabFile.FullName
        $UNSIGNED_CAB_NAME = $cabFile.BaseName
        
        # Check if the cab file has already been signed by the script
        if ($UNSIGNED_CAB_NAME -notmatch "\(Signed\)") {
            $SIGNED_CAB_NAME = "$UNSIGNED_CAB_NAME(Signed).cab"
            $SIGNED_CAB_PATH = Join-Path $SIGNED_DIR $SIGNED_CAB_NAME
            
            Write-ColorOutput "`nProcessing file: $UNSIGNED_CAB_PATH" "Cyan"
            
            # Create a temporary working copy
            try {
                Copy-Item -Path $UNSIGNED_CAB_PATH -Destination $SIGNED_CAB_PATH -Force
                
                if (Test-Path $SIGNED_CAB_PATH) {
                    # Sign the file
                    $signtoolArgs = @("sign", "/a", "/fd", "sha256", "/n", "Inventec Corporation", "/t", "http://timestamp.comodoca.com/authenticode", $SIGNED_CAB_PATH)
                    $signProcess = Start-Process -FilePath $SIGNTOOL_PATH -ArgumentList $signtoolArgs -Wait -PassThru -NoNewWindow
                    
                    if ($signProcess.ExitCode -ne 0) {
                        Write-ColorOutput "Error code: $($signProcess.ExitCode)" "Red"
                        Write-ColorOutput "Signing failed. Please check your certificate and try again" "Red"
                        
                        # Delete the failed signed copy
                        if (Test-Path $SIGNED_CAB_PATH) {
                            Remove-Item -Path $SIGNED_CAB_PATH -Force
                        }
                        Write-ColorOutput "`nScript execution stopped due to signing error" "Red"
                        return $false
                    } else {
                        Write-ColorOutput "Successfully signed: $SIGNED_CAB_NAME" "Green"
                    }
                } else {
                    Write-ColorOutput "Error: Failed to create a copy for signing." "Red"
                    return $false
                }
            }
            catch {
                Write-ColorOutput "Error processing file: $($_.Exception.Message)" "Red"
                return $false
            }
        } else {
            Write-ColorOutput "$UNSIGNED_CAB_PATH appears to be a signed file. Skipping." "Yellow"
        }
    }
    
    return $true
}

# Main execution flow
try {
    # Try to create CAB file first
    $cabCreated = Create-CabFile
    
    Write-Host "`n"
    
    # Always attempt to sign CAB files (whether newly created or existing)
    $signingSuccess = Sign-CabFiles
    
    Write-Host "`n"
    if ($signingSuccess) {
        Write-ColorOutput "All cab files have been processed successfully." "Green"
    } else {
        Write-ColorOutput "Script completed with errors." "Red"
    }
}
catch {
    Write-ColorOutput "Unexpected error: $($_.Exception.Message)" "Red"
}
finally {
    Write-Host "`n"
    Read-Host "Press Enter to continue..."
}