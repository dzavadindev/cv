#let section_heading(theme, title) = {
  set text(size: theme.sizes.section_heading, weight: 700)
  block(below: theme.spacing.heading_below)[#title]
}

#let sidebar_heading(theme, title) = {
  set text(size: theme.sizes.sidebar_heading, weight: 700)
  block(below: 6pt)[#upper(title)]
}

#let linked_text(url, body) = link(url, underline(
  offset: 1.5pt,
  stroke: 0.5pt,
  evade: false,
  body,
))

#let skills_section(theme, skills, limited_skills) = {
  sidebar_heading(theme, "Skills")
  set par(leading: theme.spacing.body_leading)
  skills.map(skill => if limited_skills.contains(skill) {
    emph(skill)
  } else {
    skill
  }).join(", ")
  if limited_skills.len() > 0 {
    block(above: 4pt)[
      #set text(size: theme.sizes.note, style: "italic", fill: theme.colors.muted)
      Italic indicates introductory experience.
    ]
  }
}

#let language_meter(theme, rating) = {
  grid(
    columns: (1fr, 1fr, 1fr, 1fr, 1fr),
    gutter: 5pt,
    ..range(5).map(i => rect(
      width: 100%,
      height: 3pt,
      fill: if i < rating { theme.colors.text } else { theme.colors.meter_empty },
    )),
  )
}

#let languages_section(theme, languages) = {
  sidebar_heading(theme, "Languages")
  for language in languages {
    block(below: 3pt)[#language.name (#language.level)]
    language_meter(theme, language.rating)
    v(7pt)
  }
}

#let experience_entry(theme, entry) = {
  set par(leading: theme.spacing.compact_leading)
  block(below: 4pt)[
    #set text(weight: 700)
    #entry.role, #entry.company, #entry.location
  ]
  block(below: 4pt)[#entry.date]
  set list(indent: 16pt, body-indent: 4pt, spacing: 3pt)
  list(..entry.bullets)
}

#let experience_section(theme, entries) = {
  section_heading(theme, "Work Experience")
  for (index, entry) in entries.enumerate() {
    experience_entry(theme, entry)
    if index < entries.len() - 1 { v(theme.spacing.entry_gap) }
  }
}

#let project_entry(theme, project) = {
  let project_title = if project.url == none {
    project.name
  } else {
    linked_text(project.url, project.name)
  }

  set par(leading: theme.spacing.compact_leading)
  block(below: 3pt)[
    #set text(weight: 700)
    #project_title
  ]
  block(below: 3pt)[
    #set text(size: theme.sizes.meta, style: "italic", fill: theme.colors.muted)
    #project.meta
  ]
  project.description
}

#let projects_section(theme, projects) = {
  section_heading(theme, "Projects")
  for (index, project) in projects.enumerate() {
    project_entry(theme, project)
    if index < projects.len() - 1 { v(theme.spacing.project_gap) }
  }
}

#let education_section(theme, education) = {
  section_heading(theme, "Education")
  set par(leading: theme.spacing.compact_leading)
  block(below: 4pt)[
    #set text(weight: 700)
    #education.school, #education.degree, #education.location
  ]
  education.date
}
