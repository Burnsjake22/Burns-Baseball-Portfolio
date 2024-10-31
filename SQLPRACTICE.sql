CREATE DATABASE BASEBALL_PRACTICE;

USE BASEBALL_PRACTICE;

SELECT * FROM People;

SELECT nameFirst, nameLast, weight FROM People
WHERE weight > 300;

SELECT nameFirst, nameLast, birthyear FROM People
WHERE namefirst LIKE '% %'; 

SELECT birthyear, avg(height), COUNT(*) as `count` FROM People
GROUP BY birthYear 
ORDER BY birthYear;


SELECT birthyear, avg(height), COUNT(*) as `count` FROM People
WHERE height >70
GROUP BY birthYear
ORDER BY birthYear DESC;

SELECT * FROM HallOfFame;

SELECT nameFirst, nameLast, p.playerID, h.inducted 
FROM People as p, HallOfFame as h
WHERE p.playerID = h.playerID and inducted = 'Y'
ORDER BY yearid DESC; 

SELECT * FROM CollegePlaying;

SELECT Distinct(nameFirst), nameLast, p.playerID, schoolID, h.yearid
FROM People as p, HallOfFame as h, CollegePlaying as c
WHERE p.playerID = h.playerID 
AND p.playerID = c.playerID
AND c.schoolID LIKE 'UC%';


SELECT * FROM `2024Hitters` 

SELECT `last_name, first_name`, k_percent, xwoba 
FROM `2024Hitters` 
WHERE xwoba > .400
ORDER BY xwoba DESC;

SELECT * FROM hitters;

SELECT `last_name, first_name`, player_age, avg_swing_speed, swords 
FROM hitters 
WHERE swords > 25
ORDER BY swords DESC;





