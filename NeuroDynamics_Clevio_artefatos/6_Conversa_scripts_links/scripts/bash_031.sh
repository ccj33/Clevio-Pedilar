# 2026-11-24 13:45 - Render all slides, boards, banners and covers to PNG
S=/tmp/claude-0/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/scratchpad; AF=$S/artifact-files; OUT=$S/entrega/NeuroDynamics_Clevio_artefatos; B="$OUT/5_Banners_e_capas"
mkdir -p "$B/Banner_LinkedIn_Inovacao_em_Saude/fonte" "$B/Banner_LinkedIn_Saude_Digital/fonte" "$B/Capas_de_boas_vindas_LABBIO/fonte"
cp -r $AF/a1ec36f4-3e9e-44b8-87b9-c5f1b1baf801/project/. "$B/Banner_LinkedIn_Inovacao_em_Saude/fonte/"
cp -r $AF/dc960867-4d00-4fb5-be2a-bcad01e7e810/project/. "$B/Banner_LinkedIn_Saude_Digital/fonte/"
cp -r $AF/704c14a0-d1b3-4a8f-94c0-39f368606112/project/. "$B/Capas_de_boas_vindas_LABBIO/fonte/"
cat >> $S/render/prep.py <<'EOF'
B=OUT+'/5_Banners_e_capas'
board(f'{B}/Banner_LinkedIn_Inovacao_em_Saude/fonte/Main.dc.html',None,f'{B}/Banner_LinkedIn_Inovacao_em_Saude/Banner_LinkedIn_Inovacao_em_Saude.png',1584,396)
board(f'{B}/Banner_LinkedIn_Saude_Digital/fonte/Main.dc.html',None,f'{B}/Banner_LinkedIn_Saude_Digital/Banner_LinkedIn_Saude_Digital.png',2056,765)
capas={'Larissa_Carvalho':'Larissa Carvalho','Theo':'Théo','Dayse_Lacerda':'Dayse Lacerda','Samantha_Mapa':'Samantha Mapa','Profissional_1':'[Nome do profissional]','Profissional_2':'[Nome do profissional]','Modelo':'Nome do visitante'}
for k,v in capas.items():
    board(f'{B}/Capas_de_boas_vindas_LABBIO/fonte/Capa.dc.html',None,f'{B}/Capas_de_boas_vindas_LABBIO/Capa_{k}.png',559,794,{'nome':v,'accent':'#1E3A8A'})
json.dump(jobs,open(WORK+'/jobs.json','w'))
print(len(jobs),'jobs')
EOF
cat > $S/render/shot.js <<'EOF'
const { chromium } = require('playwright'); const fs=require('fs');
(async()=>{
  const jobs=JSON.parse(fs.readFileSync(process.argv[2]));
  const b=await chromium.launch();
  for (const [html,png,w,h] of jobs){
    const p=await b.newPage({viewport:{width:w,height:h}});
    try{
      await p.goto('file://'+html,{waitUntil:'networkidle',timeout:45000});
      await p.evaluate(()=>document.fonts.ready);
      await p.waitForTimeout(300);
      await p.screenshot({path:png,clip:{x:0,y:0,width:w,height:h}});
      console.log('ok',png.split('/').slice(-2).join('/'));
    }catch(e){console.log('ERRO',png,e.message.slice(0,100));}
    await p.close();
  }
  await b.close();
})();
EOF
cd $S/render && python3 -I prep.py "$OUT" "$S/render/work" "$AF" && node shot.js $S/render/work/jobs.json 2>&1 | tail -80
