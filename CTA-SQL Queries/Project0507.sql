-- Project0507.sql
-- 7.	For each hour of the day, list how many bikes were checked out during that time.
Select StartingHour, Count(StartingHour) As NumTrips
From Trips
Group By StartingHour
Order By StartingHour ASC