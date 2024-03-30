# 0x01. NoSQL

## Description
This directory contains a set of exercises and tasks for learning about NoSQL databases and their use cases.

## Resources
- [NoSQL Databases Explained](https://www.mongodb.com/nosql-explained)
- [NoSQL vs SQL](https://www.mongodb.com/nosql-explained/nosql-vs-sql)
- [MongoDB Documentation](https://docs.mongodb.com/)

## Requirements
- All tasks should be done using the mongo shell or another MongoDB client.
- Make sure to create a new database for each task.

## Tasks
### 0. Simple operations
- Create a database named holberton and perform the following operations:
  - Create a collection named users.
  - Insert 5 documents with the specified schema.
  - Perform various operations such as finding users, updating age, and removing documents.

### 1. More complex operations
- Create a database named holberton_adv and perform the following operations:
  - Create a collection named inventory.
  - Insert 10 documents with the specified schema.
  - Perform various operations such as finding documents, updating quantity, and removing documents.

### 2. Aggregation framework
- Create a database named holberton_agg and perform the following operations:
  - Create a collection named scores.
  - Insert 1000 documents with the specified schema.
  - Use the aggregation framework to perform operations like finding average score and grouping users.

### 3. MapReduce
- Create a database named holberton_mapreduce and perform the following operations:
  - Create a collection named transactions.
  - Insert 10000 documents with the specified schema.
  - Use MapReduce to perform operations like finding total transaction amount and number of transactions per user.

### 4. Replication
- Set up a replica set with 3 members and perform operations related to data replication and failover.

### 5. Sharding
- Set up a sharded cluster and perform operations related to data distribution across multiple shards and failover.
