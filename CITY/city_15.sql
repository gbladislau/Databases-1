select distinct "COUNTRY"."CONTINENT", FLOOR(AVG("CITY"."POPULATION"))
    from "CITY" join "COUNTRY" 
        on "CITY"."COUNTRYCODE" = "COUNTRY"."CODE"
    group by  "COUNTRY"."CONTINENT"
   