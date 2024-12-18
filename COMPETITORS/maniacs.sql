WITH qtde_challenges as (
    select count(*) as num_challenge 
    from "Challenges"
),
uniao as 
(
    select s.hacker_id, s.challenge_id, s.submission_id, s.score, d.score as max_score
    From "Submissions" s join "Challenges" c 
                             on s.challenge_id=c.challenge_id
                         join "Difficulty" d 
                             on c.difficulty_level=d.difficulty_level 
),
t1 as 
(
select hacker_id, challenge_id, max_score,
       count(*) as num_sub,
       max(score) as score
       from uniao 
       group by hacker_id, challenge_id, max_score
),
t2 as (select * from t1 where num_sub = 1 and score = max_score),
t3 as (select hacker_id, count(*) as num_challenge from t2 group by hacker_id)
select  name from t3 natural join "Hackers" natural join qtde_challenges
