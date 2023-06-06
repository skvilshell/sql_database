select * from товар;

select count(*) as количество_сотрудников from сотрудник;

select count( DISTINCT магазин) as количество_магазинов from расход;

select * from товар where код = 
	(select товар from склад where количество = 
		(select max(количество) from склад));


select 
	код,
	concat(фамилия," ",имя," ",отчество) as ФИО,
	паспорт
from сотрудник;

select count(*) from расход where скидка is null;

select * from поставщик where наименование like "Р%";

select расход.код, расход.количество, расход.дата, (расход.наценка* товар.цена *  * )