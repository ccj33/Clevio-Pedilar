# Prompt para o Sonnet: PDF de pauta para o Fantástico

## Como usar

**Opção A (recomendada): Claude Code com o Sonnet, neste repositório.** Abra uma sessão na branch onde está esta pasta e diga: "Siga o arquivo `pauta-fantastico/02_PROMPT_SONNET.md`". O Sonnet acha as imagens sozinho.

**Opção B: claude.ai com o Sonnet.**
1. Anexe este arquivo e as imagens da pasta `pauta-fantastico/imagens/` (pelo menos as da tabela da seção 6).
2. Cole a frase: "Siga as instruções do arquivo anexo."
3. Baixe o HTML gerado para dentro da pasta `pauta-fantastico/`, ao lado da pasta `imagens/`.
4. Abra no Chrome, clique em Imprimir e depois em Salvar como PDF (margens: nenhuma; marque "gráficos de plano de fundo").

Antes de enviar o PDF, preencha todos os [COLCHETES] (veja `01_ANALISE_E_ESTRATEGIA.md`, seções 6 e 8).

---

## PROMPT (tudo daqui para baixo é para o Sonnet)

Você é designer editorial e vai produzir um PDF de 8 páginas que acompanha um e-mail para uma editora do **Fantástico** (TV Globo). O objetivo é convencê-la de que existe uma reportagem a ser feita. Isto é **uma sugestão de pauta para jornalista**, não um deck de investidor nem um folder de vendas.

### 1. Contexto em 5 linhas

- **Remetente:** NeuroDynamics, iniciativa sem fins lucrativos da Escola de Engenharia da UFMG, sediada no LABBIO (Laboratório de Bioengenharia).
- **Destinatária:** Raísa Carvalho, Editora II do Fantástico Web. Ela cuida do conteúdo digital e das redes do programa, recebe centenas de sugestões e vai ler no celular e no computador.
- **História:** Jônatas, paraplégico desde um acidente de moto aos 25 anos, voltou a pedalar com os próprios músculos, acionados por estimulação elétrica funcional (FES). Representou o Brasil no CYBATHLON 2024 ("Olimpíadas Biônicas", Suíça) e ficou em 9º lugar no mundo. A mesma tecnologia agora é estudada para pacientes de UTI, pessoas que tiveram AVC e para o SUS.
- **Já saiu:** parte da história foi ao ar no Jornal Nacional em 27/04/2026. O PDF precisa deixar claro o que ainda é novo.
- **Tom:** calmo, direto, humano e verificável. Personagem primeiro, instituição depois.

### 2. Regras de conteúdo (obrigatórias)

1. **Não invente nada:** nenhum fato, número, nome, cargo, data, citação ou dado clínico. Use só o texto da seção 5.
2. **[COLCHETES] são lacunas a preencher.** Mantenha cada uma visível, com fundo #FF70A6 e texto #6B0F38, para que ninguém envie o PDF sem revisar. Não substitua por texto inventado.
3. **Ajuste de texto:** você pode encurtar o texto para caber, mas não pode acrescentar afirmações. Liste no fim da resposta qualquer frase que tenha mudado.
4. **Proibido:** "revolucionário", "inédito", "único", "cura", "voltou a andar", "recuperou os movimentos", "milagre" e "inteligência artificial" como gancho.
5. **Sem emoji e sem ponto médio (·)** em nenhum texto (regra do manual da marca).
6. **Títulos de ação.** Cada página tem um título que já é a conclusão dela. Lendo só os 8 títulos em sequência, a pauta inteira tem que fazer sentido.
7. **Limites:** uma ideia por página e no máximo cerca de 90 palavras de texto corrido por página (a página 2 pode ter até 130).
8. **Imagens:** só as fotos listadas na seção 6. Nada de banco de imagens nem imagens geradas por IA. Não use fotos de outras equipes do CYBATHLON.

### 3. Formato e entrega

- **Arquivo:** um único HTML (`pauta-jonatas.html`), com CSS embutido e fontes do Google Fonts. As imagens são referenciadas por caminho relativo (`imagens/...`).
- **Páginas:** 8 `<section class="page">` de **1080 × 1350 px** (proporção 4:5, a mesma do folder da equipe; boa leitura no celular e no computador).
- **Impressão:** use `@page { size: 1080px 1350px; margin: 0 }`, `.page { break-after: page; overflow: hidden; }` e `-webkit-print-color-adjust: exact; print-color-adjust: exact;`. O "Salvar como PDF" do Chrome tem que gerar exatamente 8 páginas, sem margens brancas.
- **Na tela:** as páginas aparecem empilhadas, centralizadas, com 40 px de espaço entre elas e fundo #1D1D1F.
- **Peso:** o PDF final deve ter no máximo 5 MB. Imagens com no máximo 1600 px no lado maior. Se precisar, use `object-fit: cover` com `object-position` para enquadrar.
- **Rodapé de todas as páginas, exceto a capa:** à esquerda, "NeuroDynamics, iniciativa da Escola de Engenharia da UFMG". À direita, o número da página no formato "2/8". Archivo 500, 18 px, cor de texto secundário da página.

### 4. Sistema visual (manual da marca NeuroDynamics, versão 3)

**Cores** (use os hex exatos):

| Papel | Token | Hex |
|---|---|---|
| Fundo escuro de assinatura | Cortex dark | #00352F |
| Fundo mais escuro (alternativa) | Sulco dark, "Void" | #050807 |
| Fundo de leitura, papel quente | Medula light | #F7F4EE |
| Superfície clara secundária | Cortex light | #E3EFEC |
| Acento em papel claro (texto e linhas) | Axon, Cortex primary | #00594F |
| Destaque em fundo escuro (só palavras-chave e números) | Synapse | #CEDC00 |
| Texto em fundo claro | Sulco medium | #1D1D1F |
| Texto secundário em fundo claro | Sulco light | #616C68 (só legendas) |
| Texto em fundo escuro | Pia light | #E8EDEB |
| Texto secundário em fundo escuro | Pia primary | #9AA5A1 |

**Regras de cor:**
- Fundo escuro leva texto claro, com Synapse só em 1 a 3 palavras ou num número.
- Fundo claro leva texto Sulco medium, com Axon nos acentos. Synapse nunca vai em fundo claro (fica ilegível) e nunca é usado como fundo grande.
- Uma família de cor por página. Não misture as secundárias (Ion, Ritmo etc.).
- Gradiente só do conjunto Cortex. Exemplo permitido: véu sobre a foto da capa, de rgba(0,53,47,0) a rgba(0,53,47,0.92) de cima para baixo. Sem brilho neon, sem vidro, sem sombras pesadas.
- Contraste mínimo de 4,5:1 em texto corrido (os pares acima já passam).

**Tipografia** (Google Fonts). Carregue com:
`<link href="https://fonts.googleapis.com/css2?family=Archivo:wdth,wght@62..125,300..800&family=Instrument+Sans:wght@400;500&display=swap" rel="stylesheet">`
- **Títulos:** Archivo, peso 700. Nos títulos de impacto (capa e páginas 3 e 4), use o eixo de largura condensado (`font-stretch: 75%`, carregando Archivo com o eixo `wdth`), como no site neuroexperiencia.tech. Tracking −0,02em, entrelinha 1,0 a 1,05, 72 a 96 px.
- **Rótulos e chapéus (eyebrow):** Archivo 600, CAIXA ALTA, 22 px, tracking 0,14em.
- **Texto corrido:** Instrument Sans 400, 28 a 30 px, entrelinha 1,5. Para ênfase, use a cor; nunca negrito em subtítulo e nunca itálico para destacar.
- **Números grandes:** Archivo 700, 200 a 260 px.
- **Citações:** Archivo 700 condensado, com aspas curvas “ ”.
- Texto sempre alinhado à esquerda, nunca justificado.

**Grade e respiro:**
- Margens de 80 px. Grade de 12 colunas com 24 px de calha. Espaço em branco generoso.

**Fotografia:**
- Documental e real, sem filtros coloridos. Rostos inteiros, sem cortar o Jônatas no meio. Pequenos ajustes de brilho e contraste são permitidos.

**Ícones e diagramas:**
- SVG desenhado à mão no próprio HTML, traço de 3 px em Axon (fundo claro) ou Pia light (fundo escuro), sem preenchimento colorido.
- Sem bibliotecas de ícones genéricas.

**Logo:**
- `imagens/logos/logo-imagotipo-white.png` em fundo escuro e `imagens/logos/logo-imagotipo-black.png` em fundo claro.
- Altura de 44 px, com espaço livre ao redor. Não recolorir nem distorcer.
- Não montar logo conjunto com UFMG ou parceiros: o co-branding depende de aprovação. "Escola de Engenharia da UFMG" aparece só como texto.

**Evite o visual "feito por IA":** cartões flutuantes iguais, gradientes roxos, ícones em todo canto, fundo com partículas, texto centralizado em tudo.

### 5. Conteúdo, página por página (texto final)

---

**PÁGINA 1: CAPA**
Fundo: foto em sangria nos 62% superiores, com véu Cortex de baixo para cima. Parte inferior em Cortex dark chapado.
- Chapéu: SUGESTÃO DE PAUTA PARA O FANTÁSTICO
- Título: Ele não move as pernas desde os 25 anos. Na Suíça, pedalou pelo Brasil **com a força dos próprios músculos.** (o trecho em negrito aqui indica a cor Synapse, não peso tipográfico)
- Subtítulo: A história de Jônatas e da tecnologia criada na UFMG que agora quer chegar às UTIs e ao SUS.
- Base: logo branco à esquerda. À direita, "Outubro de 2026".
- Foto: `imagens/site/cybathlon-2024-jonatas-prova-frame-video.jpg` (Jônatas competindo no CYBATHLON 2024, camiseta FreeWheels). Enquadre com ele à esquerda do centro. A imagem tem só 1280 × 720 px: não a amplie além de 1,3 vez. Se ficar granulada, use-a numa faixa de 1080 × 640 px em vez da sangria e anote "pedir foto original em alta resolução para a equipe".

---

**PÁGINA 2: A PAUTA EM 30 SEGUNDOS**
Fundo: Medula light.
- Chapéu: A PAUTA EM 30 SEGUNDOS
- Título: Um personagem, uma virada e uma tecnologia que interessa a qualquer família.
- Quatro blocos numa grade 2 × 2, cada um com rótulo em Axon e texto:
  - **O PERSONAGEM.** Jônatas [SOBRENOME], [IDADE] anos, de [CIDADE]. Aos 25 anos, um acidente de moto lesionou sua medula. Ele perdeu os movimentos e a sensibilidade do peito para baixo.
  - **A VIRADA.** Pesquisadores da UFMG fizeram os músculos paralisados das pernas dele voltarem a trabalhar, com estímulos elétricos no ritmo da pedalada. Depois de quatro anos de preparo, ele representou o Brasil no CYBATHLON 2024, na Suíça, e terminou em 9º lugar no mundo.
  - **A CIÊNCIA.** A mesma tecnologia agora é estudada para outros pacientes: pessoas que tiveram AVC, pacientes internados em UTI e a reabilitação no SUS. A equipe também pesquisa uma bicicleta que responde à intenção do paciente.
  - **POR QUE AGORA.** Em outubro de 2026, a versão sem fio do sistema, que funciona em bicicletas ergométricas comuns, recebeu menção honrosa no Congresso Brasileiro de Engenharia Biomédica e foi selecionada para publicação do IEEE.

---

**PÁGINA 3: O PERSONAGEM**
Fundo: Cortex dark. Foto à direita ou no topo, ocupando cerca de 45% da página.
- Chapéu: O PERSONAGEM
- Título (citação, Archivo condensado, com **tão longe** em Synapse): “Nunca imaginei chegar **tão longe.**”
- Texto: Jônatas tinha 25 anos quando um acidente de moto causou uma lesão medular completa, na altura da vértebra T4. [O QUE ELE FAZIA ANTES DO ACIDENTE, FAMÍLIA, O QUE MAIS SENTIU FALTA: preencher com ele.] Anos depois, começou a treinar com a equipe da UFMG no Centro de Treinamento Esportivo da universidade. Em outubro de 2024, competiu nas “Olimpíadas Biônicas”, diante do público, contra equipes de 24 países.
- Citação secundária (menor, em Pia light, com fio Synapse à esquerda): “Foi uma grande emoção viver essa experiência. Foram quatro anos de muito preparo e superação pra ter chegado até aqui.” Assinatura: Jônatas, depois do CYBATHLON 2024.
- Caixa opcional: [NOVA FRASE EXCLUSIVA DO JÔNATAS SOBRE O QUE ELE QUER AGORA]
- Foto: `imagens/pdfs/04-jonatas-retrato-centro-treinamento-ufmg.jpg` (retrato no Centro de Treinamento Esportivo). Alternativa: `imagens/pdfs/01-jonatas-laboratorio-eletrodos-com-fisioterapeuta.jpg`.

---

**PÁGINA 4: COMO FUNCIONA**
Fundo: Medula light. Diagrama SVG de 4 passos em fluxo vertical ou em "U". Foto de apoio pequena.
- Chapéu: COMO FUNCIONA
- Título (condensado): Não é um motor. **São os músculos dele que giram o pedal.** (o trecho em destaque fica em Axon)
- Abertura: A lesão interrompe o comando que sai do cérebro, mas os nervos e os músculos abaixo dela ainda conseguem responder. O sistema entrega esse comando de fora, no momento exato. [REVISÃO TÉCNICA DO PROF. HENRIQUE MARTINS]
- Passos (número grande em Axon, rótulo, frase):
  1. **SENSOR.** Um sensor informa, em tempo real, a posição do pedal. Na versão mais nova, ele é sem fio.
  2. **DECISÃO.** O sistema calcula qual grupo muscular deve contrair naquele ponto da volta.
  3. **ESTÍMULO.** Eletrodos colados na pele enviam pulsos elétricos aos músculos das pernas.
  4. **PEDALADA.** Os músculos contraem na ordem certa, e o pedal gira com a força do próprio corpo.
- Nota (texto pequeno, Sulco light): Benefícios estudados: ganho de força e de massa muscular, redução da espasticidade e mais resistência à fadiga. [CONFIRMAR COM A EQUIPE QUAIS BENEFÍCIOS PODEM SER AFIRMADOS]
- Foto: `imagens/pdfs/02-pernas-com-eletrodos-closeup.jpg` (pernas com eletrodos), num recorte vertical ao lado do diagrama.

---

**PÁGINA 5: A TRAJETÓRIA**
Fundo: Medula light. Linha do tempo vertical: fio de 3 px em Axon, pontos de 16 px, ano em Archivo 700 Axon e texto em Instrument Sans.
- Chapéu: A TRAJETÓRIA
- Título: De um protótipo no laboratório à arena das “Olimpíadas Biônicas”.
- Marcos:
  - **2016:** Nasce a equipe FreeWheels, parceria da UFMG com a Universidade de Brasília e a Universidade de Montpellier, na França.
  - **[2019]:** Primeiros protótipos do triciclo no LABBIO, o Laboratório de Bioengenharia da UFMG. [CONFIRMAR ANO]
  - **[ANO]:** Jônatas começa a treinar com a equipe. [CONFIRMAR]
  - **Out. 2024:** CYBATHLON, na Suíça: 9º lugar mundial na prova de FES Cycling. O evento reuniu 67 equipes de 24 países.
  - **Jun. 2025:** Nasce a NeuroDynamics, que leva a pesquisa a novos projetos de saúde.
  - **Abr. 2026:** A pesquisa aparece no Jornal Nacional.
  - **Out. 2026:** Menção honrosa no Congresso Brasileiro de Engenharia Biomédica e seleção para os Proceedings do IEEE.
- Fotos pequenas (duas, alinhadas à direita da linha):
  - `imagens/site/2019-origem-primeiro-prototipo-labbio-ufmg-equipe.jpg`
  - `imagens/site/2024-equipe-ufmg-completa-laboratorio-jonatas.jpg`. Esta tem moldura verde de post de rede social: recorte só a área interna da foto.

---

**PÁGINA 6: POR QUE IMPORTA PARA TODO MUNDO**
Fundo: Cortex dark. Página tipográfica, sem foto.
- Chapéu: POR QUE ISSO IMPORTA
- Título: A mesma tecnologia pode ajudar quem passa dias imóvel numa UTI.
- Número grande em Synapse: **17,7%**
- Legenda do número: foi quanto o principal músculo da coxa de pacientes críticos encolheu, em média, em 10 dias de UTI.
- Fonte (Pia primary, 18 px): Puthucheary et al., JAMA, 2013.
- Texto: Pacientes sedados não conseguem se exercitar. A pedalada com estímulo elétrico é estudada como forma de manter os músculos trabalhando mesmo assim. A equipe desenvolve projetos de reabilitação com hospitais, para pacientes de UTI e pessoas que tiveram AVC. [CONFIRMAR QUAIS HOSPITAIS PODEM SER CITADOS]
- Segundo número (menor, Pia light): **1 em cada 3** pessoas no mundo vive com uma condição que pode se beneficiar de reabilitação. Fonte: Organização Mundial da Saúde.
- Fecho (fio Synapse acima): A próxima fronteira: uma bicicleta que responde à intenção do paciente, lida por sensores de atividade cerebral. Hoje, isso é pesquisa em andamento.

---

**PÁGINA 7: PARA A REPORTAGEM**
Fundo: Medula light. Duas colunas. Lista com marcadores em forma de traço curto em Axon (não use ponto médio).
- Chapéu: PARA A REPORTAGEM
- Título: O que o público ainda não viu, e onde dá para gravar.
- Coluna 1, **AINDA NÃO FOI CONTADO:**
  - A vida de Jônatas além da pedalada, e o que mudou depois da Suíça.
  - A versão sem fio, premiada em outubro de 2026, que transforma uma bicicleta ergométrica comum em equipamento de reabilitação.
  - Os bastidores: [NÚMERO] estudantes de engenharia e saúde que constroem tecnologia médica numa iniciativa sem fins lucrativos.
  - [PRÓXIMO MARCO COM DATA, SE HOUVER E SE AUTORIZADO]
- Coluna 2, **CENAS POSSÍVEIS:**
  - Jônatas treinando no Centro de Treinamento Esportivo da UFMG.
  - Close dos músculos contraindo com o estímulo elétrico.
  - O laboratório e a equipe ajustando o triciclo.
  - Teste com sensor de atividade cerebral.
  - Imagens de arquivo da prova na Suíça.
  - [HOSPITAL PARCEIRO, SÓ COM AUTORIZAÇÃO]
- Nota ao pé (Sulco light): Parte desta história foi ao ar no Jornal Nacional em 27 de abril de 2026.
- Foto (faixa horizontal no topo ou entre o título e as colunas): `imagens/pdfs/03-jonatas-no-triciclo-laboratorio-equipe.jpg`.

---

**PÁGINA 8: QUEM FALA E CONTATO**
Fundo: Cortex dark.
- Chapéu: CONTATO
- Título: Personagem, pesquisadores e imagens prontos para a produção.
- **QUEM PODE FALAR:**
  - Jônatas [SOBRENOME], atleta e personagem.
  - Prof. Henrique Martins, coordenador da pesquisa e [CARGO ATUAL: vice-diretor da Escola de Engenharia da UFMG?].
  - [PESQUISADOR OU PESQUISADORA DA EQUIPE]
  - [FISIOTERAPEUTA OU MÉDICO PARCEIRO, COM AUTORIZAÇÃO]
- **MATERIAL DISPONÍVEL:** vídeo da prova no CYBATHLON 2024, fotos em alta resolução e vídeos curtos verticais. [LINK DO DRIVE]
- **A HISTÓRIA EM 2 MINUTOS:** neuroexperiencia.tech (em Synapse)
- **CONTATO:** Clévio Clênio, Diretor de Relações Institucionais. clevio@neurodynamics.dev. [TELEFONE/WHATSAPP]
- Base: logo branco e o texto "LABBIO, Escola de Engenharia, UFMG. Belo Horizonte, MG."
- Links clicáveis no PDF: `https://neuroexperiencia.tech`, `mailto:clevio@neurodynamics.dev` e o link do Drive.

---

### 6. Imagens disponíveis (pasta `imagens/`)

| Arquivo | O que mostra | Página |
|---|---|---|
| `site/cybathlon-2024-jonatas-prova-frame-video.jpg` | Jônatas na prova do CYBATHLON 2024 (1280 × 720) | 1 |
| `site/cybathlon-hero-poster.jpg` | A mesma cena, quadro do vídeo do site (1280 × 720) | 1, alternativa |
| `pdfs/04-jonatas-retrato-centro-treinamento-ufmg.jpg` | Retrato do Jônatas no Centro de Treinamento Esportivo | 3 |
| `pdfs/01-jonatas-laboratorio-eletrodos-com-fisioterapeuta.jpg` | Jônatas no laboratório, com eletrodos, ao lado da fisioterapeuta | 3, alternativa |
| `pdfs/02-pernas-com-eletrodos-closeup.jpg` | Close das pernas com eletrodos | 4 |
| `site/2019-origem-primeiro-prototipo-labbio-ufmg-equipe.jpg` | Equipe e primeiro protótipo no LABBIO | 5 |
| `site/2024-equipe-ufmg-completa-laboratorio-jonatas.jpg` | Equipe com o Jônatas e o triciclo (tem moldura: recortar) | 5 |
| `pdfs/03-jonatas-no-triciclo-laboratorio-equipe.jpg` | Jônatas no triciclo com a equipe (768 × 432, usar pequeno) | 7 |
| `pdfs/06-arena-cybathlon-vista-geral.jpg` | Arena do CYBATHLON com público | reserva |
| `pdfs/08-medalha-cybathlon.jpg` | Medalha do CYBATHLON | reserva |
| `logos/logo-imagotipo-white.png` e `logos/logo-imagotipo-black.png` | Logos oficiais | todas |

**Não use:** os arquivos com "VERIFICAR" no nome (não se sabe quem aparece) e `site/2024-cybathlon-arena-zurique-largada.jpg` (é print de um story, com texto por cima).

### 7. Antes de entregar, confira

- [ ] Os 8 títulos, lidos em sequência, contam a pauta.
- [ ] Nenhum fato, número ou citação fora da seção 5.
- [ ] Todos os [COLCHETES] continuam visíveis e destacados.
- [ ] Nenhum emoji, nenhum ponto médio, nenhuma palavra proibida.
- [ ] Synapse aparece só em fundo escuro e em pouquíssimas palavras.
- [ ] Texto corrido com pelo menos 28 px, legível num celular.
- [ ] Imprimir para PDF gera 8 páginas de 1080 × 1350 sem margens, com até 5 MB.
- [ ] No fim da resposta, liste: (a) frases que você encurtou ou mudou, (b) lacunas pendentes, (c) imagens que ficaram em resolução baixa.

**Passo opcional:** antes das 8 páginas, mostre duas direções de capa (uma com a foto em sangria e outra com a foto em faixa e o título grande abaixo) e espere a escolha.
