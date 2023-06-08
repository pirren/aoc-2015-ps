# https://adventofcode.com/2015/day/4

$Text = Get-Content -Path $PSScriptRoot\input.txt

function Mine-AdventCoins {
    param([string] $SecretKey, [int] $Part)

    for ($i = 0; $i -lt [int]::MaxValue; $i++) {
        if(Get-MD5Hash -Data @($SecretKey + $i) -Part $Part) {
            return $i
        }
    }

    
    throw "No solution found"
}

function Get-MD5Hash {
    param([string] $Data, [int]$Part)

    $md5 = [System.Security.Cryptography.MD5]::Create()
    $hashBytes = $md5.ComputeHash([System.Text.Encoding]::UTF8.GetBytes($Data))
    $md5.Dispose()

    if ($Part -eq 1) {
        if (($hashBytes[0] -band 0xFF) -ne 0) {
            return $false
        }
        if (($hashBytes[1] -band 0xFF) -ne 0) {
            return $false
        }
        if (($hashBytes[2] -band 0xFF) -gt 0x0F) {
            return $false
        }
    }
    if ($Part -eq 2) {
        for ($i = 0; $i -lt 3; $i++) {
            if (($hashBytes[$i] -band 0xFF) -ne 0) {
                return $false
            }
        }
    }
    return $true
}

# Part 1
Mine-AdventCoins -SecretKey $Text -Part 1

# Part 2
Mine-AdventCoins -SecretKey $Text -Part 2
