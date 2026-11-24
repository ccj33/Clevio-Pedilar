# 2026-11-09 04:21 - Crop photos to hide other team's name and re-render
cd /tmp/claude-0/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/scratchpad/hackmed/build && python3 -I -c "
from PIL import Image
Image.open('f-tela.jpg').crop((250,760,1250,1350)).save('f-tela-crop.jpg',quality=92)
Image.open('f-pitch.jpg').crop((560,280,2000,1215)).save('f-pitch-crop.jpg',quality=92)
" && sed -i 's/src="f-tela.jpg" style="height:640px;object-position:50% 30%"/src="f-tela-crop.jpg" style="height:640px"/; s/src="f-pitch.jpg" style="object-position:42% 50%"/src="f-pitch-crop.jpg"/; s/min-height:250px/min-height:330px/; s/gap:18px;margin-top:44px/gap:20px;margin-top:56px/' carrossel2.html && cd .. && node render.js "$PWD/build/carrossel2.html" "$PWD/out2" && python3 -I -c "
from PIL import Image
ims=[Image.open('out2/0%d.png'%i) for i in (3,4,6)]
w=360;h=450
sheet=Image.new('RGB',(w*3+40,h+20),'#333')
for k,im in enumerate(ims): sheet.paste(im.resize((w,h)),(10+k*(w+10),10))
sheet.save('contato3.png')"
