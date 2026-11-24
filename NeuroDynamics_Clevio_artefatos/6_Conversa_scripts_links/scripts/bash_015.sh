# 2026-11-09 04:19 - Inspect embed HTML for image URLs
cd /tmp/claude-0/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/scratchpad/hackmed/dl && for p in Dd9PiznFEi5 DdxdX74lBMl; do grep -o 'scontent[^"]\{0,400\}' emb_$p.html | head -3; grep -o '"display_url[^,]*' emb_$p.html | head; grep -c 'edge_sidecar' emb_$p.html; done
