# 2026-11-24 13:51 - Extract conversation text, links, scripts and edits from the transcript
S=/tmp/claude-0/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/scratchpad; C=$S/entrega/NeuroDynamics_Clevio_artefatos/6_Conversa_scripts_links; mkdir -p "$C/scripts" && python3 -I - /root/.claude/projects/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3.jsonl "$C" <<'EOF'
import sys,json,re,os,collections
J,C=sys.argv[1:3]
conv=[]; links=collections.OrderedDict(); nb=0; nw=0; edits=[]
url_re=re.compile(r'https?://[^\s\)\]\}>"\'`,]+')
def addlinks(txt,ctx):
    for u in url_re.findall(txt or ''):
        u=u.rstrip('.;:')
        if 'cdninstagram' in u or 'fonts.g' in u or 'scontent' in u: continue
        links.setdefault(u,ctx)
for line in open(J):
    o=json.loads(line); t=o.get('type')
    if t not in('user','assistant'): continue
    ts=(o.get('timestamp') or '')[:16].replace('T',' ')
    c=o['message'].get('content')
    blocks=[{'type':'text','text':c}] if isinstance(c,str) else c
    for b in blocks:
        bt=b.get('type')
        if bt=='text':
            txt=b['text']
            if t=='user' and ('<system-reminder>' in txt and len(txt.split('</system-reminder>')[-1].strip())<2): continue
            txt=re.sub(r'<system-reminder>.*?</system-reminder>','',txt,flags=re.S)
            txt=re.sub(r'<artifact-view-context.*?</artifact-view-context>','',txt,flags=re.S).strip()
            if not txt: continue
            conv.append(f'\n### {"Clévio" if t=="user" else "Claude"} · {ts}\n\n{txt}\n')
            addlinks(txt, ('Clévio' if t=='user' else 'Claude')+' '+ts)
        elif bt=='image' and t=='user':
            conv.append(f'\n### Clévio · {ts}\n\n[imagem enviada]\n')
        elif bt=='tool_use':
            n=b['name']; i=b.get('input',{})
            addlinks(json.dumps(i,ensure_ascii=False),'ferramenta '+n+' '+ts)
            if n=='Bash':
                nb+=1; fn=f'scripts/bash_{nb:03d}.sh'
                open(os.path.join(C,fn),'w').write(f"# {ts} - {i.get('description','')}\n{i.get('command','')}\n")
            elif n=='Write':
                nw+=1; base=os.path.basename(i['file_path']); fn=f'scripts/write_{nw:03d}_{base}'
                open(os.path.join(C,fn),'w').write(i.get('content',''))
            elif n=='Edit':
                edits.append(f"## {ts} - {i.get('file_path')}\n\n--- antes\n```\n{i.get('old_string')}\n```\n--- depois\n```\n{i.get('new_string')}\n```\n")
            elif n=='Artifact' and (i.get('edits')):
                edits.append(f"## {ts} - Artifact {i.get('url') or i.get('file_path')}\n\n```json\n{json.dumps(i.get('edits'),ensure_ascii=False,indent=1)}\n```\n")
open(os.path.join(C,'conversa_desde_28-10.md'),'w').write('# Conversa com o Claude (de 28/10/2026 em diante)\n\nSó as mensagens de texto. Chamadas de ferramenta estão na pasta scripts e em edicoes.md.\n'+''.join(conv))
open(os.path.join(C,'edicoes_feitas_nos_arquivos.md'),'w').write('# Edições feitas nos arquivos\n\n'+'\n'.join(edits))
with open(os.path.join(C,'links.md'),'w') as f:
    f.write('# Links que apareceram na conversa (desde 28/10)\n\n')
    art=[u for u in links if 'claude.ai/artifact' in u]; oth=[u for u in links if u not in art]
    f.write('## Artefatos no Claude\n\n'+'\n'.join(f'- {u}' for u in art)+'\n\n## Outros links\n\n'+'\n'.join(f'- {u}  ({links[u]})' for u in oth)+'\n')
print(len(conv),'msgs',nb,'bash',nw,'write',len(edits),'edits',len(links),'links')
EOF
ls -la "$C"; wc -c "$C"/*.md
