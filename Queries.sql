-- 6.1 Уникальный номер сотрудника, его ФИО и стаж работы – для всех сотрудников компании

SELECT 
    "Id" AS "Уникальный номер сотрудника"
    , "Fio" AS "ФИО"
	, CEIL(EXTRACT(YEAR FROM AGE(CURRENT_DATE, public."Employee"."StartDate"))::numeric) AS "Стаж в годах"
FROM public."Employee"

-- 6.2 Уникальный номер сотрудника, его ФИО и стаж работы – только первых 3-х сотрудников

SELECT
    "Id" AS "Уникальный номер сотрудника",
    "Fio" AS "ФИО",
	CEIL(EXTRACT(YEAR FROM AGE(CURRENT_DATE, public."Employee"."StartDate"))::numeric) AS "Стаж в годах"
FROM public."Employee"
LIMIT 3

	-- 6.3 Уникальный номер сотрудников - водителей

SELECT "Id" FROM public."Employee"
WHERE "Post" = 'Водитель'

-- 6.4 Выведите номера сотрудников, которые хотя бы за 1 квартал получили оценку D или E

SELECT DISTINCT "EmployeeId" FROM public."Award"
WHERE "Rank" = 'D' OR "Rank" = 'E'

-- 6.5 Выведите самую высокую зарплату в компании.

SELECT MAX("Sallary")
FROM public."Employee"

-- a.     Попробуйте вывести не просто самую высокую зарплату во всей команде, а вывести именно фамилию сотрудника с самой высокой зарплатой.

SELECT "Fio"
FROM public."Employee"
WHERE "Sallary" = (
    SELECT MAX("Sallary")
    FROM public."Employee"
);

-- b.     Попробуйте вывести фамилии сотрудников в алфавитном порядке

SELECT "Fio"
FROM public."Employee"
ORDER BY "Fio" ASC

-- c.     Рассчитайте средний стаж для каждого уровня сотрудников

SELECT 
    "PostLevel",
    AVG(EXTRACT(YEAR FROM AGE(CURRENT_DATE, "StartDate"))::INT) AS avg_years_experience
FROM 
    public."Employee"
GROUP BY "PostLevel"

-- d.     Выведите фамилию сотрудника и название отдела, в котором он работает

SELECT 
    "Fio"
	, d."Name"
FROM public."Employee" AS e
LEFT JOIN public."Department" AS d ON
	e."DepartmentId" = d."Id"


