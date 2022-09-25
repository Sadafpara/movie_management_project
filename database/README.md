# DATABSE EXERCISE 
## (Data extract) -movie_db

### 1. How many movies did Nolan direct?

```sql 
SELECT COUNT(*) FROM directors_tbl
#SELECT movies_tbl.title, directors_tbl.name FROM directors_tbl
    JOIN movies_tbl ON movies_tbl.director_id = directors_tbl.id 
WHERE directors_tbl.name LIKE "Christopher Nolan";
 
 +----------+
| COUNT(*) |
+----------+
|        2 |
+----------+

#SELECT movies_tbl.title, directors_tbl.name FROM directors_tbl:
+-----------------+-------------------+
| title           | name              |
+-----------------+-------------------+
| Inception       | Christopher Nolan |
| The Dark Knight | Christopher Nolan |
+-----------------+-------------------+

 ```


### 2. List all the actors born before 1980.
```sql
SELECT * FROM main_actors_tbl
WHERE year_of_birth < 1980; 
+----+-----------------------+---------------+------+
| id | name                  | year_of_birth | sex  |
+----+-----------------------+---------------+------+
|  1 | Arnold Schwarzenegger |          1947 | M    |
|  3 | Sigourney Weaver      |          1949 | F    |
|  4 | Christian Bale        |          1974 | M    |
|  5 | Leonardo DiCaprio     |          1974 | M    |
|  6 | Angelina Jolie        |          1975 | F    |
|  7 | Zoe Saldaña           |          1978 | F    |
+----+-----------------------+---------------+------+

```

### 3. Among all the movies of James Cameron, how many were female actors?
```sql
#SELECT COUNT(*) FROM directors_tbl
SELECT * FROM directors_tbl
    JOIN movies_tbl ON movies_tbl.director_id = directors_tbl.id 
    JOIN movie_actors_tbl ON movie_actors_tbl.movie_id = movies_tbl.id 
    JOIN main_actors_tbl ON main_actors_tbl.id = movie_actors_tbl.main_actor_id  
WHERE directors_tbl.name LIKE "James Cameron" 
AND main_actors_tbl.sex LIKE "F";


#SELECT COUNT(*) FROM directors_tbl:
+----------+
| COUNT(*) |
+----------+
|        3 |
+----------+


#SELECT * FROM directors_tbl:
+----+---------------+---------------+----+--------+--------------+-------------+----------+---------------+----+------------------+---------------+------+
| id | name          | year_of_birth | id | title  | release_year | director_id | movie_id | main_actor_id | id | name             | year_of_birth | sex  |
+----+---------------+---------------+----+--------+--------------+-------------+----------+---------------+----+------------------+---------------+------+
|  1 | James Cameron |          1954 |  4 | Avatar |         2009 |           1 |        4 |             3 |  3 | Sigourney Weaver |          1949 | F    |
|  1 | James Cameron |          1954 |  5 | Aliens |         1986 |           1 |        5 |             3 |  3 | Sigourney Weaver |          1949 | F    |
|  1 | James Cameron |          1954 |  4 | Avatar |         2009 |           1 |        4 |             7 |  7 | Zoe Saldaña      |          1978 | F    |
+----+---------------+---------------+----+--------+--------------+-------------+----------+---------------+----+------------------+---------------+------+
```

### 4. How many directors did Leonardo DiCaprio worked with?
```sql
# SELECT * FROM main_actors_tbl
# SELECT directors_tbl.name, movies_tbl.title FROM main_actors_tbl
SELECT Count(directors_tbl.name) FROM main_actors_tbl
    JOIN movie_actors_tbl ON main_actors_tbl.id = movie_actors_tbl.main_actor_id
    JOIN movies_tbl ON movies_tbl.id = movie_actors_tbl.movie_id 
    JOIN directors_tbl ON directors_tbl.id = movies_tbl.director_id
WHERE main_actors_tbl.name LIKE "Leonardo DiCaprio" ;

+---------------------------+
| Count(directors_tbl.name) |
+---------------------------+
|                         2 |
+---------------------------+

# SELECT directors_tbl.name, movies_tbl.title FROM main_actors_tbl:
+-------------------+-----------+
| name              | title     |
+-------------------+-----------+
| James Cameron     | Titanic   |
| Christopher Nolan | Inception |
+-------------------+-----------+

```

### 5. Who is the oldest director?
```sql
SELECT * FROM directors_tbl 
ORDER BY year_of_birth ASC
LIMIT 1;
+----+---------------+---------------+
| id | name          | year_of_birth |
+----+---------------+---------------+
|  1 | James Cameron |          1954 |
+----+---------------+---------------+

'''
#potential usecase but didn  not work
SELECT
MIN(year_of_birth) #AS oldest_director,
name
FROM directors_tbl
#GROUP BY name;
'''
```


### 6. What is the earliest movie of the oldest director?
```sql
SELECT title, release_year, directors_tbl.name, directors_tbl.year_of_birth
FROM movies_tbl
    JOIN directors_tbl ON directors_tbl.id = movies_tbl.director_id
WHERE ( SELECT id FROM directors_tbl 
ORDER BY year_of_birth ASC
LIMIT 1
)
ORDER BY release_year ASC
LIMIT 1;

+------------+--------------+---------------+---------------+
| title      | release_year | name          | year_of_birth |
+------------+--------------+---------------+---------------+
| Terminator |         1984 | James Cameron |          1954 |
+------------+--------------+---------------+---------------+

```


### 7. What is the latest movie of the youngest actor?
```sql
SELECT title, release_year, main_actors_tbl.name, main_actors_tbl.year_of_birth
FROM movies_tbl
    JOIN movie_actors_tbl ON movies_tbl.id = movie_actors_tbl.movie_id 
    JOIN main_actors_tbl ON  movie_actors_tbl.main_actor_id = main_actors_tbl.id
WHERE ( SELECT id FROM main_actors_tbl 
ORDER BY year_of_birth DESC
LIMIT 1
)
ORDER BY release_year DESC
LIMIT 1;

+-----------+--------------+-----------+---------------+
| title     | release_year | name      | year_of_birth |
+-----------+--------------+-----------+---------------+
| Cleopatra |         2023 | Gal Gadot |          1985 |
+-----------+--------------+-----------+---------------+