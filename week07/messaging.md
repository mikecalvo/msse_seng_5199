footer: © Citronella Software Ltd 2015
slidenumbers: true

# Messaging
## Mike Calvo
### mike@citronellasoftware.com

---
# What is Messaging?
- Asynchronous communication approach
- System components send messages and don't wait for message to be handled
- Messages describe events, actions, and can contain data payloads
- Message-Oriented-Middleware (MOM) is infrastructure that supports sending and delivery of messages

---
# Internal and External Messages
- Messages can be sent between components within a system
  - Long running processes
  - Activities not requring an immediate response
- Messages can be sent inter-system as an alternative to synchronous forms of integration (like web services)

---
# Messaging Types
- Publish-Subscribe
  - Topics
  - 1 message delivered to many receivers
- Point-to-point
  - Queues
  - 1 message delivered to 1 receiver

---
# Guaranteed Delivery
- MOM typically will store messages until they can be delivered
- Durable subscriptions ensure that subscribers will still receive messages even if they are temporarily offline when the message is sent

---
# Message Piping and Filtering
- Middleware can apply transformations to messages between send and delivery
- Payloads can be transformed to
  - Protect/remove sensitive data
  - Transform data from one system view to another
- Messages can also have functionality applied to them in transit
  - Archive messages for auditing
  - Trigger secondary messages
  - Compression

---
# Enterprise Service Bus
- Modern MOM
- Large, enterprise, typically expensive products
- Examples:
  - Oracle Enterprise Service Bus (formerly Aqualogic)
  - Apache ServiceMix and Mule (OSS)

---
# Benefits of Messaging
- Can offer more flexibility and dynamic behavior
- Systems are less coupled
  - Receipients can be offline and not affect other components
- Long running tasks can run out of band with user or system requests
- Data transformation can be extracted and isolated in middleware tier

---
# Java Message Service (JMS)
- Vendor neutral Java API for sending and receiving messages
- Resource adapter (similar to JDBC)
- Includes API for both sending and receiving messages

---
# JMS Concepts
- ConnectionFactory -> Connection
- Connection -> Session
- Session -> MessageConsumer | MessageProducer
- Session creates Messages
- Messages sent to Destinations (Topic | Queue)

---
# JMS Implementations
- JEE Servers: JBoss, WebSphere, Oracle
- ActiveMQ: standalone, embeddable implementation

---
# Spring and JMS
- Spring provides a comprehensive set of libraries to make JMS programming easier
- POJO-based message receivers
  - More testable

---
# Grails and JMS
- JMS Grails plugin provides basic dependencies:
 `compile ":jms:1.3"`
- Provider required to implement JMS Spec
  - ActiveMQ is a popular choice
  - Install the plugin
  - `compile ":activemq:0.4.1"`

---
# ActiveMQ
- Can also be downloaded and run seperately from Grails
- More typical configuration for non-development environments
- Easy to download and get running
- Add a bean to Groovy.config that connects to external instance of ActiveMQ

---
# JMS Grails Plugin
- Adds a jmsService component to Grails
- Available in controllers and services
- Methods for sending JMS messages to Queues and Topics
- Provides extension for services to be exposed as JMS endpoints (listeners)

---
# JMS Listener example

```
class EmailService {
  static expose = ['jms']
  static distnation 'mailQueue'

  void onMessage(message) {
    // write email sedning logic here
  }
}
```

---
# Grails Platform Core: Events API
- Lightweight messaging API within Grails
- Install platform-core plugin:
  `compile ":platform-core:1.0.RC5"`
- Event raising functions added to controllers, domain classes and services
- Events are publish/subscribe event model

---
# Message Send/Receive Example

```
class EmailService {
  Post sendEmail(String to, String body) {
    event 'sendEmail', [to: to, body:body]
  }
}

class DeliveryService {
  @grails.events.Listener
  def onSendEmail(def email) {
    log.info('Sending message: '+email)
    // actually send the mail
  }
}
```

---
# Listening for Grails-generated Events
- Grails produces events
- Uses namespaces to group events from subsystems
- Topic name can be specifed in the @Listener annoation
  - Wildcards can be used to listen for multiple topics

---
# GORM Events
- GORM generates events for before and after database writes
- onSaveOrUpdate can be specified with a domain class parameter
- Return false from before event handlers to prevent the write

---
# GORM Event Examples

```
@grails.events.Listener(namespace = 'gorm')
void onSaveOrUpdate(User) {
  // doSomething
}

@grails.events.Listener(namespace = 'gorm')
void beforeUpdate(User user) {
  if (!user.loggedIn()) {
    return false
  }
}

@grails.events.Listener(topic = '*', namespace = 'gorm')
bfoidBeforeEachGormEvent(EventMessage message) {
  // do something
}

```
