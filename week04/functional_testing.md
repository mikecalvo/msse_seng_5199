footer: © Citronella Software Ltd 2015
slidenumbers: true

# Functional Testing
## Mike Calvo
### mike@citronellasoftware.com

---
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
