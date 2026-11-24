# 2026-11-24 13:44 - Decode exported documents into the delivery folder
S=/tmp/claude-0/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/scratchpad; AF=$S/artifact-files; TR=/root/.claude/projects/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/tool-results
OUT=$S/entrega/NeuroDynamics_Clevio_artefatos; rm -rf $S/entrega; mkdir -p "$OUT"/{1_Slides,2_Carrossel_MIT,3_Documentos,4_Paginas_web,5_Banners_e_capas}
# documentos
python3 -I - "$TR" "$OUT/3_Documentos" <<'EOF'
import sys,json,glob,base64,os,re
tr,out=sys.argv[1:3]
for f in sorted(glob.glob(tr+'/mcp-Claude_Docs-export-*.txt')):
    try:
        j=json.load(open(f))
        d=j['data']; b=base64.b64decode(d['bytes_b64'])
    except Exception as e:
        print('ERRO',f,e); continue
    name=re.sub(r'[\\/:*?"<>|]','-',d['name'])
    open(os.path.join(out,name),'wb').write(b)
    print(len(b),name)
EOF
ls -la "$OUT/3_Documentos"
