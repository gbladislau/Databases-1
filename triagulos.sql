SELECT 
CASE
    WHEN "A" + "B" <= "C" or "B" + "C" <= "A" or "A" + "C" <= "B" then 'Nao Eh Triangulo'
    WHEN "A" = "B" AND "B" = "C"  then 'Equilatero'
    WHEN "A" = "B" or "B" = "C" or "A" = "C" then 'Isosceles'
    WHEN "A" != "B" AND "B" != "C" AND "A" != "C" then 'Escaleno'
END as classificacao, "A", "B", "C"
FROM "TRIANGLES"