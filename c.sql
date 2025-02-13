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
create table boat(bid int primary key,bname char(10),color char(10));
create table reserves(sid int,bid int,day date,foreign key(sid) references sailors(sid),foreign key(bid) references boat(bid));
create table sailors(sid int primary key,sname varchar(10),rating int,age int check(age>16 and age<100));
insert into boat values(&bid,'&bname','&color');
insert into sailors values(&sid,'&sname',&rating,&age);
//reserves have prob

1.find names of sailors who have resereved red or yellow boats
select s.sname  from sailors s,boat b,reserves r where s.sid=r.sid and b.bid=r.bid and(b.color='red' or b.color='yellow');
2.find all sailors who have rating 10 or have reserved boat 111.
select s.sid from sailors s where s.rating=10 union select r.sid from reserves r where r.bid=111;
3.find all sids of sailors who have reserved red boats but not yellow boats
select s.sid from sailors s,boat b,reserves r where s.sid=r.sid and r.bid=b.bid and b.color='red' minus
select s2.sid from sailors s2,boat b2,reserves r2 where s2.sid=r2.sid and r2.bid=b2.bid and b2.color='yellow';
4.find the name  of sailors who have reserved both red and yellow boat
select s.sname from sailors s,boat b where b.color='red' intersect
select s.sname from sailors s,boat b where b.color='yellow';
5.find nme of sailors who have reserved red boats and list in the order of age
select s.sname ,s.age from sailors s ,reserves r ,boat b where s.sid=r.sid and r.bid=b.bid and b.color='red' order by s.age;
6.find names of sailors who have reserved boat 103 [
select s.sname from sailors s where s.sid in (select r.sid from reserves r where r.bid=103);
select s.sname from sailors s where s.sid exists(select r.sid from reserves r where r.bid=103);
7. find names and age of youngest sailor
select s.sname,s.age from sailors s where s.age <= all(select age from sailors);
DATE FUNCTIONS:
select sysdate from dual;
select NEXT_DAY(sysdate,'Wed') from dual;
select ADD_months(sysdate,2) from dual;
select MONTHS_BETWEEN(sysdate,hiredate) from emp;
select LEAST('10-jan-2008','12-oct-2006')from dual;
select GREATEST('10-jan-2008','12-oct-2006')from dual;
