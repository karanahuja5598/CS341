-- Project0505.sql
-- 5.	For each customer list the number of trips they have taken.
--   Restrict the results to the 10 users who have taken the most trips.
Select top 10 Users.UserID,Count(Users.UserID) As NumTrips
From Users
Inner Join Trips On Users.UserID = Trips.UserID
Group By Users.UserID
ORDER By NumTrips DESC , UserID ASC