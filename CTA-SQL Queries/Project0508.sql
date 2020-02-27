-- Project0508.sql
-- 8.	For each hour of the day, list the percentage of bikes checked out during --  that hour relative to the other hours of the day.
Select StartingHour, (Count(StartingHour)* 100.0 / (Select Count(*) From Trips)) As Percentage
From Trips
Group By StartingHour
Order By StartingHour ASC