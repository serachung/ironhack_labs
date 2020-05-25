-- SQL Day 01: Lab 1

-- 1. What are the different genres?**
SELECT prime_genre 
  FROM data
 GROUP BY prime_genre;
--or:
SELECT DISTINCT prime_genre FROM data;

-- 2. Which is the genre with the most apps rated? -> 'SOCIAL NETWORKING'
SELECT prime_genre, max(rating_count_tot)
  FROM data
 GROUP BY prime_genre
 ORDER BY  max(rating_count_tot) DESC;

 
-- 3. Which is the genre with most apps? -> 'GAMES'
SELECT prime_genre, count(track_name)
  FROM data
 GROUP BY prime_genre
 ORDER BY  count(track_name) DESC
 LIMIT 1;

-- 4. Which is the one with least? -> 'CATALOGS'
SELECT prime_genre, count(track_name)
  FROM data
 GROUP BY prime_genre
 ORDER BY count(track_name)
 LIMIT 1;

-- 5. Find the top 10 apps most rated.**
SELECT track_name, rating_count_tot FROM data
 ORDER BY rating_count_tot DESC
 LIMIT 10;

-- 6. Find the top 10 apps best rated by users.**
SELECT track_name, max(user_rating)
  FROM data
 GROUP BY track_name
 ORDER BY (max(user_rating),max(rating_count_tot)) DESC 
 LIMIT 10;

-- 7. Take a look at the data you retrieved in question 5. Give some insights.**
-- 'Facebook', 'Instagram' and 'Calsh of Clans' are te top 3 most rated apps.

-- 8. Take a look at the data you retrieved in question 6. Give some insights.**
-- Among the top 10 best reviewd apps,the majority belongs to the 'game' genre.

-- 9. Now compare the data from questions 5 and 6. What do you see?**
-- Being the most rated app does not imply in being the best rated app. 
-- Probably because the greater the number of ratings, means that more diverse people use the app. 

-- 10. How could you take the top 3 regarding both user ratings and number of votes?**
SELECT track_name, max(user_rating)
  FROM data
 GROUP BY track_name
 ORDER BY (max(user_rating),max(rating_count_tot)) DESC 
 LIMIT 3;

-- 11. Do people care about the price of an app?
-- Do some queries, comment why are you doing them and the results you retrieve. 
-- What is your conclusion?

-- Grouping by price and calculating the average rating for each price range:
SELECT price, avg(user_rating) AS avg_rating FROM data
 GROUP BY price
 ORDER BY (avg(user_rating)) DESC;

-- Grouping by user_rating and calculating the average price for each rating range:
SELECT user_rating, avg(price) AS avg_price  FROM data
 GROUP BY user_rating
 ORDER BY avg_price DESC;

-- Grouping by price and calculating the average number of ratings for each price range:
SELECT * FROM data;
SELECT price, avg(rating_count_tot) AS avg_number_rating FROM data
 GROUP BY price
 ORDER BY avg_number_rating DESC;

-- Conclusion: 
-- Many of the best rated apps have higher prices: the price of the apps rated between 4 and 5 starts at 6.99$.

-- Bonus: Find the total number of games available in more than 1 language. -> 3389 apps
SELECT count(track_name) from data WHERE "lang.num" > 1;

-- Bonus2: Find the number of free vs paid apps**
SELECT count(track_name) 
  FROM data WHERE price = 0 ;
  
SELECT count(track_name) AS paid_apps
  FROM data WHERE price > 0 ;

-- Bonus3: Find the number of free vs paid apps for each genre**
SELECT  prime_genre, count(track_name) AS free_apps_genre
  FROM data WHERE price = 0 
 GROUP BY prime_genre
 ORDER BY prime_genre;
 
SELECT  prime_genre, count(track_name) AS paid_apps_genre
  FROM data WHERE price > 0 
 GROUP BY prime_genre
 ORDER BY prime_genre;

-- Deliverables 
-- You need to submit a `.sql` file that includes the queries used to answer the questions above, 
-- as well as an `.md` file including your answers.

