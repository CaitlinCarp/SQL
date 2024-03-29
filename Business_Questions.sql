--All of the following are practice questions from various websites such as DataLemur (DL) and Leetcode (LC)
--(DL) Who are the candidates who possess all of the required skills (proficient in Python, Tableau, and PostgreSQL) for the job? The output should be in ascending order.
SELECT candidate_id
FROM candidates
WHERE skill IN ('Python', 'Tableau', 'PostgreSQL')
GROUP BY candidate_id
HAVING COUNT(skill) = 3;

--(DL) What are the page IDs of all the Facebook pages that don't have any likes? The output should be in ascending order.
SELECT p.page_id
FROM pages p
LEFT JOIN page_likes pl
ON p.page_id = pl.page_id
WHERE pl.liked_date IS NULL
ORDER BY p.page_id ASC;

--(DL) Which parts have begun the assembly process but are not yet finished?
SELECT part 
FROM parts_assembly
WHERE finish_date IS NULL
GROUP BY part;

--(DL) How many users view the content on a laptop vs a mobile device?
SELECT
  SUM(CASE WHEN device_type = 'laptop' THEN 1 ELSE 0 END) AS laptop_views,
  SUM(CASE WHEN device_type IN ('tablet', 'phone') THEN 1 ELSE 0 END) AS mobile_views
FROM viewership;

--(DL) List the top three cities that have the most completed trade orders in descending order.
SELECT u.city, COUNT(u.city) AS total_complete
FROM users u
LEFT JOIN trades t
ON u.user_id = t.user_id
WHERE t.status = 'Completed'
GROUP BY u.city
ORDER BY total_complete DESC
LIMIT 3;

--(DL) Given a table of bank deposits and withdrawals, return the final balance for each account.
SELECT account_id, 
  SUM(
  CASE 
    WHEN transaction_type = 'Deposit' THEN amount
    ELSE -amount
  END) AS balance_amount
FROM transactions
GROUP BY account_id;

--(DL) Obtain a histogram of tweets posted per user in 2022. Output the tweet count per user as the bucket, and then the number of Twitter users who fall into that bucket.
SELECT tweets_num AS tweet_bucket, COUNT(user_id) AS user_nums
FROM(
  SELECT user_id, COUNT(tweet_id) AS tweets_num 
  FROM tweets
  WHERE tweet_date BETWEEN '2022-01-01' AND '2022-12-31' 
  GROUP BY user_id) AS total_tweets
GROUP BY tweets_num;

--(DL) Write a query to get the average stars for each product every month. 
--The output should include the month in numerical value, product id, and average star rating rounded to two decimal places. Sort the output based on month followed by the product id.
SELECT EXTRACT(MONTH from submit_date) AS Month, product_id, ROUND(AVG(stars),2) 
FROM reviews
GROUP BY Month, product_id
ORDER BY Month, product_id;

--(DL) Which personal profiles have more followers then the company they work for?
SELECT p.profile_id
FROM personal_profiles p
JOIN company_pages c
ON p.employer_id = c.company_id
WHERE p.followers > c.followers
ORDER BY p.profile_id ASC;

--(DL) Who are the top three customers that have spent at least $1000 total and how many products have the purchased?
SELECT user_id, count(user_id) AS product_num
FROM user_transactions
GROUP BY user_id
HAVING SUM(spend) >= 1000
ORDER BY product_num DESC, SUM(spend) DESC
LIMIT 3;

--(LC) Write an SQL query to find for each user, the join date and the number of orders they made as a buyer in 2019.
SELECT u.user_id AS buyer_id, u.join_date, count(o.buyer_id) AS orders_in_2019
FROM users u
LEFT JOIN orders o
ON o.buyer_id = u.user_id
AND year(o.order_date) = 2019
GROUP BY u.user_id;

--(LC) Write an SQL query to report the Capital gain/loss for each stock.
SELECT stock_name,  
    SUM(
        Case   
            WHEN operation = 'Sell' Then price
            WHEN operation = 'Buy' Then -price
            END) AS capital_gain_loss
FROM stocks
GROUP BY stock_name;

-- (DL) Write a query to obtain a breakdown of the time spent sending vs. opening snaps (as a percentage of total time spent on these activities) for each age group.
--Output the age bucket and percentage of sending and opening snaps. Round the percentage to 2 decimal places.
WITH open_send_CTE AS (
SELECT age.age_bucket,
  SUM(CASE
      WHEN a.activity_type = 'open' THEN a.time_spent 
      ELSE 0
     END) AS time_open,
  SUM(CASE
      WHEN a.activity_type = 'send' THEN a.time_spent
      ELSE 0
    END) AS time_send,
  SUM(a.time_spent) AS total_time
FROM activities AS a
INNER JOIN age_breakdown AS age
ON a.user_id = age.user_id
WHERE a.activity_type IN ('send', 'open')
GROUP BY age.age_bucket)

SELECT age_bucket,
  ROUND(time_send/total_time*100.0, 2) AS send_perc,
  ROUND(time_open/total_time*100.0, 2) AS open_perc
FROM open_send_CTE;

--(DL) Calculate the 3-day rolling average of tweets published by each user for each date that a tweet was posted. 
--Output the user id, tweet date, and rolling averages rounded to 2 decimal places.
SELECT user_id, 
  tweet_date, 
 ROUND(AVG(COUNT(tweet_id)) OVER
  (
  PARTITION BY user_id
  ORDER BY user_id, tweet_date ROWS BETWEEN 2 PRECEDING and CURRENT ROW
  ), 2) AS rolling_avg_3days
FROM tweets
GROUP BY user_id, tweet_date;

--(DL)Write a query to obtain the sum of the odd-numbered and even-numbered measurements on a particular day, in two different columns.
WITH measurements_in_order AS(
  SELECT 
    ROW_NUMBER() OVER(PARTITION BY DATE(measurement_time) ORDER BY measurement_time),
    measurement_value,
    measurement_time
    FROM measurements)

SELECT
DATE(measurement_time) AS measurement_day,
SUM(CASE
  WHEN MOD(row_number, 2) <> 0 THEN measurement_value
    ELSE 0
    END) AS odd_sum,
SUM(CASE
  WHEN MOD(row_number, 2) = 0 THEN measurement_value
    ELSE 0
    END) AS even_sum  
FROM measurements_in_order
GROUP BY DATE(measurement_time)
ORDER BY DATE(measurement_time);

