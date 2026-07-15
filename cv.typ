#import "src/cv/data.typ": person, profile_paragraphs, contacts, languages, skill_groups, experience, projects, education
#import "src/cv/sections.typ": paragraph_section, contact_section, language_section, skill_section, entry_section, section_separator
#import "src/cv/theme.typ": cv_theme

// The page shell lives here so the file reads top-down like the final document.
// Lower-level reusable rendering helpers still live in the section module.
#let resume_page(theme, person, sidebar, body) = {
  // This small offset compensates for page bleed so background blocks align cleanly.
  let margin_rectified = theme.spacing.page_margin + theme.layout.bleed_fix

  // Global page defaults for the whole document.
  set page(margin: theme.spacing.page_margin)
  set text(size: theme.sizes.body, font: theme.fonts.body)

  // Sidebar background: draw a full-height rectangle behind the left column.
  place(left, dx: -margin_rectified)[#rect(
      fill: theme.colors.sidebar_background,
      width: (
        theme.layout.sidebar_ratio
          + theme.spacing.page_margin
          + theme.layout.bleed_fix
          + theme.spacing.column_inset
      ),
      height: (100% + margin_rectified),
    )]

  // Header is built separately so we can measure it and paint a matching background.
  let header_grid = {
    set text(fill: theme.colors.header_text)
    set par(spacing: 0pt, justify: true)

    grid(
      columns: (1fr, auto),
      align: horizon,
      gutter: theme.spacing.page_margin,
      [
        #align(horizon)[
          #set text(
            size: theme.sizes.header_name,
            weight: 900,
            fill: theme.colors.header_text,
            font: theme.fonts.heading,
          )
          #person.name

          #v(theme.spacing.header_gap)

          #set text(size: theme.sizes.header_subtitle, font: theme.fonts.body, style: "italic")
          #person.subtitle
        ]
      ],
      [
        #box(
          width: theme.sizes.avatar,
          height: theme.sizes.avatar,
          radius: 50%,
          stroke: 4pt + theme.colors.header_text,
          clip: true,
        )[
          #image(
            person.avatar,
            width: 100%,
            height: 100%,
            fit: "cover",
          )
        ]
      ],
    )
  }

  // Measure the header before painting the colored band behind it.
  layout(size => {
    let grid_size = measure(block(width: size.width, header_grid))

    place(top, dx: -margin_rectified, dy: -margin_rectified)[
      #rect(
        fill: theme.colors.main,
        height: grid_size.height + margin_rectified + 1em,
        width: size.width + 2 * margin_rectified,
      )
    ]

    header_grid
  })

  v(theme.spacing.header_gap)

  // Main document body: sidebar on the left, content on the right.
  grid(
    columns: (theme.layout.sidebar_ratio, 1fr),
    align: top,
    gutter: 2 * theme.spacing.column_inset,
    [#sidebar],
    [#body],
  )
}

// Sidebar content is assembled from small reusable section renderers.
#let sidebar = [
  #paragraph_section(cv_theme, "Profile", profile_paragraphs)
  #v(cv_theme.spacing.block_gap)
  #contact_section(cv_theme, contacts)
  #v(cv_theme.spacing.block_gap)
  #language_section(cv_theme, languages)
  #v(cv_theme.spacing.block_gap)
  #skill_section(cv_theme, skill_groups)
]

// The final body is just the ordered content that appears in the main column.
#resume_page(cv_theme, person, sidebar)[
  #entry_section(cv_theme, "Professional Experience", experience)
  #section_separator(cv_theme)
  #entry_section(cv_theme, "Projects", projects)
  #section_separator(cv_theme)
  #entry_section(cv_theme, "Education", education)
]
