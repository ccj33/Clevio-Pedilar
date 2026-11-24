# 2026-11-09 04:19 - Fetch Instagram embed pages for the reference posts
cd /tmp/claude-0/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/scratchpad/hackmed/dl && for p in Dd9PiznFEi5 DdxdX74lBMl; do curl -sSL -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124 Safari/537.36" "https://www.instagram.com/p/$p/embed/captioned/" -o emb_$p.html -w "$p %{http_code} %{size_download}\n"; python3 -I -c "
import re,html,sys
h=open('emb_$p.html').read()
urls=re.findall(r'https:\\\\?/\\\\?/[^\"\s]*?cdninstagram[^\"\s]*?\.jpg[^\"\s]*',h)
urls=[html.unescape(u.replace('\\\\/','/').replace('\\\\u0026','&')) for u in urls]
seen=[]
[seen.append(u) for u in urls if u not in seen]
print(len(seen)); open('urls_$p.txt','w').write('\n'.join(seen))
cap=re.search(r'class=\"Caption\"(.*?)</div>',h,re.S)
print(re.sub(r'<[^>]+>',' ',html.unescape(cap.group(1)))[:1500] if cap else 'nocap')
"; done
