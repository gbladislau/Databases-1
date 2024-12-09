-- select * from prereq where course_id like 'ELE16191'
-- select * from prereq where prereq_id like 'MAT15936'

/*
WITH t AS (
    SELECT prereq_id 
    FROM prereq 
    WHERE course_id LIKE 'ELE16191'
)
SELECT prereq_id from prereq where course_id in (select * from t); */

/*
WITH t AS (
    SELECT course_id
    FROM prereq 
    WHERE prereq_id LIKE 'MAT15936'
)
SELECT course_id from prereq where prereq_id in (select * from t); */

with recursive rec_prereq(course_id, prereq_id) as (
    select course_id, prereq_id
    from prereq
    where prereq.prereq_id like 'MAT15936'
  union
    select rec_prereq.course_id, prereq.prereq_id
    from rec_prereq, prereq 
    where rec_prereq.course_id = prereq.prereq_id
) 
select * from rec_prereq 