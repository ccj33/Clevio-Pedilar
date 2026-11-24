# 2026-11-09 04:21 - Recrop photos honoring EXIF rotation and re-render
cd /tmp/claude-0/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/scratchpad/hackmed/build && python3 -I -c "
from PIL import Image, ImageOps
t=ImageOps.exif_transpose(Image.open('f-tela.jpg')); print(t.size)
k=t.width/1500
t.crop(tuple(int(v*k) for v in (250,760,1250,1350))).save('f-tela-crop.jpg',quality=92)
p=ImageOps.exif_transpose(Image.open('f-pitch.jpg')); print(p.size)
k=p.width/2000
p.crop(tuple(int(v*k) for v in (560,280,2000,1215))).save('f-pitch-crop.jpg',quality=92)
" && cd .. && node render.js "$PWD/build/carrossel2.html" "$PWD/out2" && python3 -I -c "
from PIL import Image
ims=[Image.open('out2/0%d.png'%i) for i in (4,6)]
w=360;h=450
sheet=Image.new('RGB',(w*2+30,h+20),'#333')
for k,im in enumerate(ims): sheet.paste(im.resize((w,h)),(10+k*(w+10),10))
sheet.save('contato3.png')"
