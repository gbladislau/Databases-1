with MAIOR as( 
    SELECT  "CITY", CHAR_LENGTH("CITY") as "TAM_MAIOR"
    FROM "STATION"
    ORDER BY "CITY" DESC
)