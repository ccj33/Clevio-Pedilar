# 2026-11-09 04:04 - Read social media guidelines page
cd /tmp/claude-0/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/scratchpad/hackmed/dl && curl -sSL -o social.html https://brand.neurodynamics.dev/aplicacoes/social && curl -sSL -o feed.jpg https://brand.neurodynamics.dev/assets/manual/social-feed-cortex.jpg && curl -sSL -o li.jpg https://brand.neurodynamics.dev/assets/manual/linkedin/en-real-projects-real-deadlines.jpg && python3 -I -c "
import re,html
h=open('social.html').read()
t=re.sub(r'<script.*?</script>|<style.*?</style>','',h,flags=re.S)
t=html.unescape(re.sub(r'<[^>]+>',' ',t)); t=re.sub(r'\s+',' ',t)
print(t[:6000])
print([m for m in set(re.findall(r'(?:src|href)=\"([^\"]+\.(?:jpg|png|webp|svg))\"',h))])
"
