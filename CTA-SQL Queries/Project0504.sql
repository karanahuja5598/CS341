-- Project0504.sql
-- 4.	For each StationID, retrieve the number of trips taken 
-- from that station and to that station (as separate values).
Select Top 10 StationID,Count(FromStation) As NumTripsFrom,NumTripsTo
From (SELECT StationID,Count(ToStation) As NumTripsTo From Stations,Trips Where StationID = ToStation Group By StationID) As TripsTo,Trips
Where StationID = FromStation
Group By StationID,NumTripsTo
Order By (Count(FromStation) + NumTripsTo) DESC, StationID ASC