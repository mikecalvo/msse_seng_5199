footer: © Citronella Software Ltd 2016
slidenumbers: true

# Tools
## Mike Calvo
### mike@citronellasoftware.com

---

# Overview
- Java
- Groovy
- Gradle
- Spring
- IDE
- Source Code Control

---

# Java SDK
- Groovy is a JVM (Java Virtual Machine) language
- Java SDK required
- Download available from Oracle
- Look for Java SE Downloads
- Be sure to set your JAVA_HOME environment variable
- Add $JAVA_HOME/bin to your path

^ Google Java SE Downloads and show them the links

---

# sdkman
- [http://sdkman.io/](http://sdkman.io/)
- Helps manage version of sdk and dev tools
  - Groovy
  - Gradle
  - Spring
- Install sdkman on Mac/Linux:
  `$ curl -s http://get.sdkman.io | bash`

---

# Install Groovy and Spring
- Install Groovy, Gradle and Spring:
  `$ sdk install groovy`
  `$ sdk install gradle`
  `$ sdk install springboot`
- Confirm:
  `$ sdk current`
  `$ groovy -version`
  `$ gradle -version`
  `$ spring --version`

---

# Groovy
- Groovy Console
- Handy interactive debugging tool
`$ groovyConsole`

---

# Gradle
- Open source build system
- Build file written in Groovy
- Based on concepts from earlier build tools
  - Ant and Maven
- Has become de facto build system for JVM projects

---

# Gradle Functions
- Dependency management
- Plugin model
- Core tasks for typical build steps
    - Compile
    - Copy and transform files
    - Run tests
    - Create Archives

---

# SpringBoot CLI
- Use the SpringBoot CLI to:
- Create a new project
- Build your project

---

# IDE Options
- Strongly recommend IntelliJ IDEA
- Best Java and Groovy support
- Normally $249 developer license
- Free license
[https://www.jetbrains.com/estore/students/academic](https://www.jetbrains.com/estore/students/academic)

---

# Other options
- SpringSource Tool Suite (Eclipse)
- Net Beans
- Plain 'Ol Text Editor
- Atom
- Sublime
- TextMate

---

# Source Code Control
- Working in a team you will need to share code with each other
- This course requires submission of projections using Git
- Installing Git
- Mac: Install Xcode Command Line Tools
- Windows: Download Windows Git installer
- Linux: `$ yum install git`

---

# Git Tools
- Command line
- IntelliJ
- Tower (Mac)
- SourceTree (Mac/Windows)

---

# Git Recommendations
- Get comfortable with the command line
- Commit often
- Work in branches
- Tag your releases/submissions

---

# Free Git Hosting Options
- GitHub
- Bitbucket
- CloudForge
- Assembla
- Kiln
- code.google.com

---

# Recommendations for this week
1. Get your local development environment setup today
2. Select your git host and create a project
