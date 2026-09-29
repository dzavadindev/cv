#import "sections.typ": section_heading, skills_section, languages_section, experience_section, projects_section, education_section, linked_text
#import "theme.typ": cv_theme

#let render_cv(data) = {
  set page(
    paper: "a4",
    margin: (
      left: cv_theme.spacing.page_x,
      right: cv_theme.spacing.page_x,
      top: cv_theme.spacing.page_top,
      bottom: cv_theme.spacing.page_bottom,
    ),
  )
  set text(
    font: cv_theme.fonts.body,
    size: cv_theme.sizes.body,
    fill: cv_theme.colors.text,
  )
  set par(leading: cv_theme.spacing.body_leading)

  block(
    width: 100%,
    height: cv_theme.spacing.header_height,
    fill: cv_theme.colors.accent,
    inset: cv_theme.spacing.header_inset,
  )[
    #set text(fill: cv_theme.colors.header_text)
    #grid(
      columns: (cv_theme.spacing.avatar, 1fr),
      gutter: cv_theme.spacing.header_gutter,
      align: horizon,
      image(
        data.person.avatar,
        width: cv_theme.spacing.avatar,
        height: cv_theme.spacing.avatar,
        fit: "cover",
      ),
      [
        #block(height: cv_theme.spacing.avatar)[
          #grid(
            rows: (auto, 1fr),
            row-gutter: 6pt,
            [
              #v(5pt)
              #set text(size: cv_theme.sizes.name, weight: 400)
              #data.person.name
            ],
            [
              #align(horizon)[
                #set par(leading: 3.5pt)
                #block(below: 6pt)[#data.person.location]
                #block(below: 6pt)[
                  #linked_text("tel:" + data.person.phone, data.person.phone),
                  #linked_text("mailto:" + data.person.email, data.person.email)
                ]
                #linked_text(data.person.linkedin, [LinkedIn]), #linked_text(data.person.github, [GitHub])
              ]
            ],
          )
        ]
      ],
    )
  ]

  v(cv_theme.spacing.after_header)

  grid(
    columns: (cv_theme.layout.sidebar_width, 1fr),
    gutter: cv_theme.spacing.column_gutter,
    align: top,
    [
      #skills_section(cv_theme, data.skills, data.limited_skills)
      #v(13pt)
      #languages_section(cv_theme, data.languages)
    ],
    [
      #section_heading(cv_theme, "Summary")
      #data.summary
      #v(cv_theme.spacing.section_gap)
      #experience_section(cv_theme, data.experience)
      #v(cv_theme.spacing.section_gap)
      #projects_section(cv_theme, data.projects)
      #v(cv_theme.spacing.section_gap)
      #education_section(cv_theme, data.education)
    ],
  )
}
