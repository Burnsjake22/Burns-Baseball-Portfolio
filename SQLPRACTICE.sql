CREATE DATABASE BASEBALL_PRACTICE;

USE BASEBALL_PRACTICE;
/* 1. In the `people` table, find the `namefirst`, `namelast` and `birthyear` for all players with weight greater than 300 pounds.*/

SELECT * FROM People;

SELECT nameFirst, nameLast, weight FROM People
WHERE weight > 300;

/* 2. Find the `namefirst`, `namelast` and `birthyear` of all players whose `namefirst` field contains a space.*/
SELECT nameFirst, nameLast, birthyear FROM People
WHERE namefirst LIKE '% %'; 

/*rom the `people` table, group together players with the same `birthyear`, and report the `birthyear`, average `height`, and number of players for each `birthyear`. Order the results by `birthyear` in *ascending* order.*/
SELECT birthyear, avg(height), COUNT(*) as `count` FROM People
GROUP BY birthYear 
ORDER BY birthYear;

/*rom the `people` table, group together players with the same `birthyear`, and report the `birthyear`, average `height`, and number of players for each `birthyear`. Order the results by `birthyear` in *ascending* order.*/
SELECT birthyear, avg(height), COUNT(*) as `count` FROM People
WHERE height >70
GROUP BY birthYear
ORDER BY birthYear;

/*1. Find the `namefirst`, `namelast`, `playerid` and `yearid` of all people who were successfully inducted into the Hall of Fame in *descending* order of `yearid`.*/
SELECT * FROM HallOfFame;

SELECT nameFirst, nameLast, p.playerID, h.inducted 
FROM People as p, HallOfFame as h
WHERE p.playerID = h.playerID and inducted = 'Y'
ORDER BY yearid DESC; 





