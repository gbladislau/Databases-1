WITH pilotos_com_corridas AS (SELECT DISTINCT driverId
    FROM drivers
    NATURAL JOIN results)
SELECT concat(forename,' ', surname) as Piloto
FROM drivers as d
LEFT JOIN pilotos_com_corridas as pcc
ON d.driverId = pcc.driverId
WHERE pcc.driverId IS NULL
