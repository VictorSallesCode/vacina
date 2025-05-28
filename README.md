# Vacina Project

## Overview
The Vacina project is a web application designed to manage student records in a MySQL database. It provides functionalities for inserting, deleting, and updating student entries, as well as displaying a list of students.

## Project Structure
```
vacina
├── src
│   └── db
│       └── DBConnection.java
├── webapps
│   └── vacina
│       ├── manage.jsp
│       ├── teste.jsp
│       └── WEB-INF
│           └── web.xml
└── README.md
```

## File Descriptions

- **src/db/DBConnection.java**: 
  This file contains the `DBConnection` class, which manages the database connection. It includes methods for establishing and closing the connection to the MySQL database.

- **webapps/vacina/manage.jsp**: 
  This JSP page allows users to manage student records. It includes functionalities for inserting new records, updating existing records, and deleting records from the database. It also handles form submissions and displays the current records.

- **webapps/vacina/teste.jsp**: 
  This JSP page displays a list of students retrieved from the database. It executes a SQL query to fetch student data and presents it in an HTML table format.

- **webapps/vacina/WEB-INF/web.xml**: 
  This is the deployment descriptor for the web application. It defines servlet configurations, welcome files, and other settings necessary for the web application to function correctly.

## Setup Instructions

1. **Database Setup**:
   - Ensure you have MySQL installed and running.
   - Create a database named `escola`.
   - Create a table named `aluno` with the following structure:
     ```sql
     CREATE TABLE aluno (
         ID INT AUTO_INCREMENT PRIMARY KEY,
         nome VARCHAR(100),
         idade INT
     );
     ```

2. **JDBC Driver**:
   - Make sure to include the MySQL JDBC driver in your project’s classpath.

3. **Deploying the Application**:
   - Place the `vacina` folder in the `webapps` directory of your Tomcat server.
   - Start the Tomcat server and access the application via `http://localhost:8080/vacina`.

## Usage
- Navigate to `manage.jsp` to manage student records.
- Use `teste.jsp` to view the list of students currently in the database.