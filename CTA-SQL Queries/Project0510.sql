-- Project0510.sql
-- 10.	Compute for each trip the average speed of the bicyclist, by taking the 
--  distance travelled computed in the previous question (which is in miles) and 
--  divide by the length in hours (the length is stored in seconds).  For the 10 
--  fastest trips, return the trip ID, bike ID, and the speed as mph.
Select Top 10 TripID,BikeID,(SQRT(SQUARE(69*((Select Latitude From Stations Where StationID = FromStation)-(Select Latitude From Stations Where StationID = ToStation))) + SQUARE(52*
((Select Longitude From Stations Where StationID = FromStation)-(Select Longitude From Stations Where StationID = ToStation))))) / (TripDuration/3600.0) AS mph
From Stations,Trips
Group By TripID,BikeID,FromStation,ToStation,TripDuration
Order By mph DESC