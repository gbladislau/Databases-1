select floor(avgPop) from
     (select AVG("POPULATION") as avgPop from "CITY")
      