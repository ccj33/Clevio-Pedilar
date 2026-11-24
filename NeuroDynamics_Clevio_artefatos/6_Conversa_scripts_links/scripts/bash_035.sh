# 2026-11-24 13:50 - Inspect transcript size, tools used and repo contents
J=/root/.claude/projects/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3.jsonl; ls -la $J; cd /home/user/Claude-Teste && git log --oneline | wc -l && git log --format='%h %ad %s' --date=short | head -40 && find . -path ./.git -prune -o -type f -print | head -60 && du -sh --exclude=.git .
python3 -I - "$J" <<'EOF'
import sys,json,collections
c=collections.Counter(); tools=collections.Counter(); n=0
first=last=None
with open(sys.argv[1]) as f:
    for line in f:
        n+=1
        try: o=json.loads(line)
        except: c['bad']+=1; continue
        t=o.get('type'); c[t]+=1
        ts=o.get('timestamp'); 
        if ts: first=first or ts; last=ts
        m=o.get('message') or {}
        if isinstance(m.get('content'),list):
            for b in m['content']:
                if b.get('type')=='tool_use': tools[b.get('name')]+=1
print(n,first,last); print(c.most_common()); print(tools.most_common(40))
EOF
