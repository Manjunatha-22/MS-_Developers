$files = Get-ChildItem -Recurse -Include *.html, *.js, *.css, *.ps1
foreach ($file in $files) {
    if ($file.Name -eq "rename_satva.ps1") { continue }
    $content = Get-Content $file.FullName -Raw
    
    $updated = $content -replace "MS Developers", "Satva Developers" `
                        -replace "MS DEVELOPERS", "SATVA DEVELOPERS" `
                        -replace "MS Emerald", "Satva Emerald" `
                        -replace "MS Royal", "Satva Royal" `
                        -replace "MS Grand", "Satva Grand" `
                        -replace "MS Green", "Satva Green" `
                        -replace "MS Skyview", "Satva Skyview" `
                        -replace "MS Serene", "Satva Serene" `
                        -replace "MS Horizon", "Satva Horizon" `
                        -replace "MS Silicon", "Satva Silicon" `
                        -replace "info@msdevelopers.in", "info@satvadevelopers.in" `
                        -replace "admin@msdevelopers.in", "admin@satvadevelopers.in" `
                        -replace "msdevelopers.in", "satvadevelopers.in"

    if ($content -ne $updated) {
        Set-Content -Path $file.FullName -Value $updated -NoNewline
        Write-Host "Updated $($file.Name)"
    }
}
