select distinct SUM("CITY"."POPULATION")
    from "CITY" join "COUNTRY" 
        on "CITY"."COUNTRYCODE" = "COUNTRY"."CODE"
    where  "COUNTRY"."CONTINENT" LIKE 'Asia'
    group by  "COUNTRY"."CONTINENT"
   