# https://adventofcode.com/2015/day/2

$Text = @(Get-Content -Path $PSScriptRoot\input.txt) -Split "\n"

function Part-One {
    param([String[]]$Packages)

    $Wrapping = 0
    $Packages | ForEach-Object {
        $Data = $_ -Split 'x' | ForEach-Object { [int]$_ }

        $Sides = @(($Data[0] * $Data[1]), ($Data[1] * $Data[2]), ($Data[2] * $Data[0]))

        $OrderedSides = $Sides | Measure-Object -Minimum | Sort-Object -Property Minimum | Select-Object -ExpandProperty Minimum

        $Wrapping += ($Sides | ForEach-Object { $_ * 2 } | Measure-Object -Sum | Select-Object -ExpandProperty Sum) + $OrderedSides | Select-Object -First 1
    }
    return $Wrapping
}

function Part-Two {
    param([String[]]$Packages)
    
    $Ribbon = 0
    $Packages | ForEach-Object {
        $Data = $_ -Split 'x' | ForEach-Object { [int]$_ }

        $Distance = 0
        $Data | Sort-Object | Select-Object -First 2 | ForEach-Object { $Distance += $_ * 2 }

        $Bow = 1 
        $Data | ForEach-Object { $Bow *= $_ }

        $Ribbon += $Bow + $Distance
    }
    return $Ribbon
}

# Part 1
Part-One -Packages $Text 

# Part 2
Part-Two -Packages $Text 
