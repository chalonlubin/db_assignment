Make sure you download the starter code and run the following:

```sh
  psql -f movies_assessment.sql
```

In Markdown, you can place a code block inside of three backticks (```)
followed by the syntax highlighting you want, for example

\```sql

SELECT \* FROM users;

\```

**Important:**
We have provided some starting data, but the data will continue to grow. You
should make sure that the queries you write will work when more data is added (not
simply with the data that exists now).

Assumptions you can make about any future data:

- Multiple stars can have the same first and last names
- There can be stars who haven't been in any movies
- There can be movies that don't have stars
- A star can only have one role in a movie (one star can't have two roles in
    the same movie)

Using the `movies_db` database, write the correct SQL queries for each of these tasks:

1.  All information on the G-rated or PG-rated movies.

    ```sql
    SELECT * FROM movies
        WHERE rating LIKE '%G';
    ```

2.  The title and release year of every movie, ordered by title and release year.
    For example, if there were movies from the year 1960 and 1961 in our database,
    the 1960 movies would appear alphabetically before all 1961 movies.

    ```sql
    SELECT title, release_year FROM movies
        ORDER BY release_year, title;
    ```


3.  A query that returns the columns of `rating` and `total`, tabulating the
    total number of G, PG, PG-13, and R-rated movies, only including movies with
    a runtime of 100 minutes or more.

    ```sql
    SELECT rating, COUNT(*) as total FROM movies
        WHERE runtime > 99
        GROUP BY rating;
    ```

4.  A query that returns the movie `release_year` and `average_runtime`,
    tabulating the average runtime by the year for every movie in the database.
    The data should be in reverse chronological order (ie, the most recent year
    should be first).

    ```sql
    SELECT release_year,ROUND(AVG(runtime),2) FROM movies
        GROUP BY release_year
        ORDER BY release_year DESC;
    ```

5. A query with the same information as above (#4), but the `average_runtime`
   should be rounded.

    *I already did this because the long numbers were bugging me*

   ```sql
    SELECT release_year,ROUND(AVG(runtime),2) FROM movies
        GROUP BY release_year
        ORDER BY release_year DESC;
    ```

6. The movie title and studio name for *every* movie in the database.

    ```sql
    SELECT movies.title, studios.name as studio_name FROM movies
        FULL OUTER JOIN studios ON movies.studio_id=studios.id;
    ```

7.  The star first name, star last name, and movie title for every
    matching movie and star pair in the database.

    ```sql
    SELECT stars.first_name, stars.last_name, movies.title FROM stars
        JOIN roles ON stars.id=roles.star_id
            JOIN movies ON roles.movie_id=movies.studio_id;
    ```


8.  The first and last names of every star who has been in a G-rated movie. The
    first and last name should appear only once for each star, even if they are
    in several G-rated movies.

    ```sql
    SELECT DISTINCT stars.first_name, stars.last_name FROM stars
        JOIN roles ON stars.id=roles.star_id
            JOIN movies ON roles.movie_id=movies.studio_id
                WHERE rating LIKE 'G'
    ```



9. The first and last names of *every* star along with the number of roles they
    have been in, in descending order by the number of roles, then alphabetically
    by their last name, then first name. (ensure that two different actors with
    the same name are considered separately).

    *example:* If Tom Hanks, Jim Hanks, and Cameron Diaz have 3 roles, and Ellen
    DeGeneres has 2 roles the query output should be:

    | last_name   | first_name  | num_roles |
    | ----------- | ----------- | --------- |
    | Diaz        | Cameron     |     3     |
    | Hanks       | Jim         |     3     |
    | Hanks       | Tom         |     3     |
    | DeGeneres   | Ellen       |     2     |

    ```sql
    SELECT stars.last_name, stars.first_name, COUNT(*) as num_roles FROM stars
        LEFT OUTER JOIN roles ON stars.id=roles.star_id
            GROUP BY stars.last_name, stars.first_name
            ORDER BY num_roles DESC, stars.last_name, stars.first_name;

10.  The titles of all movies that don't feature any stars in our database.

    ```sql
    SELECT movies.title FROM movies
        LEFT OUTER JOIN roles ON movies.id=roles.movie_id
        WHERE movies.id NOT IN (SELECT movie_id FROM roles);
    ```

11. The first names, last names, and titles corresponding to every
    role in the database, along with every movie title that doesn't have a
    star, and the first and last names of every star not in a movie.

      ```sql
    SELECT stars.first_name, stars.last_name, movies.title FROM movies
        FULL OUTER JOIN roles ON movies.id=roles.movie_id
            FULL OUTER JOIN stars ON roles.star_id=stars.id;
    ```


12. The first name and last name of stars and the total movie runtime for movies they have
    starred in, that meet the following conditions:
      - only consider the movies that have a runtime greater than or equal to 100 minutes
      - only include stars that have 500 or more such total minutes

    ```sql
    SELECT stars.first_name, stars.last_name, SUM(movies.runtime) as total FROM movies
            JOIN roles ON movies.id=roles.movie_id
            JOIN stars ON roles.star_id=stars.id
                    WHERE movies.runtime >= 100
                    GROUP BY stars.first_name, stars.last_name
                    HAVING SUM(movies.runtime) >= 500;
    ```


13. The movie title and movie runtime for movies with a runtime that is
    longer than the average runtime of all movies.

     ```sql
    SELECT title, runtime FROM movies
                    WHERE movies.runtime > (SELECT AVG(runtime) FROM movies);
    ```