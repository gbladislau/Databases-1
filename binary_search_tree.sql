with raizes as (
    select "N" from "BST"
    where "P" is null
),
leaves as (
   select "N" from "BST"
   where "N" not in (select "P" from "BST" where "P" is not null)
),
nos as (
   select "N" from "BST"
   where "N" not in (select * from raizes 
                          union
                     select * from leaves)
) 
select "N", case 
         when "N" in (select * from raizes) then 'Root'
         when "N" in (select * from leaves) then 'Leaf'
         when "N" in (select * from nos) then 'Inner'
         end as "T"
from "BST" order by "N" 

