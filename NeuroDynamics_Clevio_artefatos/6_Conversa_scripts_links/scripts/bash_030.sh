# 2026-11-24 13:45 - Write the preprocessing script for rendering
S=/tmp/claude-0/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/scratchpad; mkdir -p $S/render && cat > $S/render/prep.py <<'EOF'
import sys,os,re,json,glob,html
OUT=sys.argv[1]; WORK=sys.argv[2]; AF=sys.argv[3]
jobs=[]  # (html_path, png_path, w, h)
def blob_fix(s, imgdir):
    files={os.path.splitext(f)[0]:f for f in os.listdir(imgdir)}
    def r(m):
        i=m.group(1)
        return 'file://'+os.path.join(imgdir,files[i]) if i in files else m.group(0)
    return re.sub(r'/_blob/([0-9a-f]{32})',r,s)
def poly(s):
    s=re.sub(r'<x-icon name="(\w+)" style="([^"]*)"></x-icon>',
             lambda m:f'<span style="{m.group(2)};display:inline-block;border:4px solid currentColor;border-radius:50%;box-sizing:border-box;flex:none"></span>',s)
    def conn(m):
        a=dict(re.findall(r'(\w+)="([^"]*)"',m.group(0)))
        st=a.get('style',''); col=re.search(r'color:\s*([^;]+)',st); bw=re.search(r'border-width:\s*(\d+)',st)
        return (f'<svg style="position:absolute;left:0;top:0;width:1920px;height:1080px;overflow:visible;pointer-events:none"><line x1="{a["x1"]}" y1="{a["y1"]}" x2="{a["x2"]}" y2="{a["y2"]}" stroke="{col.group(1) if col else "#999"}" stroke-width="{bw.group(1) if bw else 3}"/></svg>')
    s=re.sub(r'<x-connector[^>]*></x-connector>',conn,s)
    s=re.sub(r'<x-shape kind="arrow-right" style="([^"]*)"></x-shape>',
             lambda m:f'<div style="{m.group(1)};clip-path:polygon(0 32%,68% 32%,68% 0,100% 50%,68% 100%,68% 68%,0 68%)"></div>',s)
    return s
# slides
for deck in sorted(os.listdir(OUT+'/1_Slides')):
    d=OUT+'/1_Slides/'+deck; dj=json.load(open(d+'/project/deck.json'))
    links=''.join(f'<link rel="stylesheet" href="{f["href"]}">' for f in dj.get('faces',{}).values())
    os.makedirs(f'{WORK}/{deck}',exist_ok=True)
    for i,sid in enumerate(dj['order'],1):
        raw=open(f'{d}/project/slides/{sid}.html').read()
        raw=poly(blob_fix(raw,d+'/imagens'))
        page=f'<!doctype html><html><head><meta charset="utf-8">{links}<style>html,body{{margin:0;background:#fff}}section{{position:relative;width:1920px;height:1080px;overflow:hidden;box-sizing:border-box}}aside{{display:none}}p,h1,h2,h3,ul{{margin-top:0}}</style></head><body>{raw}</body></html>'
        p=f'{WORK}/{deck}/{i:02d}_{sid}.html'; open(p,'w').write(page)
        jobs.append((p,f'{WORK}/{deck}/{i:02d}_{sid}.png',1920,1080))
# design boards
def dc_inner(src):
    m=re.search(r'<x-dc>(.*?)</x-dc>',src,re.S); inner=m.group(1)
    hm=re.search(r'<helmet>(.*?)</helmet>',inner,re.S); helmet=hm.group(1) if hm else ''
    inner=inner.replace(hm.group(0),'') if hm else inner
    return helmet,inner
def board(src_path,imgdir,png,w,h,subs=None):
    src=open(src_path).read(); helmet,inner=dc_inner(src)
    if subs:
        for k,v in subs.items(): inner=inner.replace('{{'+k+'}}',v)
    if imgdir: inner=blob_fix(inner,imgdir)
    page=f'<!doctype html><html><head><meta charset="utf-8">{helmet}</head><body style="margin:0">{inner}</body></html>'
    p=png.replace('.png','.html').replace(OUT,WORK); os.makedirs(os.path.dirname(p),exist_ok=True); open(p,'w').write(page)
    os.makedirs(os.path.dirname(png),exist_ok=True); jobs.append((p,png,w,h))
cv=json.load(open(OUT+'/2_Carrossel_MIT/fonte_editavel/project/canvas.json'))
for k,name in enumerate(cv['order'],1):
    b=cv['boards'][name]
    board(f'{OUT}/2_Carrossel_MIT/fonte_editavel/project/{name}',OUT+'/2_Carrossel_MIT/fonte_editavel/imagens',f'{OUT}/2_Carrossel_MIT/artes_PNG/{k:02d}_{b["title"].replace(" ","_")}.png',b['w'],b['h'])
EOF
echo ok
