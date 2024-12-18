with hackers_id_com_max as (
    SELECT "Submissions".hacker_id, "Submissions".challenge_id
    FROM "Submissions" join "Challenges" 
          on "Submissions".challenge_id = "Challenges".challenge_id
          JOIN "Difficulty" 
                on "Difficulty"."difficulty_level" = "Challenges"."difficulty_level" and
                "Difficulty"."score" = "Submissions"."score" 
),
hackers_com_numero as (
    SELECT "hacker_id", "name", COUNT(challenge_id) as aparicoes
    FROM hackers_id_com_max natural join "Hackers"
    GROUP BY "hacker_id", "name" 
) 
SELECT "hacker_id", "name"
FROM hackers_com_numero
WHERE aparicoes > 1
ORDER BY aparicoes DESC , "hacker_id" ASC