#let person = (
  name: "Daniil Zavadin",
  location: "Apeldoorn, 7311LA, Netherlands",
  phone: "+31644315181",
  email: "daniil.zavadin@gmail.com",
  linkedin: "https://www.linkedin.com/daniil-zavadin",
  github: "https://github.com/dzavadindev",
  avatar: "../../assets/avatar.jpg",
)

#let languages = (
  (name: "English", level: "Fluent", rating: 5),
  (name: "Ukrainian", level: "Fluent", rating: 5),
  (name: "Dutch", level: "A1", rating: 2),
)

// Wording and dates are shared verbatim by every variant. Only the order is
// changed so that the most recent role appears first.
#let experience = (
  (
    role: "Software Engineer Intern",
    company: "Demcon LS&H",
    location: "Enschede, Netherlands",
    date: "04/2026 – 10/2026",
    bullets: (
      [Collaborated on a Needle Positioning System (NPS), a robotic navigational assistance technology designed for guiding surgeons during liver ablation operations.],
      [Migrated the system from an outdated framework to Avalonia UI],
      [Redesigned and re-implemented the system's software from ground up, enhancing the application's response time, architectural structure, maintainability, and testability.],
    ),
  ),
  (
    role: "Software Engineer Intern",
    company: "Everbridge one2many",
    location: "Deventer, Netherlands",
    date: "09/2024 – 01/2025",
    bullets: (
      [Progressed the initiative to integrate a LoRa water level sensor into a Physical Security Information Management (PSIM) product.],
      [Engineered a prototype interface enabling communication between the product and sensors, facilitating operator alerts within the PSIM system and allowing for the forwarding of these alerts to a public warning system that disseminates threat information through various channels.],
    ),
  ),
)

#let education = (
  school: "Saxion University of Applied Sciences",
  degree: "Bachelor, Information and Communication Technologies",
  location: "Deventer, Netherlands",
  date: "09/2022 – 09/2026",
)

#let summary = [Curious and collaborative software engineer who enjoys turning ideas into useful software. Hands-on experience with complex systems and agile teams, designing maintainable and performant solutions across desktop, backend, infrastructure, and embedded development. Broad technical interests help me communicate across disciplines, understand how systems fit together, and contribute practical, reliable software.]

#let embedded = (
  summary: summary,
  skills: (
    "C", "C++", "Rust", "STM32", "ESP32", "Zephyr RTOS",
    "Sensors", "UART", "RS-485", "SPI", "BLE",
    "LoRaWAN", "nRF24", "Linux", "Git", "GitLab CI/CD",
  ),
  limited_skills: ("Zephyr RTOS",),
  projects: (
    (
      name: "Heart Mockloop Monitoring System",
      url: none,
      meta: "Private team project · C++, STM32, UART, sensors",
      description: [Collaborated on a lower-cost monitoring and control prototype for an artificial-heart mock loop; implemented STM32 pressure and flow acquisition and contributed framed UART telemetry used by the host software.],
    ),
    (
      name: "nRF24 Wireless Reliability Study",
      url: none,
      meta: "Private team project · C++, STM32, nRF24L01+",
      description: [More of an academic project. Built synchronized transmitter/receiver firmware and repeatable experiments measuring packet error rate and application throughput across channels, data rates, power levels, and retry settings.],
    ),
    (
      name: "UART Control Protocol",
      url: "https://github.com/dzavadindev/uart-over-rs485-protocol",
      meta: "Embedded Rust · STM32F3",
      description: [A protocol study. Implemented a framed UART command protocol between a Linux client and #raw("no_std") STM32 firmware, using non-blocking reads to control LED timing and reset behavior.],
    ),
  ),
)

#let software_web = (
  summary: summary,
  skills: (
    "TypeScript", "JavaScript", "C#", "Python", "SQL", "React",
    "Tailwind CSS", "Node.js", "REST APIs",
    "Web Bluetooth", ".NET", "Avalonia UI", "PostgreSQL", "SQLite", "Docker",
    "Git", "GitLab CI/CD", "GitHub Actions",
  ),
  limited_skills: (),
  projects: (
    (
      name: "Heart Mockloop Monitoring System",
      url: none,
      meta: "Private team project · React, TypeScript, SSE, STM32",
      description: [Contributed to an end-to-end monitoring system that streams pressure and flow telemetry from STM32 hardware to a React dashboard; integrated and corrected real-time chart data and timestamp processing.],
    ),
    (
      name: "BLE StairLight",
      url: none,
      meta: "Private team project · React, TypeScript, Web Bluetooth, ESP32",
      description: [Built Web Bluetooth controls for colour, brightness, and live LED-range status, and contributed to integrating custom ESP32 GATT services with mmWave-driven lighting.],
    ),
  ),
)

#let general = (
  summary: summary,
  skills: (
    "Rust", "C#", "TypeScript", "C", "C++", "Linux", "GTK4", "Wayland",
    "Qt/QML", "Avalonia UI", "Bash", "Git", "Docker", "GitHub Actions", "GitLab CI/CD",
    "Application Architecture", "API Design", "Problem Solving", "Critical Thinking", "Collaboration"
  ),
  limited_skills: (),
  projects: (
    (
      name: "Dionysus",
      url: "https://github.com/dzavadindev/dionysus",
      meta: "Rust · GTK4 · Wayland",
      description: [Built an application launcher with desktop-entry discovery, background fuzzy search ranked by launch frequency, keyboard navigation, and XDG state persistence.],
    ),
    (
      name: "DBDM",
      url: "https://github.com/dzavadindev/dbdm",
      meta: "Rust · Linux CLI",
      description: [Created a CLI that reconciles declarative dotfile links, previews conflicts, supports safe backup and replacement workflows, and is covered by filesystem integration tests.],
    ),
    (
      name: "Zagreus",
      url: "https://github.com/dzavadindev/zagreus",
      meta: "QML · Wayland · Quickshell",
      description: [Designed a modular desktop shell with reusable UI surfaces, overlay composition, and services for audio, notifications, workspaces, power, and wallpaper state.],
    ),
  ),
)

#let common = (
  person: person,
  languages: languages,
  experience: experience,
  education: education,
)

#let embedded = common + embedded
#let software_web = common + software_web
#let general = common + general
