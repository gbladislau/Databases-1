with recursive primo (numero) as (
    VALUES(2)
  union 
    select numero
    from primo
    where numero <= 1000 and numero + 1 % numero 
) 
select * from primo 