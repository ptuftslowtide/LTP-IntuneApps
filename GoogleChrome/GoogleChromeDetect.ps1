$Path = "C:\Program Files\Google\Chrome\Application\chrome.exe"

    if (Test-Path -LiteralPath $Path -PathType Leaf) {
        Write-Host "Google Chrome is already installed."
        exit 0
    }
    else {
        Write-Host "Google Chrome installation wasn't found."
        exit 1
    }
