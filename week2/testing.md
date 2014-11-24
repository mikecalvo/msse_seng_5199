footer: © Citronella Software Ltd 2015
slidenumbers: true

# Testing Overview
## Mike Calvo
### mike@citronellasoftware.com

---

# Basic Concept
- Write code to verify system
- Automatable
- Multiple levels:
  - Unit
  - Integration
  - Functional
  - Smoke/End-to-end

---

# Rationale
- Code not done until tested
- Find mistakes sooner
- Refactor without regression
- Can help improve design
- Many, many more...

---

# Test-Driven Development
- Write a test before you write code
  - Test fails until the code works
- Pairing
  - Take turns writing test/code

---

# Mocks
- Help isolate code under test
- Replace system component or external system with a fake
- Provide expected responses or exceptions
- Can be used to verify call sequences

---

# Unit Testing
- Tests at the class or method level
- External system components are mocked out
- Fastest to run

---

# Integration Testing
- Purpose: Tests the interaction of system components
- Can often include testing of
  - Data Access
  - Dependency injection

---

# Functional Testing
- Purpose: Test a complete functional unit of a system
- System is deployed and invoked in a running environment
- Mock out external systems

---

# Smoke Testing
- Purpose: major functions of the system are operational
- Tests end-to-end functionality
  - Including integrations with external systems
- Can be used to verify a deployment

---

# Code Coverage
- Metrics on how much of your code is covered by your tests
- Tools can instrument your code to monitor line coverage
- Intellij provides it
- Many opinons on good coverage percentage

---

# Running tests
- Build tools are used to run tests in bulk
- Typically run in order of specificity
  - No point running smoke tests if a unit test fails
- Grails works this way

---

# Unit Testing Frameworks
- Provide test and assertion classes
- Test run harness
- Provide pass/failure reporting functionality
- Exist for all platforms
  - Objective C, .NET, Java, Javascript, etc

---

# JUnit
- Created by Kent Beck (original founder of Agile)
- Oldest, most-widely used Java unit test framework
- Uses approach of annotating classes and methods to mark as tests
- Great integration with most Java IDEs

---

# Do's
- Cover edge cases and pathological situations
- When a bug is found, write a test that exposes it
- Cleanup system (data, files) after test completes
- Tests should pass if run in any order

---

# Don'ts
- Use print statements in tests as verification
- Ignore tests that fail intermittently
- Assume enviornment has been setup externally
  - Test setup should put system into proper state

---

# Grails Testing
- Grails supports 4 phases of testing
- Supports many test frameworks: JUnit, TestNG, Spock
- Executed using the grails command
  `grails test-app`
- HTML report produced in target/test-results

---

# Grails Unit Tests
-
---

# Grails Integration Tests
