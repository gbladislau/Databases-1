SELECT "a.NAME" 
from "CITY" as a, "COUNTRY" as b 
where LIKE("b.NAME",'Africa') and
      "a.COUNTRYCODE" = "b.CODE"