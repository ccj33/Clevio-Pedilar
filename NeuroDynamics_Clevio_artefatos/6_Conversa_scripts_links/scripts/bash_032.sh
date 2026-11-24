# 2026-11-24 13:46 - Make a contact sheet to check renders
S=/tmp/claude-0/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/scratchpad; OUT=$S/entrega/NeuroDynamics_Clevio_artefatos; W=$S/render/work
python3 -I - "$W" "$OUT" <<'EOF'
import sys,glob
from PIL import Image
W,OUT=sys.argv[1:3]
pick=[W+'/Clevio_Vida_Apos_a_Vida/02_quem.png',W+'/Clevio_Vida_Apos_a_Vida/08_vav-5.png',W+'/Conversa_com_Duane_NeuroDynamics/06_logos.png',W+'/MIT_Hacking_Medicine_NeuroDynamics/01_cover.png',OUT+'/2_Carrossel_MIT/artes_PNG/01_01_Capa.png',OUT+'/5_Banners_e_capas/Banner_LinkedIn_Saude_Digital/Banner_LinkedIn_Saude_Digital.png']
ims=[Image.open(p).convert('RGB') for p in pick]
w=640
sheet=Image.new('RGB',(w*3+40,760),'#444')
x=10;y=10
for k,im in enumerate(ims):
    h=int(im.height*w/im.width); im=im.resize((w,h))
    sheet.paste(im,(10+(k%3)*(w+10),10+(k//3)*370 if k<3 else 10+(k//3)*380))
sheet.save(W+'/check.png')
EOF
echo done
