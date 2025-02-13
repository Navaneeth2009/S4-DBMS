create table salesman1(salesman_id number(5) primary key, name char(15),city char(5), commission decimal(5,2));
create table orders1(ord_no number(5),purch_amt number(4), ord_date date,cust_id number(5),salesman_id number(5),foreign key(salesman_id) references salesman1(salesman_id));
create table customer1(cust_id number(5),cust_name char(15), city char(5),grade char(1),salesman_id number(5),foreign key(salesman_id) references salesman1(salesman_id));
insert into salesman1 values(&salesman_id,'&name','&city',&commission);
insert into orders1 values(&ord_no,&purch_amt, '&ord_date',&cust_id,&salesman_id);
insert into customer1 values(&cust_id, '&cust_name', '&city','&grade',&salesman_id);
select salesman_id,name,commission from salesman1;
select ord_date,salesman_id,ord_no,purch_amt from orders1;
select distinct salesman_id from orders1;
select name from salesman1 where city='kochi';
select * from customer1 where grade='a';
select ord_no,ord_date,purch_amt from orders1 where salesman_id=1;
create table nobel_win1(year number(4),subject char(15),winner char(10),country char(3),cat char(15));
insert into nobel_win1 values(&year,'&subject','&winner','&country','&cat');
select year,subject,winner from nobel_win where year=1970;
select winner from nobel_win where year=1971 and subject='Lit';
select year,subject from nobel_win where winner='Mark';
select winner from nobel_win where subject='physics' and year>1950;
select year,subject,winner,country from nobel_win where subject='chemistry' and year>=1965 and year<=1975;
select * from nobel_win where winner like'Mark%';
error : select year,subject,winner,country,cat from nobel_win where (subject='physics' and year=1970) union (select year,subject,winner,country,cat from nobel_win where (subject='chemistry' and year=1971));
select * from nobel_win where year=1970 and subject not in('Physiology','Economics');
select * from nobel_win where subject not like'P%' order by year;
create table products(p_id number(1),p_price number(4),p_name char(5));
insert into products values(&p_id,&p_price,'&p_name');
select min(p_price ) as Minimum_Price from products;
select max(p_price ) as Maximum_Price from products;
select count(p_id) as Total_no_of_products from products;
select sum(p_price) as Total_Amount from products;
select avg(p_price) as average_price from products;
//feb 13
case manipulative functions (LOWER,UPPER,INITCAP)
select LOWER ('ASIET IS FOR TECH GEEKS ONLY') from dual;
select UPPER ('asiet is only for geeks')from dual;
select INITCAP('Ai is a sub-branch of cse') from dual;
character manipulatve functions (Concat , length ,substr , instr , lpad , rpad , trim , replace ).
select concat ('CSE','-AI') from dual;
select concat(NULL,'CSE') from dual;
select LENGTH('Learning is always fun') from dual;
select length ('    Database') from dual;
select substr ('Database Management System') from dual;
select substr ('Database Management System',9,7) from dual;
select instr ('Google apps are the great application','app') from dual;
select instr ('Google apps are the great application','app',1,2) from dual;
select lpad('100',5,'*')from dual;
select rpad('100',5,'*')from dual;
select lpad('hello',21,'asiet') from dual;
select rpad('earn',19,'respect') from dual;
select trim ('A' from 'Android') from dual;
select trim('    Android') from dual;
select replace ('Data management','Data','Database') from dual;
//ddl and dml queries in next lab [insert,create,constraints,insert atleat 7 rows
// right top roll and name every assign as file ,file name is roll no.
