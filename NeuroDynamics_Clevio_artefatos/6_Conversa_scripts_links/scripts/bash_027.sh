# 2026-11-24 13:42 - Show keys of the export payload
cd /root/.claude/projects/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/tool-results/ && python3 -I - <<'EOF'
import json,glob
f=sorted(glob.glob('mcp-Claude_Docs-export-*.txt'))[0]
j=json.load(open(f))
d=j['data']
print({k:(v if k!='base64' and len(str(v))<200 else '...%d'%len(str(v))) for k,v in d.items()})
EOF
