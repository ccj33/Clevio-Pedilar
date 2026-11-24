# 2026-11-09 04:07 - Render carousel slides to PNG with Playwright
cd /tmp/claude-0/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/scratchpad/hackmed && mkdir -p out && cat > render.js <<'EOF'
const { chromium } = require('playwright');
(async () => {
  const b = await chromium.launch();
  const p = await b.newPage({ viewport: { width: 1080, height: 1350 }, deviceScaleFactor: 1 });
  await p.goto('file://' + process.argv[2], { waitUntil: 'networkidle' });
  await p.evaluate(() => document.fonts.ready);
  for (let i = 1; i <= 7; i++) {
    await p.locator('#s' + i).screenshot({ path: process.argv[3] + '/0' + i + '.png' });
  }
  await b.close();
})();
EOF
node render.js "$PWD/build/carrossel.html" "$PWD/out" && ls out && python3 -I -c "
from PIL import Image
ims=[Image.open('out/0%d.png'%i) for i in range(1,8)]
w=270;h=338
sheet=Image.new('RGB',(w*4+50,h*2+30),'#333')
for k,im in enumerate(ims):
  sheet.paste(im.resize((w,h)),(10+(k%4)*(w+10),10+(k//4)*(h+10)))
sheet.save('out/contato.png')"
