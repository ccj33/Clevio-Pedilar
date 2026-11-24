# 2026-11-24 13:46 - Write README and zip the delivery folder
S=/tmp/claude-0/-home-user-Claude-Teste/72f1d19b-8183-5f85-98cc-106ac2c334e3/scratchpad; OUT=$S/entrega/NeuroDynamics_Clevio_artefatos
cat > "$OUT/LEIA-ME.txt" <<'EOF'
NEURODYNAMICS / CLEVIO - ARTEFATOS BAIXADOS (24/11/2026)

COMO ABRIR
- Documentos (.docx): abrem no Word ou no Google Docs. Os .pdf abrem em qualquer leitor.
- Slides, carrossel, banners e capas: abra o PDF ou os PNG de cada pasta para ver.
- Paginas web: abra o index.html de cada pasta no navegador.

O QUE TEM EM CADA PASTA

1_Slides
  Clevio_Vida_Apos_a_Vida
  MIT_Hacking_Medicine_NeuroDynamics
  Conversa_com_Duane_NeuroDynamics
  Cada uma tem: um PDF para visualizar, a pasta "project" (o codigo-fonte de cada slide,
  em HTML) e a pasta "imagens".
  ATENCAO: o PDF e uma imagem aproximada. Icones e alguns espacamentos podem sair diferentes
  do original. A versao editavel de verdade continua no Claude, nos links dos artefatos.
  Os arquivos HTML da pasta "project" nao abrem no PowerPoint.

2_Carrossel_MIT
  artes_PNG: as 6 artes do carrossel (1080x1350).
  fonte_editavel: o codigo-fonte e as imagens do design.

3_Documentos
  7 documentos em Word (.docx) e 8 em PDF.
  Os 8 em PDF nao vieram em Word nesta exportacao. Para ter em Word, use o menu Exportar
  dentro do proprio documento no Claude.

4_Paginas_web
  Prototipos, one-pagers, FAQ e conferencia de gabarito. Cada pasta tem um index.html.
  - Desafio_08_Leite_Humano_HubMG_GOV: so a pagina principal (836 KB). Os PDFs originais,
    as imagens e os dados dessa pagina (cerca de 100 MB) nao foram baixados.
  - Contratos_vigentes_UFMG_e_HC-UFMG: so a pagina. Os dados ficam no banco do artefato
    e nao vieram.

5_Banners_e_capas
  Banners do LinkedIn (PNG) e capas de boas-vindas do LABBIO (PNG), com o codigo-fonte.

NAO ESTA AQUI
- Proposta da Pedilar (PDF) e termos de apoio (.docx): os arquivos desta sessao foram apagados.
- Slides "NeuroDynamics x Pedilar" e "Untitled": nao tinham arquivos para baixar.
- Design System: nao tinha arquivos de conteudo para baixar.
EOF
cd "$S/entrega" && rm -f NeuroDynamics_Clevio_artefatos.zip && zip -qr -9 NeuroDynamics_Clevio_artefatos.zip NeuroDynamics_Clevio_artefatos && ls -la NeuroDynamics_Clevio_artefatos.zip && find NeuroDynamics_Clevio_artefatos -type f | wc -l
