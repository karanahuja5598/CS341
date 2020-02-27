-- Project0509.sql
-- 9.	The station contains a location as latitude and longitude.  Compute for 
--  each trip the distance covered by that trip, using the following equation to 
--  approximate: sqrt( (69 miles * difference in latitude)^2 + (52 miles * 
--  difference in longitude)^2 ).  For this computation, use the SQRT function and 
--  SQUARE function in SQL.  For the 10 longest trips, return the trip ID, 
--  starting station ID, ending station ID, and distance travelled as Distance.
Select Top 10 TripID,FromStation,ToStation,(SQRT(SQUARE(69*((Select Latitude From Stations Where StationID = FromStation)-(Select Latitude From Stations Where StationID = ToStation))) + SQUARE(52*
((Select Longitude From Stations Where StationID = FromStation)-(Select Longitude From Stations Where StationID = ToStation))))) AS Distance
From Stations,Trips
Group By TripID,FromStation,ToStation
Order By Distance DESC