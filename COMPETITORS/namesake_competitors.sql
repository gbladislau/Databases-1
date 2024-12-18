with hackers_id_com_max as (
    SELECT "Submissions".hacker_id, "Submissions".challenge_id
    FROM "Submissions" join "Challenges" 
          on "Submissions".challenge_id = "Challenges".challenge_id
          JOIN "Difficulty" 
                on "Difficulty"."difficulty_level" = "Challenges"."difficulty_level" and
                "Difficulty"."score" = "Submissions"."score" 
),
hackers_name_max AS (
    SELECT DISTINCT 
           "Hackers"."name", 
           h1."hacker_id", 
           COUNT(h1."challenge_id") AS qntd
    FROM hackers_id_com_max AS h1 natural join "Hackers"
    GROUP BY "Hackers"."name", h1.hacker_id
)
SELECT distinct h1."name"
FROM
    hackers_name_max as h1, 
    hackers_name_max as h2
WHERE
    h1."hacker_id" != h2."hacker_id" 
    AND h1."name" = h2."name"
    AND h1.qntd > 1 AND h2.qntd > 1 