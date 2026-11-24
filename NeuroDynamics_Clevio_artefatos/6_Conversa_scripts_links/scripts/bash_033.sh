# 2026-11-24 13:46 - Build slide PDFs, copy web pages, validate documents
S=/tmp/claude-0/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/scratchpad; AF=$S/artifact-files; OUT=$S/entrega/NeuroDynamics_Clevio_artefatos; W=$S/render/work; TR=/root/.claude/projects/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/tool-results
# PDFs dos slides
python3 -I - "$W" "$OUT" <<'EOF'
import sys,glob,os
from PIL import Image
W,OUT=sys.argv[1:3]
for deck in sorted(os.listdir(OUT+'/1_Slides')):
    fs=sorted(glob.glob(f'{W}/{deck}/*.png'))
    ims=[Image.open(f).convert('RGB') for f in fs]
    pdf=f'{OUT}/1_Slides/{deck}/{deck}_visualizacao.pdf'
    ims[0].save(pdf,save_all=True,append_images=ims[1:],resolution=150,quality=88)
    print(deck,len(ims),os.path.getsize(pdf)//1024,'KB')
EOF
# renomear doc com nome cortado
cd "$OUT/3_Documentos" && mv "MIT Hacking Medicine 2026 · Oncologia — banca simulada e guia de jogo da NeuroDy.docx" "MIT Hacking Medicine 2026 - Oncologia - banca simulada e guia de jogo da NeuroDynamics.docx"
# paginas web
P="$OUT/4_Paginas_web"; mkdir -p "$P"
cp1(){ mkdir -p "$P/$1"; cp "$2" "$P/$1/index.html"; }
cp1 "Previa_Leitura_do_diagnostico_com_IA" $AF/9d23b5a1-d753-4b36-8cee-24f34ab2dae2/index.html
cp1 "Desafio_08_Leite_Humano_HubMG_GOV_(so_a_pagina)" $AF/4f665e17-40e0-411f-9f7d-1bc5a80b5871/index.html
cp1 "Desafio_08_FHEMIG_Leite_Humano" $AF/42adbf40-db22-4455-815e-7ee82a86df3b/index.html
cp1 "FAQ_Contratualizacao_de_Acoes_e_Servicos_de_Saude" $TR/artifact-721f0f3b-1792946096-c756.html
cp1 "Conferencia_do_gabarito" $TR/artifact-50474a32-1792161411-13c8.html
cp1 "Mapa_de_telas_RMDS" $TR/artifact-08bbfc7f-1790792296-3487.html
cp1 "Adesao_a_Rede_Mineira" $AF/37110f74-3d9f-43ee-b837-7c0ea5276e7e/index.html
cp1 "Contratos_vigentes_UFMG_e_HC-UFMG_(so_a_pagina)" $AF/80e58db1-fa97-4e53-ba6e-124cbf2c0e72/index.html
M=$AF/0967174b-06fb-4ac1-8a06-da8d62682081/media
cp1 "NeuroDynamics_One-Pagers" $AF/0967174b-06fb-4ac1-8a06-da8d62682081/index.html; mkdir -p "$P/NeuroDynamics_One-Pagers/media"; cp $M/* "$P/NeuroDynamics_One-Pagers/media/"
for pair in "Trike_FreeWheels_One-Pager:82e4b68b-2cbd-40d8-a318-c144689835d6:calima.mp4" "Nebula_One-Pager:234b969a-a082-42c4-9778-2f292adf51eb:" "Opalina_One-Pager:489eca49-ae21-4cc1-bf14-2848126848d0:opalina.mp4" "Orion_One-Pager:4f3718da-d5d0-44af-8819-c51f855f563e:orion.mp4" "Calima_One-Pager:4b5fdf8e-792d-4ffa-9688-00ca6b7e9e3e:"; do
  IFS=: read n d v <<<"$pair"; cp1 "$n" $AF/$d/index.html; mkdir -p "$P/$n/media"; cp $M/icon.png "$P/$n/media/"; [ -n "$v" ] && cp $M/$v "$P/$n/media/"; done
ls "$P"; du -sh "$OUT"/*; 
# validar docx
cd "$OUT/3_Documentos" && for f in *.docx; do unzip -tq "$f" >/dev/null && echo "ok $f" || echo "FALHA $f"; done; for f in *.pdf; do head -c4 "$f"|grep -q '%PDF' && echo "ok $f"||echo "FALHA $f"; done
