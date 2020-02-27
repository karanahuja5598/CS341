-- Project0503.sql
-- 3.	For each BikeID, retrieve the number of trips taken with
--  that bike and the total amount of time that bike was checked out.
--  Restrict the results to the top 10 by total time checked out.
SELECT Top 10 BikeID,Count(BikeID) AS NumTrips,Sum(TripDuration) As TimeCheckedOut
From Trips
Group By BikeID
ORDER By TimeCheckedOut DESC