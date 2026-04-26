use school;

select * 
from pyschooldata;

select Class , Total
from pyschooldata;

-- check class with male domination
select Class , Boys
from pyschooldata
order by Boys DESC; #V class have more highest males present

select Class , Girls
from pyschooldata
order by Girls DESC; #I CLASS have more girls present

select Class ,Girls
from pyschooldata
where Girls = (select min(Girls)
from pyschooldata); #Nursery have only one girl

select Class ,Boys
from pyschooldata
where Boys = (select min(Boys)
from pyschooldata);


select Class , Total
from pyschooldata
where Girls=Boys; # none 


select * from
pyschooldata;


--  check gender gap where - represent more girls and + represent more boys
select Class, Boys,Total
from pyschooldata
where `Gender Gap` >=3;



select Class, Girls,Total
from pyschooldata
where `Gender Gap` <=-1; #More Dominated Classes


select  Class , Total , `Category (General)` ,`Category (SC/OBC)`
from pyschooldata
where `Category (General)` >=3 
order by `Category (General)` desc
limit 1; #3rd class


select  Class , Total , `Category (General)` ,`Category (SC/OBC)`
from pyschooldata
where `Category (SC/OBC)` >=25
order by  `Category (SC/OBC)` DESC; #1class

#updating 0 values to null
UPDATE pyschooldata
SET `Kabaddi Boys` = NULL
WHERE `Kabaddi Boys` = 0;

UPDATE pyschooldata
SET `Kabaddi Girls` = NULL
WHERE `Kabaddi Girls` = 0;

UPDATE pyschooldata
SET `Kho-Kho Players Boys` = NULL
WHERE `Kho-Kho Players Boys` = 0;

UPDATE pyschooldata
SET `Kho-Kho Players Girls` = NULL
WHERE `Kho-Kho Players Girls` = 0;


#analysing the kabaddi game
with check_total(Class, Total , kabaddi_boys, kabaddi_girls, Kabaddi_Total, Kabaddi_Level) as(
select Class , Total ,`Kabaddi Boys`, `Kabaddi Girls`,`Kabaddi Boys` + `Kabaddi Girls` ,`Kabaddi Level`
from pyschooldata
),
total_kabaddi as(
select *
from check_total
where Kabaddi_Total is not null
)
select *
from total_kabaddi;



with check_total(Class, Total , kabaddi_boys, kabaddi_girls, Kabaddi_Total, Kabaddi_level) as(
select Class , Total ,`Kabaddi Boys`, `Kabaddi Girls`,`Kabaddi Boys` + `Kabaddi Girls` ,`Kabaddi Level`
from pyschooldata
),
total_kabaddi as(
select *
from check_total
where Kabaddi_Total is not null
)
,dom_game as(
select *
from total_kabaddi
where kabaddi_boys < kabaddi_girls  
)
select *
from dom_game;


with check_total(Class, Total , kabaddi_boys, kabaddi_girls, Kabaddi_Total, Kabaddi_level) as(
select Class , Total ,`Kabaddi Boys`, `Kabaddi Girls`,`Kabaddi Boys` + `Kabaddi Girls` ,`Kabaddi Level`
from pyschooldata
),
total_kabaddi as(
select *
from check_total
where Kabaddi_Total is not null
)
,dom_game as(
select *
from total_kabaddi
where kabaddi_boys >= kabaddi_girls 
)
select *
from dom_game;

select *
from pyschooldata;

##analysing the kho_kho game
with check_total(Class, Total , Kho_Kho_Players_Girls,Kho_Kho_Players_Boys, KHO_KHO_Total, KHO_KHO_level) as(
select Class , Total ,`Kho-Kho Players Girls`, `Kho-Kho Players Boys`,`Kho-Kho Players Boys` + `Kho-Kho Players Girls` ,`Kho-Kho Level`
from pyschooldata
),
total_kho_kho as(
select *
from check_total
where KHO_KHO_Total is not null
)
select *
from total_kho_kho;



with check_total(Class, Total , Kho_Kho_Players_Girls,Kho_Kho_Players_Boys, KHO_KHO_Total, KHO_KHO_level) as(
select Class , Total ,`Kho-Kho Players Girls`, `Kho-Kho Players Boys`,`Kho-Kho Players Boys` + `Kho-Kho Players Girls` ,`Kho-Kho Level`
from pyschooldata
),
total_kho_kho as(
select *
from check_total
where KHO_KHO_Total is not null
)
,dom_game as(
select *
from total_kho_kho
where Kho_Kho_Players_Boys < Kho_Kho_Players_Girls )
select *
from dom_game;






with check_total(Class, Total , Kho_Kho_Players_Girls,Kho_Kho_Players_Boys, KHO_KHO_Total, KHO_KHO_level) as(
select Class , Total ,`Kho-Kho Players Girls`, `Kho-Kho Players Boys`,`Kho-Kho Players Boys` + `Kho-Kho Players Girls` ,`Kho-Kho Level`
from pyschooldata
),
total_kho_kho as(
select *
from check_total
where KHO_KHO_Total is not null
)
,dom_game as(
select *
from total_kho_kho
where Kho_Kho_Players_Boys >= Kho_Kho_Players_Girls 
)
select *
from dom_game;

