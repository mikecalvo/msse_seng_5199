footer: © Citronella Software Ltd 2015
slidenumbers: true

# Grails Services
## Mike Calvo
### mike@citronellasoftware.com

---
# Services Defined
- Architectural layer of Grails
- Reusable business logic
- Can be shared by controllers
- Transactional

---
# Conventions
- Live in grails-app/services
- End in 'Services'
  - The name of the service is the part before
  - Example: AlbumService
- All methods in services are transactional by default
- Camel-case version can be injected into other components

---
# Common Service Logic
- All Domain interactions
- External system integrations
- Sending email
- Asynchronous message sending
- Any non-UI handling logic

---
# Quick Transaction Review
- Sequence of operations that should be treated as a single operation
- Only succeeds if every operation succeeds
- Can be nested
- Commit: finalize the work of the transaction
- Rollback: abort the transaction (no changes)

---
# ACID properties
  **Atomic**:
    -All or nothing
  **Consistent**:
    - System makes sense before and after
  **Isolation**:
   - Results of other transactions are not included
  **Durable**:
    -Permanently made (written to storage)

---
# Classic Account Transfer Example
- Both withdraw and deposit must succeed for transfer to succeed (atomic)
- Sum of both accounts must be the same after transfer (consistency)
- No other withdraws during transfer period (isolation)
- Bank systems must have correct amounts (durability)

---
# Service Transactions
- Based on Spring Transactions
- Default behavior:
  1. Before Method: Start new transaction
  1. Invoke Method: Transactional code executes
  1. Successful return: Commit transaction
  1. Runtime Exception: Rollback transaction

---
# Changing Service Transactions
- To disable automatic transactions on service:
`static transactional = false`
- @Transactional
  - Mark method or class as transactional
  - readOnly attribute improves performance by not requring commit after method completes
- Good idea to think about read only methods

---
# Creating a Service
- Run the grails script:
  `grailsw create-service servicename`
  - create the basic service class and test
- Alternatively, simply create a service class in grails-app/services

---
# Example Service
```
class PostService {
    Post createPost(String userId, String comment) {
      def user = User.findByUserId(userId)
      if (user) {
        def post = new Post(comment: comment)
        user.addToPosts(post)

        if (post.validate()) {
          if (user.save()) {
            return post;
          }
          throw new RuntimeException('Error saving post')
        }
        throw new RuntimeException('Invalid post')
      }
      throw new RuntimeException('No user found')
    }
}
```

---
# Service Spec
```
@TestFor(PostService)
@Mock([User,Post])
class PostServiceSpec extends Specification {
  def "Valid posts get saved and added to the user"() {
    given: "A new user in the db"
      new User(loginId: "chuck_norris",
          password: "password").save(failOnError: true)
    when: "a new post is created by the service"
      def newPost = service.createPost("chuck_norris", "First Post!")
    then: "the post returned and added to the user"
      newPost.content == "First Post!"
      User.findByLoginId("chuck_norris").posts.size() == 1
  }
}
```
---
# Using A Service
- Inject the service into your controller by adding a member matching your service name:
```
class PostController {
  def postService

  def create() {
    postService.createPost(params.user, params.comment)
  }
}
```

---
# Service Names
- Plugins may provide services
- To avoid name collections when injecting, Grails adds a prefix to the service name matching the name of the plugin
- Example: taxer plugin has a taxService
  `def taxerTaxService`

---
# Service State
- Services are singletons by default
- Likely to be called concurrently
- Storing state in Services generally bad idea
  - Can be used for caching

---
# Changing Service Scope
- Default singleton scope can be changed using static scope property
- Supported scopes:
  - prototype: new services each time injected
  - request: new services for each request
  - session: new service for each session
  - singleton: default (does not need to be specified)
