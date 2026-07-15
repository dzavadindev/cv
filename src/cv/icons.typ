#let icon_font(theme, family: "solid") = {
  if family == "brands" {
    theme.fonts.icons_brands
  } else {
    theme.fonts.icons_solid
  }
}

#let icon(theme, name, family: "solid", fill: auto) = {
  text(
    fill: fill,
    font: icon_font(theme, family: family),
    size: theme.sizes.contact_icon,
    name,
  )
}
