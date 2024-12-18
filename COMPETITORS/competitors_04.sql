with hackers_id_com_score as (
    SELECT "Submissions".hacker_id, "Submissions".challenge_id, MAX(score) as max_score
    FROM "Submissions" join "Challenges" 
          on "Submissions".challenge_id = "Challenges".challenge_id
    GROUP BY "Submissions".hacker_id, "Submissions".challenge_id
),
hackers_scores as (
    SELECT hackers_id_com_score."hacker_id", "name", SUM(max_score) as pontuacao
    FROM hackers_id_com_score JOIN "Hackers" 
        ON hackers_id_com_score.hacker_id = "Hackers".hacker_id
    GROUP BY hackers_id_com_score.hacker_id, "Hackers"."name"
)
SELECT * 
FROM hackers_scores
where pontuacao > 0
ORDER BY pontuacao DESC , "hacker_id" ASC