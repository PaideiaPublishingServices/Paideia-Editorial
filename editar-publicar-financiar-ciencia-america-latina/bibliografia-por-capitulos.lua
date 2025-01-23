function Pandoc(doc)
    local sections = {}  -- Tabla para almacenar las bibliografías por capítulos
  
    -- Iterar sobre los bloques del documento
    for i, elem in ipairs(doc.blocks) do
      if elem.t == "Header" then
        -- Si encontramos un encabezado de sección, iniciamos una nueva bibliografía
        local section_title = pandoc.utils.stringify(elem)
        sections[section_title] = {}  -- Crear una nueva tabla para las referencias del capítulo
      elseif elem.t == "Para" then
        -- Buscar referencias en los párrafos (e.g. citaciones [@cohen:jokes])
        local ref_citations = pandoc.utils.stringify(elem):match("%[%s?(@[%w:]+)%s?%]")
        if ref_citations then
          for ref in ref_citations:gmatch("%b[]") do
            local citation = ref:sub(2, -2)  -- Remover los corchetes
            -- Asignar la referencia al capítulo adecuado
            local current_section = sections[#sections]
            table.insert(current_section, citation)
          end
        end
      end
    end
  
    -- Crear bloques con las bibliografías por capítulo
    local new_blocks = {}
    local added_references_header = false  -- Variable para controlar si ya se añadió "Referencias"

    for title, refs in pairs(sections) do
      if not added_references_header then
        -- Añadir solo un encabezado de "Referencias" una vez
        table.insert(new_blocks, pandoc.Header(1, pandoc.Str("Referencias")))
        added_references_header = true  -- Marcamos que ya se añadió el encabezado
      end
      -- Agregar las referencias al bloque
      for _, ref in ipairs(refs) do
        table.insert(new_blocks, pandoc.Para(pandoc.Str(ref)))
      end
    end
  
    -- Agregar las bibliografías al final del documento
    for _, block in ipairs(new_blocks) do
      table.insert(doc.blocks, block)
    end
  
    return doc
end