# 2026-11-09 04:21 - Check real photo sizes and orientation
cd /tmp/claude-0/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/scratchpad/hackmed/build && python3 -I -c "
from PIL import Image, ImageOps
for f in ['f-tela.jpg','f-pitch.jpg']:
  im=Image.open(f); print(f, im.size, im.getexif().get(274))"
