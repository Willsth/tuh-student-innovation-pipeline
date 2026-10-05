#!/bin/zsh
# Render each HTML page to PDF with headless Chrome.
cd "$(dirname "$0")"
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
OUT=../output
mkdir -p "$OUT"
render() {
  "$CHROME" --headless=new --disable-gpu --no-pdf-header-footer --run-all-compositor-stages-before-draw \
    --virtual-time-budget=4000 --print-to-pdf="$OUT/$2" "file://$PWD/$1" 2>/dev/null
}
render flowchart.html     "02-TUH-Skylab-Pipeline-Flowchart.pdf"
[ -f decision-tree.html ] && render decision-tree.html "03-TUH-Skylab-Where-Do-I-Start.pdf"
render overview-slides.html "01-TUH-Skylab-Internal-Overview-Slides.pdf"
ls -la "$OUT"
