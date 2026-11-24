# 2026-11-09 04:04 - Inspect fonts and asset links
cd /tmp/claude-0/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/scratchpad/hackmed/dl && sed -n '/font/Ip' design-system_tokens.css | head -40; python3 -I -c "
import re,sys
h=open('downloads').read()+open('index.html').read()
for m in sorted(set(re.findall(r'(?:href|src)=\"([^\"]+)\"',h))): print(m)
" | head -80
