footer: © Citronella Software Ltd 2015
slidenumbers: true

# GORM Queries
## Mike Calvo
### mike@citronellasoftware.com

---

# Where Queries
- GORM adds static where methods to all Domain classes
- The where method takes a closure that allows for powerful query expressions based on one or more properties
- The result of a where query provides a series of execution operations
`<domainClass>.where { <criteria> }.<execution>()`
---

# Example WhereQuery
```
// find all users whose email is mike@*
User.where { email =~ "mike@%"}.list()
```

---

# Query Syntax
- The left side of any comparison is ALWAYS a property on the domain class
- Comparison operators are common Groovy comparisons: ==, <, > ~=, !=, etc
- Logical OR and AND operators are also available for complex, multi-value queries
- Properties can be nested within related properties

---

# Examples Queries
```
// Find all users who's email starts with
//    case insensitive joe and were created after a date
User.where { email ==~ 'joe%' && dateCreated > fromDate }.list()


// Only limit by date if it was included
User.where {
  email ==~ 'joe%'
  if (fromDate) {
    dateCreated > fromDate
  }
}.list()

Post.where { post.user.email == userEmail }
```

---

# Controlling Results
- The list() function on the where query allows for filtering of results
- max: The maximum number to return
- offset: The number of elements into the ResultSet to start at
- sort: The field to sort on
- order: 'asc' or 'desc'
- fetch: Eager/lazy fetch strategy as a Map of options

---

# Getting a single result
- The get() function returns a single value (rather than multiple via list())
- get() also takes the result parameters list() does

---

# Enabling SQL Logging
- Sometimes it is necessary to tune queries based on performance
- Handy to view the actual SQL being executed
- DataSource.groovy:
`logSql = true on your dataSource`

---

# Viewing SQL Query Parameters
- To view all values passed to database, including query parameters dial up the logging on these Hibernate classes in your Config.groovy:

```
log4j = {
  // Other logging configured here...

  debug "org.hibernate.SQL"
  trace "org.hibernate.type.descriptor.sql.BasicBinder"
}
```

---

# Easy Counting and Listing
- GORM provides static count() and list() methods on each domain class
- list() performs a simplequery operations with limited control on results
  - max, order, offset, fetch, sort are all supported
- count() returns a count of all items in the corresponding table

---

# Dynamic Find and Count Methods
- GORM provides findBy<Property> and countBy<Property> methods for each property
- They can look for specific values:
  `User.findByEmail('joe@jones.com')`
- The can look by patterns:
  `User.countByEmailILike('%joe%')`
- They can combine properties:
  `User.findByEmailAndPassword(e, p)`

---

# Criteria Queries

---

# HQL
