
# Read the pre-generated txt files
$towelB64 = (Get-Content "C:\Users\1090602\Desktop\memory\towel_b64.txt" -Raw).Trim()
$eraserB64 = (Get-Content "C:\Users\1090602\Desktop\memory\eraser_b64.txt" -Raw).Trim()
$pillowB64 = (Get-Content "C:\Users\1090602\Desktop\memory\pillow_b64.txt" -Raw).Trim()

# Read html
$html = [System.IO.File]::ReadAllText("C:\Users\1090602\Desktop\memory\index.html", [System.Text.Encoding]::UTF8)

# Build replacement img tag strings (no outer quotes - they'll be in double-quoted context)
$towelImgSrc  = "data:image/png;base64,$towelB64"
$eraserImgSrc = "data:image/png;base64,$eraserB64"
$pillowImgSrc = "data:image/png;base64,$pillowB64"

$imgStyle = "width:64px;height:64px;object-fit:contain;display:block;margin:0 auto;"

# Replace towel entry
$html = $html -replace "(?s)\{ word: 'towel', emoji: '[^']*', chinese: '毛巾' \}", "{ word: 'towel', emoji: '<img src=`"$towelImgSrc`" style=`"$imgStyle`">', chinese: '毛巾' }"

# Replace eraser entry
$html = $html -replace "(?s)\{ word: 'eraser', emoji: '[^']*', chinese: '橡皮擦' \}", "{ word: 'eraser', emoji: '<img src=`"$eraserImgSrc`" style=`"$imgStyle`">', chinese: '橡皮擦' }"

# Replace pillow entry
$html = $html -replace "(?s)\{ word: 'pillow', emoji: '[^']*', chinese: '枕頭' \}", "{ word: 'pillow', emoji: '<img src=`"$pillowImgSrc`" style=`"$imgStyle`">', chinese: '枕頭' }"

[System.IO.File]::WriteAllText("C:\Users\1090602\Desktop\memory\index.html", $html, [System.Text.Encoding]::UTF8)
Write-Host "DONE"
