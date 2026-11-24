# 2026-11-09 04:19 - Extract OncoLink mockups from PDF and copy photos
cd /tmp/claude-0/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/scratchpad/hackmed && mkdir -p pdf && pdftoppm -r 300 -f 4 -l 5 -png /root/.claude/uploads/72f1d19b-8183-5f85-98cc-106ac2c334e3/82032ec4-NeuroDynamics-do-OncoLink-ao-que-vamos-construir-juntos.pdf pdf/p && ls pdf && python3 -I -c "
from PIL import Image
im=Image.open('pdf/p-04.png'); W,H=im.size; print(W,H)
s=W/827
im.crop((0,int(332*s),W,int(786*s))).save('build/oncolink-mock.png')
im.crop((int(76*s),int(80*s),int(250*s),int(112*s))).save('build/oncolink-logo.png')
im2=Image.open('pdf/p-05.png')
im2.crop((0,int(228*s),W,int(700*s))).save('build/oncolink-app.png')
"
U=/root/.claude/uploads/72f1d19b-8183-5f85-98cc-106ac2c334e3
cp $U/dbdba41a-image.jpg build/f-grupo.jpg; cp $U/fcb82982-image.jpg build/f-pitch.jpg; cp $U/b2ba8c77-image.jpg build/f-tela.jpg; cp $U/be79284f-image.jpg build/f-pitch2.jpg; cp $U/434646de-image.jpg build/f-einstein.jpg; cp $U/55858878-image.jpg build/f-selfie.jpg; ls build
