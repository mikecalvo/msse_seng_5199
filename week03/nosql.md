footer: © Citronella Software Ltd 2015
slidenumbers: true

# NoSQL
## Mike Calvo
### mike@citronellasoftware.com

---

# Case Against Relational Data
- Transactional behavior may be too slow for extreme volumes
- Data models a document more than relationships
- Dynamic, frequently changing data structures
- Tree and graph structures require too much joining to be feasible

---

# Types of NoSQL Data Stores
- Key-value store
- Document store
- Graph database
- Column database

---

# Key-value Store
- Examples: Redis, Memcached
- Good for:
  - Persistent hash tables
  - Session tokens
  - Global state
  - Counters

---

# Document-oriented Store
- Examples: MongoDB, CouchDB
- Good for:
  - User profile data
  - Questionnaire data
  - Retail product data

---

# Graph Database
- Examples: Neo4J, OrientDB
- Good for:
  - Social network graphs
  - Directory and tree structures

---

# Column Database
- Examples: HBase, Cassandra, Bigtable
- Good for:
  - Time series data
