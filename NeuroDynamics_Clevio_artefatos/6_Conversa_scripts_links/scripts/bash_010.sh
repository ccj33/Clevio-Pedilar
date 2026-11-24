# 2026-11-09 04:06 - Download PediLar logos and read homepage text
cd /tmp/claude-0/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/scratchpad/hackmed/dl && for u in pedilar-logo-c.png LOGO_COLORIDA_-FinalSite.png; do curl -sSL -o "pl_$u" "https://pedilar.com.br/wp-content/uploads/2021/08/$u"; done; grep -oi 'https\?://pedilar[^"'"'"' ]*\(branc\|white\|negativ\)[^"'"'"' ]*\.\(png\|svg\|webp\)' pedilar.html | sort -u; python3 -I -c "
from PIL import Image
for f in ['pl_pedilar-logo-c.png','pl_LOGO_COLORIDA_-FinalSite.png']:
  im=Image.open(f); print(f, im.size, im.mode)"; python3 -I -c "
import re,html
t=open('pedilar.html').read()
t=re.sub(r'<script.*?</script>|<style.*?</style>','',t,flags=re.S); t=html.unescape(re.sub(r'<[^>]+>',' ',t)); print(re.sub(r'\s+',' ',t)[:2500])"
