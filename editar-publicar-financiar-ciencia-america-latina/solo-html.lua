-- Elimina del PDF los encabezados marcados con la clase .solo-html
-- (index.qmd es la página de presentación web; el libro no lleva introducción).
function Header(el)
  if el.classes:includes("solo-html") and quarto.doc.is_format("latex") then
    return {}
  end
end
