local function ensureHtmlDeps()
  quarto.doc.add_html_dependency({
    name = 'fontawesome6',
    version = '1.2.0',
    scripts = {"assets/all.min.js"}
  })
end

local function isEmpty(s)
  return s == nil or s == ''
end

local function renderFa(args, kwargs)
  -- Extract the icon name (required)
  local icon = pandoc.utils.stringify(args[1])
  if isEmpty(icon) then
    error("Font Awesome icon must be specified.")
  end

  -- Process optional title and label attributes
  local title = pandoc.utils.stringify(kwargs["title"])
  title = not isEmpty(title) and string.format(' title="%s"', title) or ""

  local label = pandoc.utils.stringify(kwargs["label"])
  label = isEmpty(label) and string.format(' aria-label="%s"', icon) or string.format(' aria-label="%s"', label)

  -- Process the optional group parameter; default to "solid"
  local group = pandoc.utils.stringify(kwargs["group"])
  if isEmpty(group) then group = "solid" end

  -- Process size and color parameters
  local size = pandoc.utils.stringify(kwargs["size"])
  size = not isEmpty(size) and (" fa-" .. size) or ""

  local color = pandoc.utils.stringify(kwargs["color"])
  color = not isEmpty(color) and string.format(' style="color:%s"', color) or ""

  -- Output the Font Awesome icon HTML (only for HTML formats)
  if quarto.doc.is_format("html:js") then
    ensureHtmlDeps()
    return string.format('<i class="fa fa-%s fa-%s%s"%s%s%s></i>',
      group, icon, size, title, label, color)
  else
    return ""
  end
end

return {
  -- Unordered list shortcode tags
  ["fa-ul"] = function()
    return pandoc.RawBlock('html', '<ul class="fa-ul">')
  end,
  ["/fa-ul"] = function()
    return pandoc.RawBlock('html', '</ul>')
  end,

  -- List item shortcode tags
  ["fa-li"] = function(args, kwargs)
    return pandoc.RawBlock('html', '<li><span class="fa-li">' .. renderFa(args, kwargs) .. '</span>')
  end,
  ["/fa-li"] = function()
    return pandoc.RawBlock('html', '</li>')
  end,

  -- Standalone icon shortcode
  ["fa-i"] = function(args, kwargs)
    return pandoc.RawInline('html', renderFa(args, kwargs))
  end
}
