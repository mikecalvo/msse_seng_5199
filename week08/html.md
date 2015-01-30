footer: © Citronella Software Ltd 2015
slidenumbers: true
# HTML, CSS, JavaScript
## Mike Calvo
## mike@citronellasoftware.com

---

# HTML
- You know it, you love it
- Document markup language
- Defines:
  - Document Structure
  - Linking
  - Layout
  - Formatting
  - User Input

---

# XML Syntax
- Element: `<p id="description">My Paragraph</p>`
- Tag: p
- Attribute: id

---

# Basic Document Structure

```
<!DOCTYPE html>
<html>
  <head>
    <!-- This is a comment -->
    <!-- The stuff in the head is meta data -->
  </head>
  <body>
    <!-- Stuff you want to display has to go here -->
  </body>
</html>
```

---

# HTML Document Structure Elements
- p: Paragraph
- div: Division Block (container of containers)
- span: Inline Text

---

# HTML Escaping
- Characters used to define HTML need to be escaped
- < `&lt;`
- > `&gt;`
- & `&amp;`
- : `&quot;`
- Generically: `&#ascii_code;`

---
# HTML Forms: User Input
- Elements that render UI controls
- INPUT tag: text fields, text areas, checkbox
- SELECT tag: dropdown
- BUTTON tag: buttons, radios
- FORM tag: bundles inputs and defines POST/PUT

---

# HTML Rendering Engines
- Implementations of the HTML Specification
- Webkit - Apple (Safari, Chrome < 28)
- Blink - Google (Chome > 28)
- Gecko - Mozilla (Firefox)
- Trident - Microsoft (IE)

---

# HTML 5
- Big additions to HTML
- Media Support (movie and audio)
- Direct Render 2D Graphics (canvas)
- Dynamic Functionality (dialog and details)
- Structure (header, footer, main, section)

---

# HTML 5 Support
- Great features
- Not available on older browsers (mainly IE 8 and below)
- Can impact internal apps
  - Corporate IT likes to standardize on stable (nee old) browsers

---

# HTML Tables
- Organize table-driven data
- TABLE element contains:
  - Heading: THEAD
  - Body: TBODY
- Heading and Body contains Rows: TR
- Rows contain Data: TD (columns)

---

# When To Use Tables
- Tables have come in and out of fashion
- Tables are great for tabular data
- Tables should be avoided for general layout purposes

---

# HTML Formatting
- Styling tags:
  - B (bold), I (italic), U (underline), CENTER
- Old remnants of bygone era
- Styling and formatting (other than tables) should be done with CSS

---

# CSS
- Cascading style sheets
- Declarative styling of HTML
- Based on selectors
  - 'Selecting' the elements the style applies to
- Vast array of styling features

---

# Stylesheet
- A file containing styling directions
- Series of selectors and corresponding style declarations
- Each declaration is a collection of property, value pairs

---
# Example Stylesheet

``` css
div: {
  color: black;
}
```

---

# CSS Selectors
- by tag: just the tag name
- by id: `#idValue`
- by class: .className (class attribute)

---

# Class attribute
- Applies CSS style classes to element
- Single value or space-separated list

---

# Decendent Selectors
- CSS supports specifying nesting of selectors
- Seperate selector components with spaces
- Example: 'all paragraphs with class error within a div':
  `div p .error { ... }`

---

# More Specific Decendents
- `div + p` => The first p within each div
- `div > p` => All direct p children of each div
- `div ~ p` => The first p anywhere below each div

- To be even more specific add a + between selectors to indicate the selctors must be adjacent

---

# Attribute Selectors
- Has an attribute: `a[src]`
- Has an attribute with specific value: `a[title="main"]`
- Has an attribute containing: `a[href*="php"]`
- Has an attribute starting with: `a[href^="http"]`
- Has an attribute with regex match: `a[href$="http"]`
- Has an attribute with a list of values that contains: `a[class~="cool"]`

---

# Pseudo selectors
- Special qualifications that apply styles based on behaviors
  - Append a ':' to the selector followed by name
- Pseudo elements: qualify specifics about children
  - Append a '::' to the selector by name

---
# Pseudo Examples
- checked (`option:checked { color: red; }`)
- hover (`.info:hover { font-weight: bold; }`)
- visited and link
- before and after
- not (`div:(#container) { color: 'blue'; }`)

---
# More Pseudo Examples
- first-child
- last-child
- nth-child(n)
- nth-last-child(n)
- nth-of-type(n) : only grab elements matching type before :

---

# Pseudo Element Examples
- first-line (p::first-line)
- first-letter (p::first-letter { font-family:cursive; })

---
# Non-Stylesheets
- CSS can appear in other places
- Internal style elements within HTML
- Every HTML element has a style attribute for inline style

---

# Cascade?
- Styles applied in priority order
- Least-specific to most-specific
- Furthest from element to closest
  - Browser: External Stylesheet : Internal Style : Inline
