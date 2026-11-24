# Pacote NotebookLM — MIT Hacking Medicine / Pedilar (31/10 e 01/11/2026)

Origem: `C:\Users\Clevio\Downloads\Clevio Pedilar\Camera` (75 fotos 4096x3072)
Reeditado em 24/11/2026 — **agora todas as fotos estão em PNG**.

## Subir como imagem: pasta `fotos/`

75 arquivos `.png`, um por foto, já em ordem cronológica:

```
FOTO_001_2026-10-31_07h09.png   ...   FOTO_075_2026-11-01_16h45.png
```

| Propriedade | Valor |
|---|---|
| Formato | PNG 8-bit RGB, sem interlace |
| Chunks | só `IHDR` + `IDAT` + `IEND` (sem ICC, sem EXIF, sem XMP, sem texto) |
| Cor | sRGB (Display P3 convertido) |
| Orientação | aplicada nos pixels — nada de foto deitada |
| Tamanho | 1500 px no lado maior, 0,87 a 3,27 MB por arquivo |
| Total | 75 arquivos, 134,5 MB |

Se o NotebookLM reclamar do volume, suba em lotes: 1–40 no primeiro, 41–75 no segundo.
O limite do plano free é 50 fontes por notebook.

## O que estava fazendo ele recusar

| Original | Correção |
|---|---|
| JPEG com **gain map HDR** (MPF/MPO) e perfil **Display P3** | reescrito do zero em PNG sRGB: MPF, XMP, EXIF e ICC não existem mais no arquivo |
| Orientação só no EXIF | rotação aplicada nos pixels |
| 4096x3072, 3–8 MB | 1500 px no lado maior |
| Slide quase preto (FOTO_031) | versão com gamma corrigido em `extras/`, já usada no lugar dela |

## Conteúdo por faixa

| Faixa | O que tem |
|---|---|
| 001 | credencial do evento |
| 002–010 | auditório, plateia, abertura |
| 011–037 | dia 1 no palco: MIT Hacking Medicine, oncologia Einstein, jornada do paciente, hospital, o desafio |
| 038–052 | hack dos, critérios de julgamento, como fazer pitch |
| 053–058 | almoço, cronograma, QR de mentoria |
| 059–068 | jardim interno do prédio, painel de escalonamento |
| 069–075 | dia 2: pitch Team 114 Link Trial / NeuroDynamics, votação da plateia |

## Outros arquivos da pasta

- `videos/` — 7 MP4 H.264 8-bit + AAC que já estavam prontos (`VIDEO_01..07`)
- `pdf/` — os 2 PDFs gerados antes (53 e 22 páginas), se preferir subir o dia inteiro como 1 fonte
- `extras/` — a foto do slide escuro com gamma corrigido
- `_normalizacao.json` — mapa nome novo → original, data/hora, dimensão e tamanho
- `ocr_fotos.json` — OCR completo de cada uma das 75 imagens, metadados, transcrições e índice invertido
- `INDICE_FOTOS.md` — índice pesquisável por categoria, palavra-chave e catálogo foto a foto (`FOTO_001`..`FOTO_075`)

Os originais em `Camera/` não foram alterados.
