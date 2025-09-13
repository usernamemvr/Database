# CRUD Practice Projects & SQL Exercises

This repository contains a few of my practice projects and exercises while learning Spring Boot, PostgreSQL, and SQL. It's a mix of hands-on coding and experimentation to understand how backend applications work with databases.  


## A) SQL Practice
- **File:** `practice.sql`
- Contains:
  - Tables creation
  - Sample inserts
  - Basic SQL queries
- Purpose: Practice raw SQL before connecting it to Java applications.

## B) Projects

### 1. CRUD App with Spring Boot & JDBC
- **Purpose:** Learn how to connect Spring Boot directly with PostgreSQL using `JdbcTemplate`.  
- **Features:**
  - Create, read, and delete users from the database.
  - Uses environment variables for database credentials (`.env`) for security.
- **Technologies:**  
  Spring Boot, JDBC, PostgreSQL, Gradle, `.env` configuration.

### 2. CRUD App with Spring Boot & JPA
- **Purpose:** Learn JPA and Hibernate with Spring Data JPA for a cleaner and easier database interaction.
- **Features:**
  - Same CRUD operations as above but using `JpaRepository`.
  - Entity validation: `name` is required and unique, `email` is unique.
  - Automatic schema management using `spring.jpa.hibernate.ddl-auto`.
- **Technologies:**  
  Spring Boot, Spring Data JPA, Hibernate, PostgreSQL, Lombok, Gradle, `.env` configuration.
