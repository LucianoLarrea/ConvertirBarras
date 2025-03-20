# Agregar una funcionalidad a tu menú contextual en Windows que te permita pegar rutas con barras normales (/), puedes crear un script en PowerShell y luego registrarlo en el menú contextual. 
# Guarda este archivo como "PegarRuta.ps1"
$clipboardContent = Get-Clipboard
$convertedPath = $clipboardContent -replace '\\', '/'
Set-Clipboard -Value $convertedPath