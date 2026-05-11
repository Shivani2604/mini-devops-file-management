# Create Main Folders
$folders = @("InputFiles", "ProcessedFiles", "BackupFiles", "Reports")

foreach ($folder in $folders) {
    if (!(Test-Path $folder)) {
        New-Item -ItemType Directory -Path $folder
        Write-Host "$folder created"
    }
    else {
        Write-Host "$folder already exists"
    }
}

# Create Sample Files
1..5 | ForEach-Object {
    New-Item -ItemType File -Path "InputFiles/file$_.txt" -Force
}

Write-Host "Sample files created"

# Move Files to Processed Folder
# Move Files to Processed Folder

Get-ChildItem "InputFiles" | ForEach-Object {

    $destination = "ProcessedFiles/$($_.Name)"

    # Check if file already exists
    if (Test-Path $destination) {

        Write-Host "$($_.Name) already exists in ProcessedFiles"

        # Delete old file
        Remove-Item $destination -Force
    }

    Move-Item $_.FullName -Destination "ProcessedFiles"

    Write-Host "$($_.Name) moved successfully"
}

# Create Backup
Copy-Item "ProcessedFiles" -Destination "BackupFiles" -Recurse -Force

Write-Host "Backup created"

# Generate Report
$date = Get-Date
$report = @"
File Management Report
======================
Date: $date

Folders Created Successfully
Files Processed Successfully
Backup Completed Successfully
"@

$report | Out-File "Reports/report.txt"

Write-Host "Report Generated"