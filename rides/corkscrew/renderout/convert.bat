setlocal ENABLEDELAYEDEXPANSION

magick convert remap*.png -dither none -remap "../../../templates/paletteremap.png" "remap%%04d.png"
magick convert img*.png -dither none -remap "../../../templates/palette.png" "img%%04d.png"

for %%f in (img*.png) do (
	set g=%%~nf
	magick composite img!g:~3,4!.png remap!g:~3,4!.png "../composite/out!g:~3,4!.bmp"
)

pause