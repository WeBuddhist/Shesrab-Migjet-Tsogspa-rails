@echo off
chcp 65001 >nul
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-ChildItem -LiteralPath '%~dp0' -Filter *.md | Sort-Object Name | ForEach-Object { $new = $_.Name -replace '^[0-9\u0F20-\u0F29]+[\s_.-]+',''; if ($new -ne $_.Name) { if (Test-Path -LiteralPath (Join-Path $_.DirectoryName $new)) { Write-Host (\"SKIP (exists): \" + $_.Name) } else { Rename-Item -LiteralPath $_.FullName -NewName $new; Write-Host (\"OK: \" + $new) } } }"
echo.
pause
