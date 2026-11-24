# 2026-10-28 10:59 - Shrink and shift the quem hub, narrow vav-2 layout
cd /tmp/claude-0/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/scratchpad/artifact-files/7a245fe6-1e75-4035-96ca-a7c3d43e520f/project/slides && python3 -I - <<'EOF'
import re
p='quem.html'; s=open(p).read()
s=s.replace('padding:128px 128px 160px;','padding:128px 260px 160px 128px;',1)
s=s.replace('x1="1276"','x1="1146"')
s=s.replace('x2="1276"','x2="1146"').replace('x2="1580"','x2="1426"').replace('x2="972"','x2="866"')
s=s.replace('left:1106px;','left:996px;').replace('left:1410px;','left:1276px;').replace('left:802px;','left:716px;')
s=s.replace('width:340px;','width:300px;')
s=s.replace('left:1166px;top:430px','left:1036px;top:430px')
s=s.replace('width:600px','width:560px')
open(p,'w').write(s)
p='vav-2.html'; s=open(p).read()
s=s.replace('left:128px; width:888px;','left:128px; width:820px;').replace('min-width:888px','min-width:820px').replace('width:726px','width:660px')
s=s.replace('left:1152px; width:640px; height:520px','left:1000px; width:600px; height:500px')
open(p,'w').write(s)
p='vav-1.html'; s=open(p).read(); print(re.findall(r'width:\d+px;height:\d+px',s))
EOF
grep -c 1146 quem.html; grep -o 'left:1000px[^"]*' vav-2.html
