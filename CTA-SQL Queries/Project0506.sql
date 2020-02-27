-- Project0506.sql
-- 6.	For each age group (year) among customers, list the average 
--  ride duration among all trips customers of that age group took.  
Select Top 10 Year(GETDATE()) - BirthYear As Age,AVG(TripDuration) As AverageTripDurationPerAgeGroup
From Users
Inner Join Trips on Users.UserID = Trips.UserID
Group By BirthYear
Order By AverageTripDurationPerAgeGroup DESC