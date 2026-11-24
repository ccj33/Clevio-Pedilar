# 2026-11-24 13:44 - Organize slide and carousel sources and images
S=/tmp/claude-0/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/scratchpad; AF=$S/artifact-files; OUT=$S/entrega/NeuroDynamics_Clevio_artefatos
for p in "$AF/7a245fe6-1e75-4035-96ca-a7c3d43e520f" "$AF/49448cb2-b024-41a3-b04a-e63ba3f13589" "$AF/0a11fc26-06d5-4715-a0a9-c50aba32e450" "$AF/18dadfd5-785a-4048-ba72-f963013025d7"; do echo "== $p"; ls "$p" | head -5; ls "$p/project" 2>/dev/null | head -20; ls "$p"/*.jpg "$p"/*.png "$p"/*.mp4 2>/dev/null | wc -l; done
# organizar slides
mk(){ # nome origem
  d="$OUT/1_Slides/$1"; mkdir -p "$d/project" "$d/imagens"; cp -r "$2/project/." "$d/project/"; cp "$2"/*.jpg "$2"/*.png "$2"/*.mp4 "$d/imagens/" 2>/dev/null; }
mk "Clevio_Vida_Apos_a_Vida" "$AF/7a245fe6-1e75-4035-96ca-a7c3d43e520f"
mk "MIT_Hacking_Medicine_NeuroDynamics" "$AF/49448cb2-b024-41a3-b04a-e63ba3f13589"
mk "Conversa_com_Duane_NeuroDynamics" "$AF/0a11fc26-06d5-4715-a0a9-c50aba32e450"
d="$OUT/2_Carrossel_MIT/fonte_editavel"; mkdir -p "$d/project" "$d/imagens"; cp -r "$AF/18dadfd5-785a-4048-ba72-f963013025d7/project/." "$d/project/"; cp "$AF/18dadfd5-785a-4048-ba72-f963013025d7"/*.jpg "$AF/18dadfd5-785a-4048-ba72-f963013025d7"/*.png "$d/imagens/"
find "$OUT/1_Slides" -type f | wc -l; du -sh "$OUT"
