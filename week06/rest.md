footer: © Citronella Software Ltd 2015
slidenumbers: true

# REST
## Mike Calvo
### mike@citronellasoftware.com

---
# Defining Web Services
- System-to-system integration using HTTP
- Goal: cross-platform API consumption
- Originally defined using XML-based protocols
- Language and system neutral

---
# Old School Web Services
- XML-Based
- Began to emerge at the dawn of the century
- Developed by the W3C Working Group and industry consortiums

# Elements of XML Web Services
- Define standard request and response XML structures
- SOAP - Simple Object Access Protocol
- WSDL - Web Services Description Language
- UDDI - Universal Description, Discovery and Integration

---
# Benefits of XML Web Services
- Good tooling support due to strict XML-schema-based protocol
- Well-structured payloads could be validated minimizing errors
- First viable attempt at cross platform interoperability
  - In comparison to CORBA
- Still used in many companies today

---
# Problems with XML Web Services
- XML payloads proved to be too large:
  - Excessive network load
  - Difficult to read and debug issues
- Large standards bodies moved to slow
  - Required too much buy in from too many parties

---
# REST and JSON
## The dynamic duo to the rescue!

---
# REST
- Representational State Transfer
- Architectural style based strictly on HTTP and a common pattern
- Convention for defining URI mappings to resources
- HTTP method (verb) defines the action being requested by the client

---
# Resources
- Key concept in REST
- Data of value at the end of a URL
- Individual item
- Collections
- Think Domain classes

---
# REST Constraints
- Client-server
- Stateless
- Cacheable
- Uniform interface
- Layered System
- Code-On-Demand

---
# Uniform Interface
- Self-descriptive messages (MIME types)
- Resource identifiers as an endpoint
- HTTP methods are used to signify intent

---
# HTTP Methods
- GET - retrieve resource
- PUT - replace (update) resource
- POST - create new single resource
- DELETE - delete resource

---
# Method Characteristics
- GET is safe
  - Calling it produces no side-effects
- PUT and DELETE are idempotent
  - Calling it repeatedly will produce the same result

---
# URI Conventions
- Collection: /resources/
  - GET: return a list
  - POST: create a new item
- Items: /resources/id
  - GET: return specific resource
  - DELETE: delete specific resource
  - PUT: update specific resource

---
# Good URI Rules
- Unique to a resource
- Long-lived
  - Always point to the same resource

---
# REST Data Formats
- REST only addressed part of the problem with XML Web Services
  - Complexity
- The rest of the problem lies in the complexity of the request and response payloads
- REST can be implemented with XML
- To complete the move to simpler APIs implement REST with JSON

---
# JSON
- JavaScript Object Notation
- Lightweight data format
  - Syntax, data types, format
- Only two structures:
  - Objects and Lists
- Maps nicely to REST

---
# JSON Value Types
- string
- number
- object
- array
- null
- true
- false

---
# JSON Object Format
- String value mapping inside curly braces

```
{
  'name': 'Mike',
  'age': 43,
  'nerd': true
  'address': {
    'country': 'USA'
  }
}
```

---
# JSON List format
- Comma-separated values inside square brackets

```
[ 1, 2, 3, 'a', false]

[{'name': 'Mike'}, {'name': 'Lars'}]
```

---
# Grails and REST
- Grails has several features to simplify creating RESTful APIs
- @Resource Annotation
- Controller actions
- Custom Url Mappings
- JSON and XML rendering

---
# @Resource
- Annotation for domain classes
- Creates implicit controller responding to REST requests
- Actions mapped to the standard REST HTTP methods

```
@Resource(uri='/posts')
class Post {

}
```

---
# Muzic Song REST Resource
- Make the Song domain class available for REST calls
