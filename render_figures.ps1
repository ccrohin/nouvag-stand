$cmd = "C:\Program Files\OpenSCAD (Nightly)\openscad.exe"

Write-Host "Rendering Figure 1 - Isometric View"
$args1 = @("-o", "figure1.png", "--autocenter", "--viewall", "--camera=60,0,30,55,0,25,350", "--colorscheme=Tomorrow", "stand.scad")
Start-Process -FilePath $cmd -ArgumentList $args1 -WorkingDirectory $PSScriptRoot -Wait -NoNewWindow

Write-Host "Rendering Figure 2 - Side View"
$args2 = @("-o", "figure2.png", "--autocenter", "--viewall", "--camera=28,48,20,90,0,-90,300", "--colorscheme=Tomorrow", "stand.scad")
Start-Process -FilePath $cmd -ArgumentList $args2 -WorkingDirectory $PSScriptRoot -Wait -NoNewWindow

Write-Host "Rendering Figure 3 - Top View"
$args3 = @("-o", "figure3.png", "--autocenter", "--viewall", "--camera=28,48,20,0,0,0,300", "--colorscheme=Tomorrow", "stand.scad")
Start-Process -FilePath $cmd -ArgumentList $args3 -WorkingDirectory $PSScriptRoot -Wait -NoNewWindow

Write-Host "Done rendering all figures!"
