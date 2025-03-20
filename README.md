# Soluciones para convertir barras invertidas a barras normales en Windows

Este documento presenta dos soluciones para convertir automáticamente las barras invertidas (`\`) de las rutas de Windows a barras normales (`/`).

## Estructura de carpetas

Todos los archivos de esta solución se almacenan en la carpeta:
```
D:\Luccio_Tools\ConvertirBarras\
```

## Solución 1: Opción en el menú contextual

Esta solución agrega una nueva opción al menú contextual de Windows que convierte y copia la ruta que tengas en el portapapeles.

### Archivos necesarios

1. **Script PowerShell (D:\Luccio_Tools\ConvertirBarras\PegarRuta.ps1)**:
```powershell
# Agregar una funcionalidad a tu menú contextual en Windows que te permita pegar rutas con barras normales (/)
$clipboardContent = Get-Clipboard
$convertedPath = $clipboardContent -replace '\\', '/'
Set-Clipboard -Value $convertedPath
```

2. **Archivo de registro (D:\Luccio_Tools\ConvertirBarras\AgregarMenuContextual.reg)**:
```
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\Directory\Background\shell\PegarRutaConBarraNormal]
@="Pegar ruta con barra normal"
"Icon"="powershell.exe"

[HKEY_CLASSES_ROOT\Directory\Background\shell\PegarRutaConBarraNormal\command]
@="powershell.exe -ExecutionPolicy Bypass -File \"D:\\Luccio_Tools\\ConvertirBarras\\PegarRuta.ps1\""

[HKEY_CLASSES_ROOT\Directory\shell\PegarRutaConBarraNormal]
@="Pegar ruta con barra normal"
"Icon"="powershell.exe"

[HKEY_CLASSES_ROOT\Directory\shell\PegarRutaConBarraNormal\command]
@="powershell.exe -ExecutionPolicy Bypass -File \"D:\\Luccio_Tools\\ConvertirBarras\\PegarRuta.ps1\""

[HKEY_CLASSES_ROOT\*\shell\PegarRutaConBarraNormal]
@="Pegar ruta con barra normal"
"Icon"="powershell.exe"

[HKEY_CLASSES_ROOT\*\shell\PegarRutaConBarraNormal\command]
@="powershell.exe -ExecutionPolicy Bypass -File \"D:\\Luccio_Tools\\ConvertirBarras\\PegarRuta.ps1\""
```

### Instalación

1. Crea la carpeta `D:\Luccio_Tools\ConvertirBarras\` si no existe
2. Guarda el script PowerShell como `PegarRuta.ps1` en esta carpeta
3. Guarda el contenido del registro como `AgregarMenuContextual.reg` en la misma carpeta
4. Haz doble clic en el archivo .reg para añadir las entradas al registro de Windows
5. Confirma los permisos cuando se te solicite

### Uso

1. Copia una ruta de Windows al portapapeles (ejemplo: `C:\Users\tu_usuario\Documents`)
2. Haz clic derecho en cualquier espacio vacío del explorador de archivos
3. Selecciona "Pegar ruta con barra normal" en el menú contextual
4. La ruta con barras normales estará ahora en tu portapapeles (ejemplo: `C:/Users/tu_usuario/Documents`)
5. Pega la ruta donde la necesites con Ctrl+V

## Solución 2: Atajo de teclado global

Esta solución crea un atajo de teclado que puedes usar en cualquier momento para convertir una ruta en el portapapeles.

### Archivos necesarios

1. **Script PowerShell (D:\Luccio_Tools\ConvertirBarras\PegarRuta.ps1)** - El mismo que en la solución anterior

2. **Archivo batch (D:\Luccio_Tools\ConvertirBarras\ConvertirRuta.bat)**:
```batch
@echo off
powershell.exe -ExecutionPolicy Bypass -File "D:\Luccio_Tools\ConvertirBarras\PegarRuta.ps1"
```

### Instalación

1. Usa el mismo script PowerShell `PegarRuta.ps1` que ya creaste
2. Crea el archivo batch `ConvertirRuta.bat` con el contenido mostrado y guárdalo en la misma carpeta
3. Haz clic derecho en el archivo .bat y selecciona "Crear acceso directo"
4. Mueve el acceso directo a un lugar conveniente (escritorio o carpeta personal)
5. Haz clic derecho en el acceso directo y selecciona "Propiedades"
6. Haz clic en el campo "Tecla de método abreviado"
7. Presiona una combinación de teclas no utilizada (por ejemplo, Ctrl+Alt+V)
8. Haz clic en "Aceptar" para guardar

### Uso

1. Copia una ruta de Windows al portapapeles (ejemplo: `C:\Users\tu_usuario\Documents`)
2. Presiona tu atajo de teclado configurado (ejemplo: Ctrl+Alt+V)
3. La ruta con barras normales estará ahora en tu portapapeles (ejemplo: `C:/Users/tu_usuario/Documents`)
4. Pega la ruta donde la necesites con Ctrl+V

## Mantenimiento y desinstalación

### Para modificar la funcionalidad:
1. Edita el archivo `PegarRuta.ps1` según tus necesidades
2. No es necesario reinstalar nada, los cambios se aplicarán inmediatamente

### Para desinstalar la opción del menú contextual:
Crea un archivo `DesinstalarMenu.reg` con el siguiente contenido:
```
Windows Registry Editor Version 5.00

[-HKEY_CLASSES_ROOT\Directory\Background\shell\PegarRutaConBarraNormal]
[-HKEY_CLASSES_ROOT\Directory\shell\PegarRutaConBarraNormal]
[-HKEY_CLASSES_ROOT\*\shell\PegarRutaConBarraNormal]
```

Luego haz doble clic en este archivo para eliminar las entradas del registro.
