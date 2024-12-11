 select (maxPop - minPop) as "POPULATION_DIFFERENCE" from (
     select max("POPULATION") as maxPop, min("POPULATION") as minPop 
         from "CITY")
      