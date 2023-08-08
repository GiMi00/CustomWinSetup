function Show-Menu {
    Clear-Host
    Write-Host "Welcome to the CLI Menu"
    Write-Host "1. Option 1"
    Write-Host "2. Option 2"
    Write-Host "3. Exit"
}

function Get-Choice {
    $choice = Read-Host "Choose an option (1, 2, or 3)"
    return $choice
}

function Get-InnerChoice {
    $choice = Read-Host "Choose an option (a or b)"
    return $choice
}

function Get-Text {
    $text = Read-Host "Enter some text"
    return $text
}

$finished = $false

while (-not $finished) {
    Show-Menu
    $menuChoice = Get-Choice

    switch ($menuChoice) {
        "1" {
            Show-Menu
            $innerChoice = Get-InnerChoice
            switch ($innerChoice) {
                "a" {
                    Show-Menu
                    $innerText = Get-Text
                    Write-Host "You chose Option 1a and entered: $innerText"
                }
                "b" {
                    Show-Menu
                    $innerText = Get-Text
                    Write-Host "You chose Option 1b and entered: $innerText"
                }
                default {
                    Write-Host "Invalid inner choice."
                }
            }
        }
        "2" {
            Show-Menu
            $innerText = Get-Text
            Write-Host "You chose Option 2 and entered: $innerText"
        }
        "3" {
            $finished = $true
            Write-Host "Exiting the CLI Menu."
        }
        default {
            Write-Host "Invalid choice."
        }
    }
}

#this is just test