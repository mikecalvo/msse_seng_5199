footer: © Citronella Software Ltd 2015
slidenumbers: true

# Node.js
## Mike Calvo
## mike@citronellasoftware.com

---

# Node.Js
- Platform based on Chrome's JS Runtime
- Write JavaScript code as applications (outside browser)
- Examples: server code and build tools

---

# Installing Node
- [http://nodejs.org/download/](http://nodejs.org/download/)
- Installers for Mac/Windows/Linux
- Confirm at command line: `node --version`

---

# Interactive Console
- Type `node` at command line
- Interactive JavaScript console
- Good for testing simple syntax, etc.

---

# Node Package Manager (NPM)
- Node supports a package model for installing utilities and Node-based tools
- Part of node installation
- Usage: `npm install <package_name>`
- Global versus Local installation
  - Global: added to system
  - Local: creates a directory called node_modules in current directory

---

# Package
- Node module
- Directory with one or more files
- package.json file: list dependencies
- See all packages at [npmjs.com](http://www.npmjs.com)

---

# package.json
- Define which node modules you depend on
- Initialize the file:
  `npm init -f`
- When installing packages:
  `npm install bower --save`

---

# Example package.json file

``` javascript

"dependencies": {
    "lodash": "^2.4.1",
    "tap": "*"
}

```
---

# Bower
- Node-based package manager for web projects
- Manages external JavaScript and CSS dependencies
- Installing Bower:
  - In your web-app folder: `npm install bower`
