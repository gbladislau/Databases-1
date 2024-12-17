with c_nap as 
(select "name", count("raceId") as naparicoes
    from constructors join results 
        on constructors."constructorId" = results."constructorId" 
    where constructors."constructorId" in (select "constructorId" from results)
    group by constructors."name") ,
minimo as (select MIN(naparicoes) from c_nap )
select c_nap."name" as "Equipe", naparicoes as "Aparicoes" 
    from minimo join c_nap on naparicoes = min
      


