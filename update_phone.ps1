$files = Get-ChildItem -Recurse -Include *.html, *.js
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw
    if ($content -match "9876543210") {
        $updated = $content -replace "9876543210", "8197287448"
        Set-Content -Path $file.FullName -Value $updated -NoNewline
        Write-Host "Updated phone in $($file.Name)"
    }
}
