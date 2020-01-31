#How many airplanes have listed speeds?  What is the minimum listed speed and the maximum listed speed?

SELECT count(*) FROM flights.planes
WHERE speed IS NOT NULL
UNION
SELECT min(speed) FROM planes
WHERE speed is NOT NULL
UNION
SELECT max(speed) FROM planes
WHERE speed is NOT NULL;

#What is the total distance flown by all of the planes in January 2013?  
#What is the total distance flown by all of the planes in January 2013 where the tailnum is missing?

SELECT sum(distance) FROM flights.flights
WHERE year = '2013' and month = '1'
UNION
SELECT sum(distance) FROM flights.flights
WHERE year = '2013' and month = '1' and tailnum ='';

#3.What is the total distance flown for all planes on July 5, 2013 grouped by aircraft manufacturer?  
#Write this statement first using an INNER JOIN, then using a LEFT OUTER JOIN.  
#How do your results compare?
SELECT planes.manufacturer, sum(flights.distance)
From flights
INNER JOIN planes ON planes.tailnum = flights.tailnum
WHERE flights.year = 2013 and month = 7 and day = 1
group by manufacturer;

SELECT planes.manufacturer, sum(flights.distance)
From flights
LEFT OUTER JOIN planes ON planes.tailnum = flights.tailnum
WHERE flights.year = 2013 and month = 7 and day = 1
group by manufacturer;

#ANSWER: On the left outer join there is an additional 146141 where the tailnum value is blank or NULL


#4.Write and answer at least one question of your own choosing that joins information from at least three of the tables in the flights database. 
#Most least and frequent plane used from carrier on 12-24-2013
SELECT max(planes.tailnum), min(planes.tailnum), airlines.carrier
From flights
INNER JOIN planes ON planes.tailnum = flights.tailnum
INNER JOIN  airlines on airlines.carrier = flights.carrier
WHERE flights.year = 2013 and flights.month = 12 and day = 24
group by airlines.carrier;