#let person = (
  name: "DANIIL ZAVADIN",
  subtitle: [Software engineer],
  avatar: "assets/avatar.jpg",
)

#let profile_paragraphs = (
  "Bachelor ICT student at Saxion, passionate about exploring diverse areas of technology and constantly expanding my skill set.",
  "I thrive on challenges and enjoy diving into topics that are new to me, as I believe hands-on experimentation is the best way to learn.",
  "My flexible skill set allows me to adapt to various projects as a software developer.",
  "What I like most is seeing physical results to my efforts, and that is why I build personal tools and liek to tinker with some dev boards.",
  "I am eager to further develop my knowledge and gain experience in cutting-edge technologies while contributing meaningfully to impactful projects.",
)

#let contacts = (
  (
    icon: "envelope",
    icon_family: "solid",
    text: "daniil.zavadin@gmail.com",
    link: "mailto:daniil.zavadin@gmail.com",
  ),
  (
    icon: "github",
    icon_family: "brands",
    text: "@dzavadindev",
    link: none,
  ),
  (
    icon: "location-dot",
    icon_family: "solid",
    text: "Apeldoorn, Netherlands",
    link: none,
  ),
  (
    icon: "phone",
    icon_family: "solid",
    text: "+31 644 315 181",
    link: "tel:+31644315181",
  ),
  (
    icon: "graduation-cap",
    icon_family: "solid",
    text: "Bachelor ICT student",
    link: none,
  ),
)

#let languages = (
  (name: "Ukrainian", level: "Native"),
  (name: "English", level: "Fluent"),
  (name: "Dutch", level: "A2"),
)

#let skill_groups = (
  (title: "Programming languages", items: ("Rust", "Java", "C#", "C", "C++")),
  (title: "Infrastructure", items: ("Linux", "Bash", "Docker")),
  (title: "Cloud engineering", items: ("AWS", "Terraform")),
  (title: "Version control and DevOps", items: ("Git", "GitHub Actions", "GitLab CI/CD")),
  (title: "AI-assisted development", items: ("OpenCode", "Agentic development")),
  (title: "Databases", items: ("PostgreSQL", "SQLite")),
  (title: "Project management", items: ("Microsoft Planner", "Jira")),
  (title: "Soft skills", items: ("Problem Solving", "Critical Thinking", "Collaboration")),
)

#let experience = (
  (
    title: [*Software Engineer Intern*],
    date: "9/2024 - 1/2025",
    subtitle: [Everbridge one2many (Deventer, Netherlands)],
    bullets: (
      "Integrated a LoRa water level sensor into a physical security information management (PSIM) product.",
      "Built a prototype interface for communication between the product and the sensors.",
      "Enabled operator alerting inside the PSIM system and forwarding of alerts to a public warning system across multiple channels.",
    ),
  ),
  (
    title: [*Software Engineer Intern*],
    date: "4/2026 - 10/2026",
    subtitle: [Demcon Life Sciences & Health (Enschede, Netherlands)],
    bullets: (
      "Worked on the Needle Positioning System (NPS) for guiding robot assisted liver cancer ablation operations",
      "Migrated the system to a new framework, improving the architecture, data flows and responsiveness",
      "Researched medical imaging techniques and desktop app development",
    ),
  ),
)

#let projects = (
  (
    title: [*Mockloop Heart Monitoring Prototype*],
    date: "2025",
    subtitle: [IoT, embedded computers],
    bullets: (
      "Re-designing a prototype of a body area sensor network with a team.",
      "Monitoring the state of an artificial heart built as part of the Holland Hybrid Heart initiative.",
      "Focused on making the solution more affordable.",
    ),
  ),
  (
    title: [*dionysus - Application launcher for Wayland compositors*],
    date: "Ongoing",
    subtitle: [Rust, GTK4],
    bullets: (
      "Building an XDG complient layer-shell application laucher",
      "Making user interfaces, sort and search of entries, compositor input handling",
      "If no app launcher does what you want it to do, make one yourself!",
    ),
  ),
  (
    title: [*zagreus - Wayland desktop shell for Linux desktop*],
    date: "Ongoing",
    subtitle: [Quickshell, Qt QML],
    bullets: (
      "Building a custom shell for the Wayland compositors (Hyprland only now)",
      "Creating interface components for OS operations such as notifications, popups, and info docks.",
      "Using the project to better understand how the Linux desktop works under the hood.",
    ),
  ),
)

#let education = (
  (
    title: [*Bachelor Information and Communication Technologies*],
    date: "9/2022 - 9/2026",
    subtitle: [Saxion University of Applied Sciences, Deventer, Netherlands],
    bullets: (),
  ),
)
