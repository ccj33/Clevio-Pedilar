# 2026-11-24 13:42 - Inspect the exported docx result file format
cd /root/.claude/projects/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/tool-results/ && f=$(ls mcp-Claude_Docs-export-*.txt | head -1) && head -c 400 "$f"; echo; echo ---; python3 -I - "$f" <<'EOF'
import sys,json,base64
s=open(sys.argv[1]).read()
try:
    j=json.loads(s)
    print(type(j), list(j)[:10] if isinstance(j,dict) else len(j))
except Exception as e:
    print('notjson',e)
EOF
