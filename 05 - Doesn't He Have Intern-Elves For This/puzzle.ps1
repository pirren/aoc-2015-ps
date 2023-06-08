# https://adventofcode.com/2015/day/5

$Text = @(Get-Content -Path $PSScriptRoot\input.txt) -Split "\n"

function Part-One {
    param([string[]] $List)
    
    $DuplicatePattern = '(\w)\1'
    $VowelPattern = "a|e|i|o|u"
    $Bad = @("ab", "cd", "pq", "xy")

    $Nice = 0

    foreach ($Item in $List) {
        if ($null -ne ($Bad | ? { $Item -match $_ })) { continue }
        if (($Item | Select-String -AllMatches -Pattern $VowelPattern).Matches.Count -lt 3) { continue }
        if (($Item | Select-String -AllMatches -Pattern $DuplicatePattern) -eq $null) { continue }

        $Nice++
    }

    return $Nice
}

function Part-Two {
    param([string[]] $List)

    $PairPattern = '(\w{2})(?=.*\1)' # Positive lookout assertion
    $RepeatPattern = '(.)(.)\1'
    
    $Nice = 0

    foreach ($Item in $List) {
        if (($Item | Select-String -AllMatches -Pattern $PairPattern) -eq $null) { continue }
        if (($Item | Select-String -AllMatches -Pattern $RepeatPattern) -eq $null) { continue }
        
        $Nice++
    }

    return $Nice
}


# Part 1
Part-One -List $Text

# Part 2
Part-Two -List $Text
