# https://adventofcode.com/2015/day/3

$Text = @(Get-Content -Path $PSScriptRoot\input.txt).ToCharArray()

function Part-One {
    param([Char[]]$Messages)
    
    $Locations = New-Object System.Collections.Generic.HashSet[string]
    [void]$Locations.Add("0, 0")
    
    $X = 0
    $Y = 0

    foreach($Message in $Messages) {
        switch ($Message) {
            '^' { $Y++ }
            '>' { $X++ }
            'v' { $Y-- }
            '<' { $X-- }
        }
        [void]$Locations.Add("$X, $Y")
    }

    return $Locations.Count
}

function Part-Two {
    param([Char[]]$Messages)
    
    $Locations = New-Object System.Collections.Generic.HashSet[string]
    [void]$Locations.Add("0, 0")

    # Santa location
    $SX = 0
    $SY = 0

    # Robot santa location
    $RSX = 0
    $RSY = 0

    for($i = 0; $i -lt $Messages.Count; $i++) {
        if($i % 2 -eq 0) {
            # Santa move
            switch ($Messages[$i]) {
                '^' { $SY++ }
                '>' { $SX++ }
                'v' { $SY-- }
                '<' { $SX-- }
            }
        }
        else {
            # Robo santa move
            switch ($Messages[$i]) {
                '^' { $RSY++ }
                '>' { $RSX++ }
                'v' { $RSY-- }
                '<' { $RSX-- }
            }
        }
        [void]$Locations.Add("$SX, $SY")
        [void]$Locations.Add("$RSX, $RSY")
    }

    return $Locations.Count
}


# Part 1
Part-One -Messages $Text 

# Part 2
Part-Two -Messages $Text 
