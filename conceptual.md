### Conceptual Exercise

Answer the following questions below:

- What is PostgreSQL?

PostgreSQL is an open source RDBMS, which has additional features on top of SQL. It supports both relational and non-relational querying.

- What is the difference between SQL and PostgreSQL?

SQL is the language used for working with RDBMs. It stands for "structured Query Lanaguage" and is standardized across multiple vendors.

Postgres describes itself as a ORDBMS. It has a additional features as well as all the standard features of SQL.

- In `psql`, how do you connect to a database?

  \c dbname

- What is the difference between `HAVING` and `WHERE`?

  `WHERE` filters single rows, where as `HAVING` filters groups of aggergate data.

- What is the difference between an `INNER` and `OUTER` join?

   Inner join connects the overlapping data in a table, outer joins ALL data between two tables.

- What is the difference between a `LEFT OUTER` and `RIGHT OUTER` join?

  Left outer will include data from the left table and present it as null if it it's value is unknown in the table from the right tables columns.

  Right is the opposite.

  You know the left table by looking at the first `FROM` in your query.
  Then the joined table will be the right.

- What is an ORM? What do they do?

  Object Relation Mapper. It is a tool or library that allows you to connect and perform operations on a database while using oop techniques. It makes coding quicker and DRYer once you learn the ORM. It improves security as well!


- What are some differences between making HTTP requests using AJAX and from the
  server side using a library like `requests`?

  AJAX requests are client-side requests, where the browser talks directly to the external API. This can be quicker because of the direct communication, but limited due to security concerns.
  Server side requests using `requests ` allows you to input paramaters, headers, tokens, ect. You can do this with AJAX too but the unique thing about `requests` allows you to make requests from one server to another server.


- What is CSRF? What is the purpose of the CSRF token?

  Cross Site Request Forgery.
  The purpose is to prevent potential hackers from sumbiting data without your consent to another server via hidden form. It is a one time use randomly generated token.

- What is the purpose of `form.hidden_tag()`?

  This generates the CSRF one time use token.


