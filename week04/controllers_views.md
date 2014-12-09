footer: © Citronella Software Ltd 2015
slidenumbers: true

# Controllers & Views
## Mike Calvo
### mike@citronellasoftware.com

---
# Introduction to MVC Architecture
- Model: data specific to your system
- View: how your system is presented to the outside (UI or API)
- Controller: handles user interaction and external requests

---
# Servlets: The Original Controller
- Java specification for HTTP request processing (1997)
- Defined a web server component model for Java
- Servlet: component responsible for receiving an HTTP request and generating an HTTP response
- Lifecycle managed by the Java web server
- Tomcat was one of the first complete implementations

---
# Java Web History Since
- Abstraction layers on top of Servlets
- JavaServerPages (JSP) - servlets in the form of HTML templates
- Struts, JSF, SpringMVC
- People couldn't find the silver bullet

---
# Ruby on Rails
- In December 2005 version 1.0 released
- Based on a dynamic programming language: Ruby
- Favored convention over configuration
- Built around the DRY principle
- Huge productivity gains were observed

---
# Why Was Rails Faster?
- Project structure standard, generated, and consistent
- Dynamic language better at dealing with string-based HTML
- Less verbose configuration and code
  - Pick reasonable defaults
- Solved a specific problem that was very common

---
# Some in Java Took Note
- Grails 1.0 released in February 2008
- Based on JVM language Groovy
- Based on Spring and Hibernate
- Followed patterns popularized by Ruby on Rails

---
# Controllers
- Control the flow of a web application
- Handle inbound HTTP requests
- Decides what happens next
  - Execute another action
  - Renders a view page
  - Directly rener a response

---
# Controller Autowiring
- Like domain classes, controllers are provided many things automatically
- request: The inbound HTTP request being handled
- response: The outbound HTTP response
- session: An HTTP session for the current user
- services: Transactional logic for your application

---
# Controllers Done Easy: Scaffolding
- Automatically create CRUD UI for a domain class
- Not designed to be used as a production UI
- Good way to get started
- Dynamic and static options

---
# Dynamic Scaffolding
- Pages and action methods created at runtime
- No actual source exists
- Simply add the following line to a controller:
`static scaffold = true`

---
# Dynamic Scaffolding Provides
- List Page: paged, sortable table showing all instances
- Detail Page: create, edit, detail and update page
- Dynamically updates UI based on domain changes

---
# Static Scaffolding
- Generate the views and controller code for CRUD functionality
- Good way to learn how Grails works and a starting point for your own UI
- Produce static Scaffolding:
`./grailsw generate-all <domain-class>`

---
# Static Scaffolding: What's Generated?
- A controller with all crud action methods
  - show, create, save, edit, update and delete
- A collection of view files for create, edit, list and show

---
# Scaffolding: Not For Production!
- Scaffolding is a great way to get something up and running quickly
- Scaffolding is a great way to learn about Grails
- Scaffolding can help you get motivated by quick progress
- Scaffolding is an OK option for admin screens
- Once you become comfortable with Grails you'll develop better practices than those shown in scaffolding

---
# Real Programmers: Hand Code Controllers

---
# Controller Conventions
- All controllers live in grails-app/controllers
- Controllers are named consistently: <ControllerName>Controller
  `eg: ArtistController`
- Default convention for URL-to-controller mapping is
  `/controller/action/id`

---
# Crazy Simple Controller
```
class ArtistController {

  // Maps to /artist/get/id
  def get() {
    def artist = Artist.get(params.id)
    if (!artist) {
      response.sendError(404)
    } else {
      [ artist: artist ]
    }
  }
}
```

---
# Controller Unit Tests
- Let's look at a unit test for this simple controller
- Use @TestFor to tell Grails this is testing a controller
- Use @Mock to mock out domain interactions

---
# Adding a View
- The controller is simply performing a lookup and returning a model object
- The view is how the end customer will see the response
- If no view is rendered by action, Grails will look for a view by convention
  `grails-app/views/controller-name/action-name.gsp`

---
# GSP - Groovy Server Page
- View templates which combine code with Markup
- Rendered into final markup *on the server*
- Model objects returned by controller are available to code in the GSP

---
# Crazy Simple GSP
```html
<html>
<body>
Details for <span id="name">${artist.name}</span>
<div id="id">Id: ${artist.id}</div>
</body>
</html>
```

---
# Functional Tests
- Testing the view requires an end-to-end style approach
- Functional tests perform this verification
  - Server is running
  - Test issues an HTTP request
  - Verifies the results against actual HTML and JavaScript runner

---
# Grails Functional Tests
- Several plugins exist
- Example: Geb Plugin
  - Geb is a Groovy-based browser testing framework
  - Wrapper over Selenium
  - Multiple web drivers exist (Chrome, Firefox, PhantomJS)

---
# Installing Geb Plugin
- Add Geb plugins block of BuildConfig.groovy
- Add Selenium and PhantomJS Test Driver to dependencies block
- Add Geb spock support to dependencies block
- Add Remote Control plugin for sending remote Grails commands to app

---
# BuildConfig.groovy
```
plugins{
  test "org.grails.plugins:geb:0.10.0"
}

dependencies {
  test "org.gebish:geb-spock:0.10.0"
  test "org.seleniumhq.selenium:selenium-support:2.44.0"
  test("com.github.detro.ghostdriver:phantomjsdriver:1.0.1") {
    transitive = false
  }
  compile ":remote-control:1.5"
}
```
---
# More Geb Details
- Functional tests live under test/functional
- Geb works with both JUnit and Spock
- Geb tests are running outside the Grails app
  - Cannot directly use GORM, Controllers, or Services
- Provides jQuery style element lookup within Groovy

---
# Remote Control Plugin
- Allows a external process to send commands to Grails app
- Pass closures to RemoteControl instance:
  ```
  def remote = RemoteControl()
  def count = remote {
    // This will get run inside Grails server and returned to test!
    return Arist.count()
  }
  ```
---
# Adding a Geb Test
- Geb uses a page-based approach to web testing
- Each url gets its own Page class which defines the url and interesting elements
- The Geb test navigates to the page and verifies the results and interacts with the page
- Pages typically live in a pages package under the test package

---
# Exmaple Get Artist Page
```
import geb.Page

class ArtistGetPage extends Page {

  static url = 'artist/get'

  static content = {
    id { $("#id") }
    name { $("#name") }
  }

}
```

---
# Example Geb Functional Test
```
class ArtistFunctionalSpec extends GebSpec {

  // setup code...

  def "gets artist details"() {
    when:
    to ArtistGetPage, id: artistId

    then:
    name.text() == 'U2'
    id.text() == "Id: ${artistId}"
  }
}
```

---
# Configuring Geb
- Geb needs to know which test drivers to use
- Create a file called GebConfig.groovy in the root of tests/functional
- Define one or more configurations
  - Type of drivers
  - Browser size, behaviors, etc

---
# Simple GebConfig.groovy
```
import org.openqa.selenium.phantomjs.PhantomJSDriver
import org.openqa.selenium.remote.DesiredCapabilities

driver = {
  new PhantomJSDriver(new DesiredCapabilities())
  }
```

---
# Running Functional Tests
`grailsw test-app -functional`
- Launches the grails app first
- Runs all tests in tests/functional

---
# More on Geb
- Interact with JavaScript
- Interact with HTML form elements
- Test file downloading
- Much more:
http://www.gebish.org/manual/current/index.html

---
# Controllers Deep Dive
- Much more to learn about controllers
- Interacting with the request and parameters
- Various scopes
- Redirecting
- Direct Rendering

---
# GSP Deep Dive
- Scriptlets
- Expressions
- Custom Tags
- Templates
