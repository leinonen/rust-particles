#Download SDL
Start-FileDownload "https://www.libsdl.org/release/SDL2-devel-2.0.5-VC.zip" -FileName "${env:Temp}\sdl2.zip"

Add-Type -AssemblyName System.IO.Compression.FileSystem
function Unzip
{
    param([string]$zipfile, [string]$outpath)

    [System.IO.Compression.ZipFile]::ExtractToDirectory($zipfile, $outpath)
}

Unzip "${env:Temp}\sdl2.zip" "${env:Temp}\sdl2"

Copy-Item "${env:Temp}\sdl2\SDL2-2.0.5\lib\*" "msvc\lib\"