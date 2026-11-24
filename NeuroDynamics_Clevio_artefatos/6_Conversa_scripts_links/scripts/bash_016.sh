# 2026-11-09 04:19 - Look for images or blocking in embed page
cd /tmp/claude-0/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/scratchpad/hackmed/dl && grep -o 'cdninstagram[^"]\{0,300\}' emb_Dd9PiznFEi5.html | head -5; grep -o '<img[^>]\{0,500\}' emb_Dd9PiznFEi5.html | head -5; grep -oi 'login\|not available\|EmbedIsBroken' emb_Dd9PiznFEi5.html | sort | uniq -c
