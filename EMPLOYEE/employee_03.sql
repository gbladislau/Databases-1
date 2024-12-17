with media_salario_correto as (
    select AVG("salary") as media_certa from "Employee"
),
salario_errado as (
    select REPLACE (CAST("salary" as Text),'0','') as salario
    from "Employee"
),
media_salario_errado as (
    select avg( CAST(salario AS int) ) as media_errada 
    from salario_errado
)
select CEILING( media_certa - media_errada ) as "QTDE_ERRO"
    from media_salario_correto, media_salario_errado
