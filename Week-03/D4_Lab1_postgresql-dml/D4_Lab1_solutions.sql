-- Challenge 1 - Who Have Published What At Where?
-- 1. relating book titles to the publishers names in 'title_pub' table
SELECT * FROM 
(SELECT titles.title_id, titles.title, titles.pub_id, publishers.pub_name
  FROM titles
  		INNER JOIN
		publishers
	ON titles.pub_id = publishers.pub_id) AS title_pub;

-- 2. relating all the books id to the authors names in 'title_auth' table 
SELECT * FROM 
(SELECT titleauthor.title_id, authors.au_id, au_fname, au_lname
  FROM titleauthor
  		INNER JOIN
		authors
 	ON titleauthor.au_id = authors.au_id) AS title_auth;

-- 3. joining everything in one table: who_what_where
CREATE TEMPORARY TABLE who_what_where AS
SELECT title_auth.au_id, title_auth.au_lname, title_auth.au_fname, title_pub.title, title_pub.pub_name  FROM (
(SELECT titles.title_id, titles.title, titles.pub_id, publishers.pub_name
	     FROM titles
  		 INNER JOIN
		 publishers
	  ON titles.pub_id = publishers.pub_id) AS title_pub
   INNER JOIN
  (SELECT titleauthor.title_id, authors.au_id, au_fname, au_lname
		  FROM titleauthor
		  INNER JOIN
		  authors
	   ON titleauthor.au_id = authors.au_id) AS title_auth
   ON title_pub.title_id = title_auth.title_id);

-- verifying if the output is correct: (25 rows)
SELECT * FROM who_what_where;
SELECT * FROM titleauthor;



-- Challenge 2 - Who Have Published How Many At Where?

-- query how many titles each author has published at each publisher. 
-- Order your output by the title count in descending order. 
-- Your output should look something like below:
SELECT au_id, au_lname, au_fname, pub_name, 
		COUNT(title) AS title_count
  FROM who_what_where
GROUP BY au_id,au_lname, au_fname, pub_name
ORDER BY title_count DESC;

-- Suming up the `TITLE COUNT` column to check if output is correct
SELECT SUM(a.title_count) FROM
(SELECT au_id, au_lname, au_fname, pub_name, 
		COUNT(title) AS title_count
 FROM who_what_where
GROUP BY au_id,au_lname, au_fname, pub_name
ORDER BY title_count DESC) AS a;

-- The sum ('title count') == count (records) in Table `titleauthor` (25)
SELECT * FROM titleauthor;
SELECT COUNT(au_ord) FROM titleauthor;



-- Challenge 3 - Best Selling Authors
-- Who are the top 3 authors who have sold the highest number of titles? 
-->> Answer: Anne and Albert Ringer and Marjorie Green
SELECT final_vrs.au_lname, final_vrs.au_fname,
		sum(final_vrs.qty) AS total_sales
  FROM (
		SELECT * FROM (
		(SELECT * FROM who_what_where) AS a
		LEFT JOIN
		(SELECT title_id, title FROM titles) AS b
		ON a.title = b.title) AS authors_titles
			LEFT JOIN
			(SELECT sales.qty, sales.title_id FROM sales) AS quant
			ON authors_titles.title_id = quant.title_id) AS final_vrs
GROUP BY final_vrs.au_lname, final_vrs.au_fname
ORDER BY sum (final_vrs.qty) DESC
LIMIT 3;

-- Challenge 4 - Best Selling Authors Ranking
-- output will display all 23 authors instead of the top 3. 
-- Note that the authors who have sold 0 titles should also appear in your output 
-- (ideally display `0` instead of `NULL` as the `TOTAL`). 
-- Also order your results based on `TOTAL` from high to low.


SELECT final_vrs.au_lname, 
		final_vrs.au_fname, 
		COALESCE (sum (final_vrs.qty),0) AS total_sales
  FROM  (
	 (SELECT title_auth.au_id, 
			  title_auth.au_fname, 
			  title_auth.au_lname,
			  titles.title_id, 
			  titles.title
	  FROM titles
	  FULL OUTER JOIN
			(SELECT titleauthor.title_id, 
			authors.au_id, 
			au_fname, 
			au_lname
			FROM titleauthor
			FULL OUTER JOIN
			authors
			ON titleauthor.au_id = authors.au_id) AS title_auth
	  ON titles.title_id = title_auth.title_id) AS B
  	  LEFT JOIN
	  	(SELECT sales.qty, sales.title_id FROM sales) AS quant
	     ON B.title_id = quant.title_id) AS final_vrs

  WHERE final_vrs.au_lname IS NOT NULL
  GROUP BY final_vrs.au_lname, final_vrs.au_fname
  ORDER BY total_sales DESC;
  
