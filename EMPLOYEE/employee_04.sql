with salarios_totais as (
    select ("salary" * "months") as salario_total from "Employee"
),
maior_s_total as (
    select MAX(salario_total) as maximo from salarios_totais
),
qntde_pessoas_salario_total as (
    select count(*) as aparicoes
    from maior_s_total, salarios_totais
    where salario_total = maximo
) 
select concat(maximo, ' ', aparicoes) 
    from maior_s_total,qntde_pessoas_salario_total 