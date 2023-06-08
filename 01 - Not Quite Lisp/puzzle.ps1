# https://adventofcode.com/2015/day/1

$Input = Get-Content -Path $PSScriptRoot\input.txt

$Floor = 0
$Position = -1

for ($i = 0; $i -lt $Input.Length; $i++) {
    if($Input[$i] -eq ')') { $Floor-- }
    else { $Floor++ }
    
    if($Position -eq -1 -and $Floor -lt 0) {
        $Position = $i + 1
    }
}


# Part 1
$Floor

# Part 2
$Position