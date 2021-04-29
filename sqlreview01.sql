CREATE TABLE employees 
(  
  id number(9), 
  name varchar2(50), 
  state varchar2(50), 
  salary number(20),
  company varchar2(20)
);

INSERT INTO employees VALUES(123456789, 'John Walker', 'Florida', 2500, 'IBM');
INSERT INTO employees VALUES(234567890, 'Brad Pitt', 'Florida', 1500, 'APPLE');
INSERT INTO employees VALUES(345678901, 'Eddie Murphy', 'Texas', 3000, 'IBM');
INSERT INTO employees VALUES(456789012, 'Eddie Murphy', 'Virginia', 1000, 'GOOGLE');
INSERT INTO employees VALUES(567890123, 'Eddie Murphy', 'Texas', 7000, 'MICROSOFT');
INSERT INTO employees VALUES(456789012, 'Brad Pitt', 'Texas', 1500, 'GOOGLE');
INSERT INTO employees VALUES(123456710, 'Mark Stone', 'Pennsylvania', 2500, 'IBM');

SELECT *
FROM employees;

CREATE TABLE companies 
(  
  company_id number(9), 
  company varchar2(20),
  number_of_employees number(20)
);

INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(100, 'APPLE', 21000);

SELECT * FROM companies;


SELECt * FROM employees;

SELECT
    company,name
FROM employees
WHERE company IN(SELECT company from companies where number_of_employees>15000);



SELECT state,salary
    
FROM employees
where company in(select company from  companies WHERE company_id<102)
order by state;


SELECT company_id,number_of_employees
from companies
where company in(SELECT company FROM  employees
where state='Florida');

SELECT company,number_of_employees,(SELECT Avg(salary)
    
FROM employees WHERE companies.company=employees.company) ortalamaMaas
from companies;

SELECT company, count(state) toplam_state
    
FROM employees group by company;


SELECT company_id,(select sum(salary)  FROM employees 
where companies.company=employees.company) toplam_odeme
    
FROM companies;






