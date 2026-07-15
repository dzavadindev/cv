#import "icons.typ": icon

// Sidebar blocks share a consistent title treatment and spacing.
#let sidebar_title(theme, title) = {
  set par(spacing: theme.spacing.sidebar_title_gap)
  text(font: theme.fonts.heading, size: theme.sizes.sidebar_heading, weight: 700)[~#title]
  rect(radius: 100%, width: 100%, height: 1.5pt, fill: theme.colors.body_text)
  v(theme.spacing.sidebar_title_offset)
}

// Wrap a sidebar section with its title and body font.
#let sidebar_section(theme, title, body) = {
  set text(font: theme.fonts.sidebar)
  sidebar_title(theme, title)
  v(theme.spacing.sidebar_body_gap)
  body
}

// Profile text is just a sequence of paragraphs with justified layout.
#let paragraph_section(theme, title, paragraphs) = {
  sidebar_section(theme, title, {
    set par(justify: true, spacing: theme.spacing.paragraph_gap)

    for paragraph in paragraphs {
      paragraph
      parbreak()
    }
  })
}

// Contact rows optionally become links when a target is provided.
#let contact_section(theme, items, title: "Contact") = {
  sidebar_section(theme, title, {
    set par(spacing: theme.spacing.contact_gap)

    for item in items {
      let row = [
        #icon(theme, item.icon, family: item.icon_family, fill: theme.colors.main)
        #h(0.5em)
        #item.text
      ]

      if item.link != none {
        link(item.link, row)
      } else {
        row
      }

      parbreak()
    }
  })
}

// Languages are rendered as simple label + level lines.
#let language_section(theme, items, title: "Languages") = {
  sidebar_section(theme, title, {
    for item in items {
      item.name + " (" + item.level + ")"
      parbreak()
    }
  })
}

// Skill groups are compact summaries: category name plus comma-separated items.
#let skill_section(theme, groups, title: "Skills & Knowledge") = {
  sidebar_section(theme, title, {
    for group in groups {
      strong(group.title + ": ")
      group.items.join(", ")
      parbreak()
      parbreak()
    }
  })
}

// Main-column section heading.
#let section_heading(theme, title) = {
  set par(spacing: theme.spacing.entry_gap)
  text(font: theme.fonts.heading, size: theme.sizes.section_heading, weight: 800)[~#title]
}

// Thin visual divider between major resume sections.
#let section_separator(theme) = {
  v(theme.spacing.section_separator_gap)
  rect(width: 100%, height: 0.8pt, fill: luma(70%))
  v(theme.spacing.section_separator_gap)
}

// Typst list() wants content items, so each bullet is wrapped into a content block.
#let bullet_list(items) = list(..items.map(item => [#item]))

// One resume entry: title, date rail, subtitle, and optional bullet list.
#let resume_entry(theme, item) = {
  set par(spacing: theme.spacing.entry_gap)
  grid(
    columns: (auto, 1fr, auto),
    row-gutter: theme.spacing.entry_gap,
    column-gutter: 0.55em,
    [
      #set text(size: 1em, weight: 700)
      #item.title
    ],
    grid.cell(rowspan: 2)[
      #box(width: 100%)[
        #rect(width: 100%, height: 0.65pt, fill: luma(72%))
      ]
    ],
    grid.cell(rowspan: 2)[
      *#item.date*
    ],
    grid.cell()[#emph()[#item.subtitle]],
    [],
  )

  v(theme.spacing.entry_component_gap)

  if item.bullets.len() > 0 {
    bullet_list(item.bullets)
    v(theme.spacing.entry_component_gap)
  }
}

// A section is just a heading followed by repeated resume entries.
#let entry_section(theme, title, items) = {
  section_heading(theme, title)
  v(theme.spacing.entry_component_gap)

  for item in items {
    resume_entry(theme, item)
    v(theme.spacing.section_gap)
  }
}
