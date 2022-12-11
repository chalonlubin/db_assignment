\echo 'Delete and recreate movies_assessment db?'
\prompt 'Return for yes or control-C to cancel > ' foo

DROP DATABASE movies_assessment;
CREATE DATABASE movies_assessment;
\connect movies_assessment


CREATE TABLE studios (
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  start_date DATE);

CREATE TABLE movies (
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  release_year INT NOT NULL,
  runtime INT NOT NULL,
  rating TEXT NOT NULL,
  studio_id INT NOT NULL REFERENCES studios);

CREATE TABLE stars (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  birth_date DATE NOT NULL);

CREATE TABLE roles (
  id INTEGER NOT NULL,
  movie_id INTEGER NOT NULL REFERENCES movies,
  star_id INTEGER NOT NULL REFERENCES stars);


INSERT INTO studios
  VALUES
    (1, 'Walt Disney Studios Motion Pictures', '1953-06-23'),
    (2, '20th Century Fox', '1935-05-31'),
    (3, 'Paramount Pictures', '1912-05-08'),
    (4, 'Universal Pictures', '1912-04-30'),
    (5, 'Warner Bros.', '1923-04-04'),
    (6, 'Dreamworks SKG', '1994-10-12'),
    (7, 'Lionsgate', '1997-07-10'),
    (8, 'Sony / Columbia Pictures', '1924-01-10'),
    (9, 'New Line Cinema', '1967-01-01'),
    (10, 'Newmarket Films', '1994-01-01'),
    (11, 'Summit Entertainment', '1991-07-26'),
    (12, 'Orion Pictures', '1978-01-01'),
    (13, 'Sony Pictures Classics', '1992-01-01');

INSERT INTO movies
  VALUES
    (1, 'Star Wars: The Force Awakens', 2015, 136, 'PG-13', 1),
    (5, 'Marvel''s The Avengers', 2012, 142, 'PG-13', 1),
    (6, 'Star Wars: The Last Jedi', 2017, 151, 'PG-13', 1),
    (7, 'Black Panther', 2018, 140, 'PG-13', 1),
    (9, 'Rogue One: A Star Wars Story', 2016, 133, 'PG-13', 1),
    (10, 'Beauty and the Beast', 2017, 129, 'PG', 1),
    (11, 'Finding Dory', 2016, 103, 'PG', 1),
    (14, 'Avengers: Age of Ultron', 2015, 141, 'PG-13', 1),
    (19, 'Pirates of the Caribbean: Dead Man''s Chest', 2006, 151, 'PG-13', 1),
    (20, 'The Lion King', 1994, 89, 'G', 1),
    (2, 'Avatar', 2009, 160, 'PG-13', 2),
    (12, 'Star Wars: Episode I - The Phantom Menace', 1999, 133, 'PG', 2),
    (13, 'Star Wars', 1977, 121, 'PG', 2),
    (34, 'Star Wars: Episode III - Revenge of the Sith', 2005, 146, 'PG-13', 2),
    (41, 'Deadpool', 2016, 106, 'R', 2),
    (66, 'Star Wars: Episode II - Attack of the Clones', 2002, 132, 'PG-13', 2),
    (68, 'Return of the Jedi', 1983, 134, 'PG', 2),
    (69, 'Independence Day', 1996, 153, 'PG-13', 2),
    (84, 'The Empire Strikes Back', 1980, 129, 'PG', 2),
    (87, 'Home Alone', 1990, 105, 'PG', 2),
    (3, 'Titanic', 1997, 194, 'PG-13', 3),
    (28, 'Transformers: Revenge of the Fallen', 2009, 144, 'PG-13', 3),
    (44, 'Transformers: Dark of the Moon', 2011, 154, 'PG-13', 3),
    (55, 'Forrest Gump', 1994, 141, 'PG-13', 3),
    (58, 'Shrek the Third', 2007, 92, 'PG', 3),
    (59, 'Transformers', 2007, 143, 'PG-13', 3),
    (60, 'Iron Man', 2008, 126, 'PG-13', 3),
    (62, 'Indiana Jones & Kingdom of the Crystal Skull', 2008, 120, 'PG-13', 3),
    (65, 'Iron Man 2', 2010, 125, 'PG-13', 3),
    (4, 'Jurassic World', 2015, 124, 'PG-13', 4),
    (17, 'E. T.: The Extra-Terrestrial', 1982, 117, 'PG', 4),
    (27, 'Jurassic Park', 1993, 127, 'PG-13', 4),
    (38, 'The Secret Life of Pets', 2016, 90, 'PG', 4),
    (39, 'Despicable Me 2', 2013, 98, 'PG', 4),
    (43, 'Furious 7', 2015, 137, 'PG-13', 4),
    (50, 'Minions', 2015, 91, 'PG', 4),
    (91, 'Meet the Fockers', 2004, 114, 'PG-13', 4),
    (94, 'Sing', 2016, 110, 'PG', 4),
    (97, 'Despicable Me 3', 2017, 90, 'PG', 4),
    (8, 'The Dark Knight', 2008, 150, 'PG-13', 5),
    (15, 'The Dark Knight Rises', 2012, 165, 'PG-13', 5),
    (22, 'Wonder Woman', 2017, 141, 'PG-13', 5),
    (32, 'Harry Potter and the Deathly Hallows: Part 2', 2011, 130, 'PG-13', 5),
    (45, 'American Sniper', 2014, 132, 'R', 5),
    (54, 'Batman v Superman: Dawn of Justice', 2016, 151, 'PG-13', 5),
    (56, 'It', 2017, 135, 'R', 5),
    (57, 'Suicide Squad', 2016, 130, 'PG-13', 5),
    (61, 'Harry Potter and the Sorcerer''s Stone', 2001, 153, 'PG', 5),
    (72, 'The Hobbit: An Unexpected Journey', 2012, 166, 'PG-13', 5),
    (73, 'Harry Potter and the Half-Blood Prince', 2009, 153, 'PG-13', 5),
    (76, 'Harry Potter and the Deathly Hallows: Part 1', 2010, 150, 'PG-13', 5),
    (79, 'Inception', 2010, 148, 'PG-13', 5),
    (81, 'Harry Potter and the Order of the Phoenix', 2007, 139, 'PG-13', 5),
    (83, 'Man of Steel', 2013, 143, 'PG-13', 5),
    (89, 'The Matrix Reloaded', 2003, 138, 'R', 5),
    (16, 'Shrek 2', 2004, 93, 'PG', 6),
    (96, 'Shrek', 2001, 90, 'PG', 6),
    (18, 'The Hunger Games: Catching Fire', 2013, 146, 'PG-13', 7),
    (25, 'The Hunger Games', 2012, 142, 'PG-13', 7),
    (48, 'The Hunger Games: Mockingjay - Part 1', 2014, 123, 'PG-13', 7),
    (80, 'The Twilight Saga: Breaking Dawn Part 2', 2012, 116, 'PG-13', 7),
    (88, 'The Hunger Games: Mockingjay - Part 2', 2015, 137, 'PG-13', 7),
    (26, 'Spider-Man', 2002, 121, 'PG-13', 8),
    (30, 'Jumanji: Welcome to the Jungle', 2018, 119, 'PG-13', 8),
    (36, 'Spider-Man 2', 2004, 127, 'PG-13', 8),
    (49, 'Spider-Man 3', 2007, 140, 'PG-13', 8),
    (51, 'Spider-Man: Homecoming', 2017, 133, 'PG-13', 8),
    (71, 'Skyfall', 2012, 143, 'PG-13', 8),
    (98, 'The Amazing Spider-Man', 2012, 136, 'PG-13', 8),
    (35, 'The Lord of the Rings: Return of the King', 2003, 200, 'PG-13', 9),
    (46, 'The Lord of the Rings: The Two Towers', 2002, 179, 'PG-13', 9),
    (63, 'The Lord of the Rings: Fellowship of the Ring', 2001, 178, 'PG-13', 9),
    (37, 'The Passion of the Christ', 2004, 126, 'R', 10),
    (74, 'The Twilight Saga: Eclipse', 2010, 124, 'PG-13', 11),
    (75, 'The Twilight Saga: New Moon', 2009, 130, 'PG-13', 11),
    (90, 'The Twilight Saga: Breaking Dawn Part 1', 2011, 108, 'PG-13', 11),
    (21, 'Toy Story 3', 2010, 103, 'G', 1),
    (23, 'Iron Man 3', 2013, 129, 'PG-13', 1),
    (24, 'Captain America: Civil War', 2016, 147, 'PG-13', 1),
    (29, 'Frozen', 2013, 108, 'PG', 1),
    (31, 'Guardians of the Galaxy Vol. 2', 2017, 137, 'PG-13', 1),
    (33, 'Finding Nemo', 2003, 104, 'G', 1),
    (40, 'The Jungle Book', 2016, 105, 'PG', 1),
    (42, 'Inside Out', 2015, 94, 'PG', 1),
    (47, 'Zootopia', 2016, 108, 'PG', 1),
    (52, 'Alice in Wonderland', 2010, 109, 'PG-13', 1),
    (53, 'Guardians of the Galaxy', 2014, 121, 'PG-13', 1),
    (64, 'Thor: Ragnarok', 2017, 130, 'PG-13', 1),
    (67, 'Pirates of the Caribbean: At World''s End', 2007, 168, 'PG-13', 1),
    (70, 'Pirates of the Caribbean: Curse of the Black Pearl', 2003, 135, 'PG-13', 1),
    (77, 'The Sixth Sense', 1999, 107, 'PG-13', 1),
    (78, 'Up', 2009, 96, 'PG', 1),
    (82, 'The Chronicles of Narnia: Lion, Witch & Wardrobe', 2005, 132, 'PG', 1),
    (86, 'Monsters, Inc.', 2001, 90, 'G', 1),
    (95, 'Monsters University', 2013, 107, 'G', 1),
    (100, 'The Incredibles', 2004, 115, 'PG', 1),
    (101, 'Toy Story 2', 1999, 95, 'G', 1),
    (85, 'Harry Potter and the Goblet of Fire', 2005, 153, 'PG-13', 5),
    (92, 'The Hangover', 2009, 96, 'R', 5),
    (93, 'Gravity', 2013, 91, 'PG-13', 5),
    (99, 'Harry Potter and the Chamber of Secrets', 2002, 161, 'PG', 5);

INSERT INTO stars
  VALUES
    (1, 'Frances', 'McDormand', '1957-06-23'),
    (2, 'Jim', 'Carrey', '1962-01-17'),
    (3, 'Emma', 'Watson', '1990-04-15'),
    (4, 'Daniel', 'Radcliffe', '1989-07-23'),
    (5, 'Charles', 'Chaplin', '1889-04-16'),
    (6, 'Morgan', 'Freeman', '1937-06-01'),
    (7, 'Will', 'Smith', '1968-09-25'),
    (8, 'Cameron', 'Diaz', '1972-08-30'),
    (9, 'Kate', 'Winslet', '1975-10-05'),
    (10, 'Natalie', 'Portman', '1981-06-09'),
    (11, 'Sean', 'Connery', '1930-08-25'),
    (12, 'Dwayne', 'Johnson', '1972-05-02'),
    (13, 'Angelina', 'Jolie', '1975-06-04'),
    (14, 'Scarlett', 'Johansson', '1984-11-22'),
    (15, 'Keira', 'Knightley', '1985-03-26'),
    (16, 'Halle', 'Berry', '1966-08-14'),
    (17, 'Samuel', 'Jackson', '1948-12-21'),
    (18, 'Tom', 'Hanks', '1956-07-09'),
    (19, 'Christopher', 'Plummer', '1929-12-13'),
    (20, 'Jennifer', 'Lawrence', '1990-08-15'),
    (21, 'Mila', 'Kunis', '1983-08-14'),
    (22, 'Kathy', 'Bates', '1948-06-28'),
    (23, 'Chris', 'Rock', '1965-02-07'),
    (24, 'Harrison', 'Ford', '1942-07-13'),
    (25, 'Wesley', 'Snipes', '1962-07-31'),
    (26, 'Viola', 'Davis', '1965-08-11'),
    (27, 'Bradley', 'Cooper', '1975-01-05'),
    (28, 'Amy', 'Poehler', '1971-09-16'),
    (29, 'Joseph', 'Gordon-Levitt', '1981-02-17'),
    (30, 'Danai', 'Gurira', '1978-02-14'),
    (31, 'Jamie', 'Foxx', '1967-12-13'),
    (32, 'Angela', 'Bassett', '1958-08-16'),
    (33, 'Ian', 'McKellen', '1939-05-25'),
    (34, 'Maya', 'Rudolph', '1972-07-27'),
    (35, 'Jenny', 'Slate', '1982-03-25'),
    (36, 'Idris', 'Elba', '1972-09-06'),
    (37, 'Octavia', 'Spencer', '1972-05-25'),
    (38, 'Chadwick', 'Boseman', '1977-11-29'),
    (39, 'Michael', 'Keaton', '1951-09-05'),
    (40, 'Kristen', 'Wiig', '1973-08-22'),
    (41, 'Keanu', 'Reeves', '1964-09-02'),
    (42, 'Charlize', 'Theron', '1975-08-07'),
    (43, 'Helena', 'Carter', '1966-05-26'),
    (44, 'Daniel', 'Craig', '1968-03-02'),
    (45, 'Emma', 'Stone', '1988-11-06'),
    (46, 'Zoe', 'Saldana', '1978-06-19'),
    (47, 'Chris', 'Pratt', '1979-06-21'),
    (48, 'Anne', 'Hathaway', '1982-11-12'),
    (49, 'Ellen', 'DeGeneres', '1958-01-26'),
    (50, 'Robert', 'Downey Jr.', '1965-04-04');

INSERT INTO roles
  VALUES
    (1, 44, 1),
    (2, 10, 3),
    (3, 61, 3),
    (4, 73, 3),
    (5, 81, 3),
    (6, 85, 3),
    (7, 99, 3),
    (8, 32, 3),
    (9, 76, 3),
    (10, 32, 4),
    (11, 61, 4),
    (12, 73, 4),
    (13, 76, 4),
    (14, 81, 4),
    (15, 85, 4),
    (16, 99, 4),
    (17, 8, 6),
    (18, 15, 6),
    (19, 57, 7),
    (20, 69, 7),
    (21, 16, 8),
    (22, 58, 8),
    (23, 96, 8),
    (24, 3, 9),
    (25, 12, 10),
    (26, 34, 10),
    (27, 66, 10),
    (28, 30, 12),
    (29, 43, 12),
    (30, 5, 14),
    (31, 14, 14),
    (32, 24, 14),
    (33, 40, 14),
    (34, 65, 14),
    (35, 94, 14),
    (36, 12, 15),
    (37, 19, 15),
    (38, 67, 15),
    (39, 70, 15),
    (40, 5, 17),
    (41, 12, 17),
    (42, 14, 17),
    (43, 27, 17),
    (44, 34, 17),
    (45, 60, 17),
    (46, 65, 17),
    (47, 66, 17),
    (48, 100, 17),
    (49, 21, 18),
    (50, 55, 18),
    (51, 101, 18),
    (52, 78, 19),
    (53, 18, 20),
    (54, 25, 20),
    (55, 48, 20),
    (56, 88, 20),
    (57, 3, 22),
    (58, 1, 24),
    (59, 13, 24),
    (60, 62, 24),
    (61, 68, 24),
    (62, 84, 24),
    (63, 57, 26),
    (64, 31, 27),
    (65, 45, 27),
    (66, 53, 27),
    (67, 92, 27),
    (68, 42, 28),
    (69, 58, 28),
    (70, 6, 29),
    (71, 15, 29),
    (72, 79, 29),
    (73, 7, 30),
    (74, 7, 32),
    (75, 10, 33),
    (76, 35, 33),
    (77, 46, 33),
    (78, 63, 33),
    (79, 72, 33),
    (80, 58, 34),
    (81, 38, 35),
    (82, 47, 35),
    (83, 97, 35),
    (84, 11, 36),
    (85, 14, 36),
    (86, 40, 36),
    (87, 47, 36),
    (88, 64, 36),
    (89, 26, 37),
    (90, 47, 37),
    (91, 7, 38),
    (92, 24, 38),
    (93, 21, 39),
    (94, 50, 39),
    (95, 51, 39),
    (96, 39, 40),
    (97, 97, 40),
    (98, 89, 41),
    (99, 32, 43),
    (100, 52, 43),
    (101, 73, 43),
    (102, 76, 43),
    (103, 81, 43),
    (104, 1, 44),
    (105, 71, 44),
    (106, 98, 45),
    (107, 2, 46),
    (108, 31, 46),
    (109, 53, 46),
    (110, 70, 46),
    (111, 4, 47),
    (112, 13, 47),
    (113, 31, 47),
    (114, 53, 47),
    (115, 15, 48),
    (116, 52, 48),
    (117, 11, 49),
    (118, 33, 49),
    (119, 5, 50),
    (120, 14, 50),
    (121, 23, 50),
    (122, 24, 50),
    (123, 51, 50),
    (124, 60, 50),
    (125, 65, 50);
