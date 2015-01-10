footer: © Citronella Software Ltd 2015
slidenumbers: true

# Web and Grails Security
## Mike Calvo
### mike@citronellasoftware.com

---
# Disclaimers
- I am not an expert
- There's an entire course on this topic
- It's super important

---
# Price of Success
## If your web app is successful - it will be attacked

---
# Forms of Attack
- Denial of service: overload the system to bring it down
- Code injection
  - Submit data to server in a way that it will unknowingly be run
  - Various forms: SQL injection, Cross Site Scripting
- Gaining unauthorized access to sensitive data

---
# Grails Provides Help
- Access to database is scraped to prevent SQL injection attacks
- Default scaffolding HTML escapes all data fields before display
- Tags producing links escapes markup to prevent code injection
- Standard codecs for rendering of escaped data directly from controllers
- Command objects allow constrained form submission of data

---
# Useful Strategies
- Input validation
- Access control
- Parameterized domain queries

---
# Validate User Input
- Never allow limitless queries of data
  - This can result in a denial of service attack
- Patterns:
  - Manually check request parameters and cap at a default

---
# Parameterized Domain Queries

___
# Cross Site Scripting Prevention

---
# Authentication

---
# Spring Security Plugins
