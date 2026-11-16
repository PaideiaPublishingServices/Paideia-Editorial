# ISBN — Editar, publicar y financiar ciencia en América Latina

Estado al 16/11/2026: **obra cerrada** (publicación continua 22/07/2025 → cierre 16/11/2026).

| Versión | ISBN | Estado |
|---------|------|--------|
| HTML (online) | 978-631-92189-0-9 | Otorgado (archivos `9786319218909.*`) |
| PDF (descarga) | 978-631-92189-1-6 | Otorgado (archivos `9786319218916.*`) |

Los archivos `.txt`/`.rtf` de la Agencia vienen en Latin-1. Transcripción en UTF-8 de la ficha CIP (HTML; la del PDF es igual salvo "Libro digital, PDF", "Archivo Digital: descarga" e "ISBN 978-631-92189-1-6"):

```
Pantaleo, Patricio Iván
   Editar, publicar y financiar ciencia en América Latina : perspectivas, experiencias y distopías en las dinámicas de la comunicación científica en la región / Patricio Iván Pantaleo ; Gimena del Río Riande. - 1a ed. - General Levalle : Paideia Editorial, 2026.
   Libro digital, HTML

   Archivo Digital: online
   ISBN 978-631-92189-0-9

   1. Comunicación Científica. 2. Edición de Publicaciones Científicas. 3. Publicaciones Científicas. I. del Río Riande, Gimena II. Título
   CDD 070.572
```

Criterios de cierre:

- Año de la obra: **2026** (cierre, 1a ed.). Los DOI y las fechas de publicación en Crossref se mantienen en 2025 (inicio de la publicación continua).
- Formatos: PDF y HTML. Se quitó el ePUB. La obra no lleva introducción (`index.qmd` es solo la presentación web; `solo-html.lua` la quita del PDF).
- Nombre: "del Rio Riande" sin tilde en todo, como en ORCID. La ficha CIP se transcribe tal cual fue otorgada ("del Río").

## Dónde está cargado

- `pie-imprenta.tex`: macros `\isbnhtml`, `\isbnpdf`, `\fechacierre`; ficha CIP de la versión PDF; historial con el cierre. Sin marca de agua.
- `header.tex`: portada interior sin el recuadro ni la marca de agua de "Publicación continua"; dice "Primera edición, 2026".
- `header.html`: `citation_isbn`; `date_stamp` de Crossmark = 2026-11-16.
- `_quarto.yml`: `citation.isbn`, edición, lugar y año.
- `doi.xml`: depósito de cierre preparado (ISBN HTML y PDF, `edition_number`, `publisher_place`, subtítulo, Crossmark "Obra cerrada"). **Todavía no depositado.**

## Pasos finales (ISBN PDF ya cargado, 16/11/2026)

1. `quarto render` → subir `_book/` al sitio.
2. Depositar `doi.xml` en Crossref (incluye ambos ISBN y Crossmark "Obra cerrada").
3. Verificar en `https://api.crossref.org/works/10.62059/editorial.l001` (campos `ISBN`, `assertion`).
