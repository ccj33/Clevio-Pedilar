# 2026-11-24 13:51 - Check repo sizes and transcript message structure
du -sh Opalina pauta-fantastico pauta-fantastico/* 2>/dev/null; python3 -I - /root/.claude/projects/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3.jsonl <<'EOF'
import sys,json
with open(sys.argv[1]) as f:
    for i,line in enumerate(f):
        o=json.loads(line)
        if o.get('type') in('user','assistant'):
            m=o['message']; c=m.get('content')
            if isinstance(c,str): print(i,o['type'],'STR',c[:300].replace('\n',' ')); 
            else: print(i,o['type'],[b.get('type') for b in c][:5], (c[0].get('text') or '')[:200].replace('\n',' ') if c and c[0].get('type')=='text' else '')
            if i>12: break
EOF
