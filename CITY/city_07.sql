SELECT a."NAME" 
from "CITY" as a, "COUNTRY" as b 
where a."COUNTRYCODE" = b."CODE" and like(b."CONTINENT", 'Africa')