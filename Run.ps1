
$_creator = "Mike Lu (lu.mike@inventec.com)"
$_version = 1.4
$_changedate = "2/25/2026"


# 此tool會針對ADSP/TREE/QCOM driver進行特殊特定,可重複執行
#   ADSP -> 修改ExtensionID並加入SSID
#   TREE -> 修改ExtensionID並加入SSID/OEM SECURE APP SERVICE/HpVariableService.RegKey
#   QCOM -> 修改ExtensionID並加入SSID
#   PEP -> 修改ExtensionID
#   GFX_EXT -> 修改ExtensionID並加入SSID
#   GFX_BASE -> 僅加入SSID



# User defined settings 
$PROJECT_ID = "8480"
$ENABLE_SIGNING = $false  # 設置為 $true啟用signing function (需外接USB sign key)
$EXT_ID_ADSP = "671a02c8-b9d6-42e1-a135-298e452bd2aa"
$EXT_ID_TREE = "83b2ef3f-4b29-4fbd-8a8b-221d38bab8d4"
$EXT_ID_QCOM = "ee28e4a3-d04a-46a4-b493-3b82ad8f3411"
$EXT_ID_PEP = "729dd6aa-55c3-4ac5-89c8-a77ae0ecfdd5"
$EXT_ID_GFX_EXT = "d86d3850-b5c9-46d3-9df5-ff833f0516b0"
$SSID_ADSP = "%ADSP.DeviceDesc%=SUBSYS_Device_ADSP_ext, ACPI\VEN_QCOM&DEV_0F1B&SUBSYS_103C8E91"
$SSID_TREE = "%QcTrEE.DeviceDesc%=QcTrEE_Oem_ext, ACPI\VEN_QCOM&DEV_103E&SUBSYS_103C8E91"  # for Cashmere
$SSID_QCOM = "%QcTrEE.DeviceDesc%=QcTrEE_Qcom_ext, ACPI\VEN_QCOM&DEV_103E&SUBSYS_103C8E91" 
$SSID_GFX_EXT = "%QC_Device%          = QCDX_Inst_Ext_8480, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91"
$SSID_GFX_EXT_2 = "%QC_Device84%        = QCDX_Inst_Ext_8480, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8E91"
$SSID_GFX_BASE =
"
; HP EliteBook X G2q
%QC_Device_4%        = QCDX_Inst_Base_185_8480, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91

%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91&REV_0002
%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91&REV_0006
%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91&REV_0027
%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91&REV_0005
%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91&REV_00A7
%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91&REV_00A8
%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91&REV_0001
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91&REV_00A0
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91&REV_00A1
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91&REV_00A2
%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91&REV_00C1
%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91&REV_00C2
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91&REV_00C4
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91&REV_00C5
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91&REV_00AA
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91&REV_00AB
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_096, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91&REV_00A3
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_096, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91&REV_00A4
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_096, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91&REV_00A5
%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91&REV_0087
%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91&REV_0088
%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8E91&REV_0089


%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8E91
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8E91&REV_0096
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_091, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8E91&REV_0033
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_091, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8E91&REV_004B
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_091, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8E91&REV_0098
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8E91&REV_009C
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8E91&REV_009D
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8E91&REV_0095
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8E91&REV_004A
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8E91&REV_004C
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8E91&REV_004D
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8E91&REV_004F
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8E91&REV_0051

"
$SSID2_TREE = "%QcTrEE.DeviceDesc%=QcTrEE_Oem_ext, ACPI\VEN_QCOM&DEV_103E&SUBSYS_103C8F2B"  # for Dolcelatte
$SSID2_QCOM = "%QcTrEE.DeviceDesc%=QcTrEE_Qcom_ext, ACPI\VEN_QCOM&DEV_103E&SUBSYS_103C8F2B"
$SSID2_GFX_EXT = "%QC_Device%          = QCDX_Inst_Ext_8480, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B"
$SSID2_GFX_EXT_2 = "%QC_Device84%        = QCDX_Inst_Ext_8480, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8F2B"
$SSID2_GFX_BASE =
"
; HP EliteBook 6 G2q
%QC_Device_4%        = QCDX_Inst_Base_185_8480, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B

%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B&REV_0002
%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B&REV_0006
%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B&REV_0027
%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B&REV_0005
%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B&REV_00A7
%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B&REV_00A8
%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B&REV_0001
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B&REV_00A0
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B&REV_00A1
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B&REV_00A2
%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B&REV_00C1
%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B&REV_00C2
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B&REV_00C4
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B&REV_00C5
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B&REV_00AA
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B&REV_00AB
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_096, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B&REV_00A3
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_096, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B&REV_00A4
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_096, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B&REV_00A5
%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B&REV_0087
%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B&REV_0088
%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0F36&SUBSYS_103C8F2B&REV_0089


%QC_Device_3%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8F2B
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8F2B&REV_0096
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_091, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8F2B&REV_0033
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_091, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8F2B&REV_004B
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_091, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8F2B&REV_0098
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8F2B&REV_009C
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8F2B&REV_009D
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8F2B&REV_0095
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8F2B&REV_004A
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8F2B&REV_004C
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8F2B&REV_004D
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8F2B&REV_004F
%QC_Device_2%        = QCDX_Inst_Base_8480_ma_185, ACPI\VEN_QCOM&DEV_0FF5&SUBSYS_103C8F2B&REV_0051

"

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

function Update-InfFile {
    param(
        [string]$InfFilePath,
        [string]$TargetInfName,
        [string]$InfType
    )
    
    Write-ColorOutput "Found target INF file: $TargetInfName.inf" "Green"
    Write-Host ""
    
    try {

        $infContent = Get-Content -Path $InfFilePath -Encoding Unicode
        $contentModified = $false
        
        # First, check and replace ExtensionId GUID if needed (not used for GFX_BASE)
        Write-ColorOutput "Checking for ExtensionId in INF file..." "Cyan"
        
        # Determine which EXTENSION_ID to use based on inf type
        $targetExtensionId = ""
        if ($InfType -eq "ADSP") {
            $targetExtensionId = $EXT_ID_ADSP
        } elseif ($InfType -eq "TREE") {
            $targetExtensionId = $EXT_ID_TREE
        } elseif ($InfType -eq "QCOM") {
            $targetExtensionId = $EXT_ID_QCOM
        } elseif ($InfType -eq "PEP") {
            $targetExtensionId = $EXT_ID_PEP
        } elseif ($InfType -eq "GFX_EXT") {
            $targetExtensionId = $EXT_ID_GFX_EXT
        }
        
        if (-not [string]::IsNullOrEmpty($targetExtensionId)) {
            for ($i = 0; $i -lt $infContent.Count; $i++) {
                if ($infContent[$i] -match "ExtensionId\s*=\s*\{[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}\}") {
                    $originalLine = $infContent[$i]
                    # Replace any GUID in ExtensionId with the target GUID (preserve spacing around =)
                    $infContent[$i] = $infContent[$i] -replace "\{[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}\}", "{$targetExtensionId}"
                    
                    if ($originalLine -ne $infContent[$i]) {
                        Write-ColorOutput "Updated ExtensionId from: $originalLine" "Yellow"
                        Write-ColorOutput "Updated ExtensionId to: $($infContent[$i])" "Green"
                        Write-Host ""
                        $contentModified = $true
                    } else {
                        Write-ColorOutput "ExtensionId already has the correct GUID" "DarkGray"
                        Write-Host ""
                    }
                    break
                }
            }
        }
        
        # Special SSID handling for GFX_BASE (base GFX INF only adds SSID)
        if ($InfType -eq "GFX_BASE") {
            Write-Host ""
            Write-ColorOutput "Processing SSID for GFX_BASE driver..." "Cyan"

            # Split configured multi-line SSID blocks into individual lines
            # Preserve「內部」空白行，但去掉 Here-String 開頭與結尾多出來的空行
            $ssidBaseLines = $SSID_GFX_BASE -split "`r?`n"
            if ($ssidBaseLines.Count -gt 0 -and $ssidBaseLines[0] -eq "") {
                if ($ssidBaseLines.Count -gt 1) {
                    $ssidBaseLines = $ssidBaseLines[1..($ssidBaseLines.Count - 1)]
                } else {
                    $ssidBaseLines = @()
                }
            }
            if ($ssidBaseLines.Count -gt 0 -and $ssidBaseLines[-1] -eq "") {
                if ($ssidBaseLines.Count -gt 1) {
                    $ssidBaseLines = $ssidBaseLines[0..($ssidBaseLines.Count - 2)]
                } else {
                    $ssidBaseLines = @()
                }
            }

            $ssid2BaseLines = $SSID2_GFX_BASE -split "`r?`n"
            if ($ssid2BaseLines.Count -gt 0 -and $ssid2BaseLines[0] -eq "") {
                if ($ssid2BaseLines.Count -gt 1) {
                    $ssid2BaseLines = $ssid2BaseLines[1..($ssid2BaseLines.Count - 1)]
                } else {
                    $ssid2BaseLines = @()
                }
            }
            if ($ssid2BaseLines.Count -gt 0 -and $ssid2BaseLines[-1] -eq "") {
                if ($ssid2BaseLines.Count -gt 1) {
                    $ssid2BaseLines = $ssid2BaseLines[0..($ssid2BaseLines.Count - 2)]
                } else {
                    $ssid2BaseLines = @()
                }
            }

            # Rough existence checks based on SUBSYS IDs for the two platforms
            $baseExists = $false
            foreach ($line in $infContent) {
                if ($line.Contains("SUBSYS_103C8E91")) {
                    $baseExists = $true
                    break
                }
            }
            $base2Exists = $false
            foreach ($line in $infContent) {
                if ($line.Contains("SUBSYS_103C8F2B")) {
                    $base2Exists = $true
                    break
                }
            }

            if ($baseExists -and $base2Exists) {
                Write-ColorOutput "GFX_BASE SSIDs already exist in .inf file" "DarkGray"
            } else {
                # Find the [QC.NTARM64.10.0...16299] section and insert after its content
                $anchorIndex = -1
                $inQcSection = $false
                for ($i = 0; $i -lt $infContent.Count; $i++) {
                    if ($infContent[$i] -match "^\[QC\.NTARM64\.10\.0\.\.\.16299\]") {
                        $inQcSection = $true
                        continue
                    }
                    if ($inQcSection) {
                        if ($infContent[$i] -match "^\[") {
                            $anchorIndex = $i - 1
                            break
                        }
                    }
                }
                if ($inQcSection -and $anchorIndex -eq -1) {
                    $anchorIndex = $infContent.Count - 1
                }

                if ($anchorIndex -eq -1) {
                    Write-ColorOutput "Warning: Could not find [QC.NTARM64.10.0...16299] section in GFX_BASE .inf" "Yellow"
                } else {
                    $ssidLinesToInsert = @()
                    if (-not $baseExists -and $ssidBaseLines.Count -gt 0) {
                        $ssidLinesToInsert += $ssidBaseLines
                    }
                    if (-not $base2Exists -and $ssid2BaseLines.Count -gt 0) {
                        $ssidLinesToInsert += $ssid2BaseLines
                    }

                    if ($ssidLinesToInsert.Count -gt 0) {
                        $newContent = @()
                        for ($i = 0; $i -le $anchorIndex; $i++) {
                            $newContent += $infContent[$i]
                        }
                        foreach ($ssidLine in $ssidLinesToInsert) {
                            $newContent += $ssidLine
                        }
                        for ($i = $anchorIndex + 1; $i -lt $infContent.Count; $i++) {
                            $newContent += $infContent[$i]
                        }

                        $infContent = $newContent
                        $contentModified = $true
                        Write-ColorOutput "Successfully added GFX base driver SSID block(s) to INF file" "Green"
                    } else {
                        Write-ColorOutput "No new GFX_BASE SSID lines needed" "DarkGray"
                    }
                }
            }

            # Write back to file if any modifications were made, then return
            if ($contentModified) {
                $infContent | Out-File -FilePath $InfFilePath -Encoding Unicode
                Write-ColorOutput "Successfully updated INF file" "Green"
            } else {
                Write-ColorOutput "No modifications needed" "DarkGray"
            }

            return
        }
        
        # SSID handling for all supported types (except GFX_BASE)
        $ssidToUse = ""
        $ssidAnchorRegex = ""
        if ($InfType -eq "ADSP") {
            $ssidToUse = $SSID_ADSP
            $ssidAnchorRegex = ".*%ADSP\.DeviceDesc%=SUBSYS_Device_ADSP_ext.*"
        } elseif ($InfType -eq "TREE") {
            $ssidToUse = $SSID_TREE
            $ssidAnchorRegex = ".*%QcTrEE\.DeviceDesc%=QcTrEE_Oem_ext.*"
        } elseif ($InfType -eq "QCOM") {
            $ssidToUse = $SSID_QCOM
            $ssidAnchorRegex = ".*%QcTrEE\.DeviceDesc%=QcTrEE_Qcom_ext.*"
        } elseif ($InfType -eq "GFX_EXT") {
            $ssidToUse = $SSID_GFX_EXT
            $ssidAnchorRegex = ".*%QC_Device.*%.*=.*QCDX_Inst_Ext.*SUBSYS_CRD.*"
        }
        
        # TREE-specific additions: OEM SECURE APP SERVICE and HpVariableService.RegKey
        if ($InfType -eq "TREE") {
            # Add OEM SECURE APP SERVICE section
            Write-ColorOutput "Adding OEM SECURE APP SERVICE section..." "Cyan"
            $oemSecureServiceExists = $false
            foreach ($line in $infContent) {
                if ($line.Contains("; OEM SECURE APP SERVICE")) {
                    $oemSecureServiceExists = $true
                    break
                }
            }
            
            if (-not $oemSecureServiceExists) {
                
                # Find the end of [QcTrEE_Oem_ext_SecureServiceReg] section
                $secureServiceRegEndIndex = -1
                $inSecureServiceReg = $false
                
                for ($i = 0; $i -lt $infContent.Count; $i++) {
                    if ($infContent[$i] -match "^\[QcTrEE_Oem_ext_SecureServiceReg\]") {
                        $inSecureServiceReg = $true
                    } elseif ($inSecureServiceReg -and $infContent[$i] -match "^\[") {
                        $secureServiceRegEndIndex = $i - 1
                        break
                    }
                }
                
                if ($secureServiceRegEndIndex -eq -1) {
                    # If we didn't find the end, use the last line
                    $secureServiceRegEndIndex = $infContent.Count - 1
                }
                
                # Insert the OEM SECURE APP SERVICE content
                $oemSecureServiceContent = @(
                    "; OEM SECURE APP SERVICE",
                    "HKR,%HpVariableService.RegKey%,Enabled,%REG_DWORD%,1",
                    "HKR,%HpVariableService.RegKey%,SecureApp,%REG_DWORD%,1",
                    "HKR,%HpVariableService.RegKey%,LoadApp,%REG_DWORD%,0",
                    'HKR,%HpVariableService.RegKey%,AppName,%REG_SZ%,"HpVariable64"',
                    'HKR,%HpVariableService.RegKey%,FileName,%REG_SZ%,"%13%\HpVariable64.mbn"',
                    "HKR,%HpVariableService.RegKey%,MajorVersion,%REG_DWORD%,1",
                    "HKR,%HpVariableService.RegKey%,MinorVersion,%REG_DWORD%,0",
                    "HKR,%HpVariableService.RegKey%,OSDependencies,%REG_MULTI_SZ%,%RpmbOsService%,%TzAppsOsService%"
                )
                
                $newContent = @()
                for ($i = 0; $i -le $secureServiceRegEndIndex; $i++) {
                    $newContent += $infContent[$i]
                }
                foreach ($line in $oemSecureServiceContent) {
                    $newContent += $line
                }
                for ($i = $secureServiceRegEndIndex + 1; $i -lt $infContent.Count; $i++) {
                    $newContent += $infContent[$i]
                }
                
                $infContent = $newContent
                Write-ColorOutput "Successfully added OEM SECURE APP SERVICE section" "Green"
                $contentModified = $true
            } else {
                Write-ColorOutput "OEM SECURE APP SERVICE section already exists" "DarkGray"
            }
            
            # Add HpVariableService.RegKey to [Strings] section
            Write-Host ""
            Write-ColorOutput "Adding HpVariableService.RegKey..." "Cyan"
            $hpVariableServiceKeyExists = $false
            $inStringsSection = $false
            foreach ($line in $infContent) {
                if ($line -match "^\[Strings\]") {
                    $inStringsSection = $true
                } elseif ($inStringsSection -and $line -match "^\[") {
                    $inStringsSection = $false
                } elseif ($inStringsSection -and $line.Contains("HpVariableService.RegKey")) {
                    $hpVariableServiceKeyExists = $true
                    break
                }
            }
            
            if (-not $hpVariableServiceKeyExists) {
                
                # Locate [Strings] section boundaries
                $stringsStartIndex = -1
                $stringsEndIndex = -1
                for ($i = 0; $i -lt $infContent.Count; $i++) {
                    if ($infContent[$i] -match "^\[Strings\]") {
                        $stringsStartIndex = $i
                        break
                    }
                }
                if ($stringsStartIndex -ne -1) {
                    for ($i = $stringsStartIndex + 1; $i -lt $infContent.Count; $i++) {
                        if ($infContent[$i] -match "^\[") {
                            $stringsEndIndex = $i - 1
                            break
                        }
                    }
                    if ($stringsEndIndex -eq -1) {
                        $stringsEndIndex = $infContent.Count - 1
                    }
                } else {
                    # Fallback: treat end of file as strings end
                    $stringsEndIndex = $infContent.Count - 1
                }
                
                # Choose insertion index within [Strings]
                $insertionIndex = $stringsEndIndex
                $lastRegKeyIndex = -1
                for ($i = $stringsStartIndex + 1; $i -le $stringsEndIndex; $i++) {
                    if ($infContent[$i] -match "^DxHdcp2Service\.RegKey\s*=") {
                        $insertionIndex = $i
                        break
                    }
                    if ($infContent[$i] -match "^[^;].*\.RegKey\s*=") {
                        $lastRegKeyIndex = $i
                    }
                }
                if ($insertionIndex -eq $stringsEndIndex -and $lastRegKeyIndex -ne -1) {
                    $insertionIndex = $lastRegKeyIndex
                }
                
                # Insert the HpVariableService.RegKey definition AFTER chosen line
                $hpVariableServiceKey = 'HpVariableService.RegKey = "AdditionalSecureServices\{3FA24EF8-153B-4B8A-A039-670377B93E05}"'
                $newContent = @()
                for ($i = 0; $i -le $insertionIndex; $i++) {
                    $newContent += $infContent[$i]
                }
                $newContent += $hpVariableServiceKey
                for ($i = $insertionIndex + 1; $i -lt $infContent.Count; $i++) {
                    $newContent += $infContent[$i]
                }
                
                $infContent = $newContent
                Write-ColorOutput "Successfully added HpVariableService.RegKey" "Green"
                $contentModified = $true
            } else {
                Write-ColorOutput "HpVariableService.RegKey already exists" "DarkGray"
            }
        }
        
        if ([string]::IsNullOrEmpty($ssidToUse)) {
            Write-ColorOutput "SSID is empty - skipping SSID modification" "Yellow"
        } else {
			Write-Host ""
            Write-ColorOutput "Processing SSID for $InfType driver..." "Cyan"
            
            # For GFX type, check all 4 SSIDs; for others, check the primary SSID
            $needToAddSSID = $false
            if ($InfType -eq "GFX_EXT") {
                # Check all 4 SSIDs for GFX
                $ssidGfxExists = $false
                $ssidGfx2Exists = $false
                $ssid2GfxExists = $false
                $ssid2Gfx2Exists = $false
                foreach ($line in $infContent) {
                    if ($line.Contains($SSID_GFX_EXT)) {
                        $ssidGfxExists = $true
                    }
                    if ($line.Contains($SSID_GFX_EXT_2)) {
                        $ssidGfx2Exists = $true
                    }
                    if ($line.Contains($SSID2_GFX_EXT)) {
                        $ssid2GfxExists = $true
                    }
                    if ($line.Contains($SSID2_GFX_EXT_2)) {
                        $ssid2Gfx2Exists = $true
                    }
                }
                $needToAddSSID = -not ($ssidGfxExists -and $ssidGfx2Exists -and $ssid2GfxExists -and $ssid2Gfx2Exists)
            } else {
                # Check primary SSID for other types
                $ssidExists = $false
                foreach ($line in $infContent) {
                    if ($line.Contains($ssidToUse)) {
                        $ssidExists = $true
                        break
                    }
                }
                $needToAddSSID = -not $ssidExists
            }
        
            if ($needToAddSSID) {
                Write-ColorOutput "SSID not found in INF file. Adding it..." "Yellow"
                
                # Find the last occurrence of the anchor line
                $lastMatchIndex = -1
                for ($i = $infContent.Count - 1; $i -ge 0; $i--) {
                    if ($infContent[$i] -match $ssidAnchorRegex) {
                        $lastMatchIndex = $i
                        break
                    }
                }
                
                if ($lastMatchIndex -ne -1) {
                    # Prepare SSID lines to insert
                    $ssidLinesToInsert = @()
                    
                    if ($InfType -eq "GFX_EXT") {
                        # GFX needs 4 SSID lines: SSID_GFX, SSID_GFX_2, SSID2_GFX, SSID2_GFX_2
                        $ssidGfxExists = $false
                        $ssidGfx2Exists = $false
                        $ssid2GfxExists = $false
                        $ssid2Gfx2Exists = $false
                        foreach ($line in $infContent) {
                            if ($line.Contains($SSID_GFX_EXT)) {
                                $ssidGfxExists = $true
                            }
                            if ($line.Contains($SSID_GFX_EXT_2)) {
                                $ssidGfx2Exists = $true
                            }
                            if ($line.Contains($SSID2_GFX_EXT)) {
                                $ssid2GfxExists = $true
                            }
                            if ($line.Contains($SSID2_GFX_EXT_2)) {
                                $ssid2Gfx2Exists = $true
                            }
                        }
                        if (-not $ssidGfxExists) {
                            $ssidLinesToInsert += $SSID_GFX_EXT
                        }
                        if (-not $ssidGfx2Exists) {
                            $ssidLinesToInsert += $SSID_GFX_EXT_2
                        }
                        if (-not $ssid2GfxExists) {
                            $ssidLinesToInsert += $SSID2_GFX_EXT
                        }
                        if (-not $ssid2Gfx2Exists) {
                            $ssidLinesToInsert += $SSID2_GFX_EXT_2
                        }
                    } else {
                        # For other types, add primary SSID first
                        $ssidLinesToInsert = @($ssidToUse)
                        
                        # Add second SSID for TREE and QCOM types
                        if ($InfType -eq "TREE") {
                            $ssid2Exists = $false
                            foreach ($line in $infContent) {
                                if ($line.Contains($SSID2_TREE)) {
                                    $ssid2Exists = $true
                                    break
                                }
                            }
                            if (-not $ssid2Exists) {
                                $ssidLinesToInsert += $SSID2_TREE
                            }
                        } elseif ($InfType -eq "QCOM") {
                            $ssid2Exists = $false
                            foreach ($line in $infContent) {
                                if ($line.Contains($SSID2_QCOM)) {
                                    $ssid2Exists = $true
                                    break
                                }
                            }
                            if (-not $ssid2Exists) {
                                $ssidLinesToInsert += $SSID2_QCOM
                            }
                        }
                    }
                    
                    # Insert the SSID lines after the last match
                    if ($ssidLinesToInsert.Count -gt 0) {
                        $newContent = @()
                        for ($i = 0; $i -le $lastMatchIndex; $i++) {
                            $newContent += $infContent[$i]
                        }
                        foreach ($ssidLine in $ssidLinesToInsert) {
                            $newContent += $ssidLine
                        }
                        for ($i = $lastMatchIndex + 1; $i -lt $infContent.Count; $i++) {
                            $newContent += $infContent[$i]
                        }
                        
                        # Update the content array
                        $infContent = $newContent
                        Write-ColorOutput "Successfully added SSID(s) to INF file content" "Green"
                        $contentModified = $true
                    }
                } else {
                    Write-ColorOutput "Warning: Could not find anchor line for $InfType in .inf file" "Yellow"
                }
            } else {
                Write-ColorOutput "SSID already exists in .inf file" "DarkGray"
            }
        }
        
        # Write back to file if any modifications were made
        if ($contentModified) {
            $infContent | Out-File -FilePath $InfFilePath -Encoding Unicode
            Write-ColorOutput "Successfully updated INF file" "Green"
        } else {
            Write-ColorOutput "No modifications needed" "DarkGray"
        }
    }
    catch {
        Write-ColorOutput "Error reading/modifying .inf file: $($_.Exception.Message)" "Red"
    }
}

function New-CabFile {
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
        $targetInfNameADSP = "qcsubsys_ext_adsp$PROJECT_ID"  # 鎖定ADSP名稱
        $targetInfNameTREE = "QcTreeExtOem$PROJECT_ID"       # 鎖定Tree名稱
        $targetInfNameQCOM = "QcTreeExtQcom$PROJECT_ID"      # 鎖定QCOM名稱
		$targetInfNamePEP = "qcpep.wd_ext$PROJECT_ID"        # 鎖定PEP名稱
        $targetInfNameGFX_EXT = "qcdxext_crd$PROJECT_ID"     # 鎖定GFX_EXT名稱
        $targetInfNameGFX_BASE = "qcdx$PROJECT_ID"           # 鎖定GFX_BASE名稱
        if ($INF_NAME -eq $targetInfNameADSP) {
            Update-InfFile -InfFilePath $infFiles[0].FullName -TargetInfName $targetInfNameADSP -InfType "ADSP"
        } elseif ($INF_NAME -eq $targetInfNameTREE) {
            Update-InfFile -InfFilePath $infFiles[0].FullName -TargetInfName $targetInfNameTREE -InfType "TREE"
        } elseif ($INF_NAME -eq $targetInfNameQCOM) {
            Update-InfFile -InfFilePath $infFiles[0].FullName -TargetInfName $targetInfNameQCOM -InfType "QCOM"
		} elseif ($INF_NAME -eq $targetInfNamePEP) {
            Update-InfFile -InfFilePath $infFiles[0].FullName -TargetInfName $targetInfNamePEP -InfType "PEP"
		} elseif ($INF_NAME -eq $targetInfNameGFX_EXT) {
            Update-InfFile -InfFilePath $infFiles[0].FullName -TargetInfName $targetInfNameGFX_EXT -InfType "GFX_EXT"
		} elseif ($INF_NAME -eq $targetInfNameGFX_BASE) {
            Update-InfFile -InfFilePath $infFiles[0].FullName -TargetInfName $targetInfNameGFX_BASE -InfType "GFX_BASE"
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

function Set-CabSignature {
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
                    # Build argument string to properly handle spaces in parameters
                    $signtoolArgs = "sign /a /fd sha256 /n `"Inventec Corporation`" /t http://timestamp.comodoca.com/authenticode `"$SIGNED_CAB_PATH`""
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
                        
                        # Delete the original unsigned file if signing is enabled
                        if ($ENABLE_SIGNING) {
                            if (Test-Path $UNSIGNED_CAB_PATH) {
                                Remove-Item -Path $UNSIGNED_CAB_PATH -Force
                                Write-ColorOutput "Removed original unsigned file: $UNSIGNED_CAB_NAME.cab" "DarkGray"
                            }
                        }
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
    # Check if src directory is empty before starting
    Write-Host ""
    Write-ColorOutput "Checking src directory..." "Cyan"
    
    if (-not (Test-Path $SRC_DIR)) {
        Write-ColorOutput "Error: The src directory does not exist." "Red"
        Write-ColorOutput "Please create the src directory and place your INF files there." "Red"
        return
    }
    
    $srcFiles = Get-ChildItem -Path $SRC_DIR -File
    if ($srcFiles.Count -eq 0) {
        Write-ColorOutput "Warning: The src directory is empty!" "Yellow"
        return
    }
    
    Write-ColorOutput "Found $($srcFiles.Count) file(s) in src directory" "Green"
    Write-Host ""
    
    # Try to create CAB file first
    $cabCreated = New-CabFile
    
    Write-Host "`n"
    
    if ($ENABLE_SIGNING) {
        # Always attempt to sign CAB files (whether newly created or existing)
        $signingSuccess = Set-CabSignature
    } else {
        $signingSuccess = $true
    }
    
    Write-Host "`n"
    if ($signingSuccess) {
        if ($ENABLE_SIGNING) {
            Write-ColorOutput "All cab files have been processed successfully." "Green"
        }
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
