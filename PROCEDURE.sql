//PROCEDURE
-----------
DECLARE
	a number;
	b number;
	c number;
	PROCEDURE findmin(x IN number,y IN number,z OUT number)IS
	BEGIN
		IF x<y THEN
			z:=x;
		ELSE
			z:=y;
		END IF;
	END;
	BEGIN
		a:=23;
		b:=45;
		findmin(a,b,c);
		dbms_output.put_line('Minimum of(23,45):'||c);
	END;
	/
//FUNCTION
-----------
DECLARE
	a number;
	b number;
	c number;
	PROCEDURE findmin(x IN number,y IN number,z OUT number)IS
	BEGIN
		IF x<y THEN
			z:=x;
		ELSE
			z:=y;
		END IF;
	END;
	BEGIN
		a:=23;
		b:=45;
		findmin(a,b,c);
		dbms_output.put_line('Minimum of(23,45):'||c);
	END;
	/
	
	
	
create table customers (id number(5),name varchar(30),salary number(15));
insert into customers values(&id,'&name',&salary);
CREATE OR REPLACE FUNCTION totalCustomers
RETURN number IS
	total number(2):=0;
BEGIN
	SELECT count(*) into total
	FROM customers;
	
	RETURN total;
END;
/
//ON TERMINAL REMAINING
DECLARE
  2  	c number(2);
  3  BEGIN
  4  	c:=totalCustomers();
  5  	dbms_output.put_line('Total no. of Customers: '||c);
  6  END;
  7  /
Total no. of Customers: 0

PL/SQL procedure successfully completed.


//CURSOR
---------
create table electricity(cons_id varchar(4) primary key,c_name varchar(20),rent number(2) check(rent=20),unit number(6));
insert into electricity values('&cons_id','&c_name',&rent,&unit);
ALTER TABLE electricity add(total number(6,2));
*/

//ON TERMINAL REMAINING
DECLARE
  2  v_total electricity.total%TYPE;
  3  CURSOR c IS SELECT * FROM  electricity;           
  4  BEGIN
  5  	FOR i IN c LOOP
  6  		BEGIN 
  7  			IF i.unit <= 40 THEN
  8  				v_total := i.rent;
  9  			ELSIF i.unit <= 80 THEN
 10  				v_total := i.rent + (i.unit - 40) * 0.40;
 11  			ELSE 
 12  				v_total := i.rent + (40 * 0.40) + (i.unit-80)*1.40;
 13  			END IF;
 14  			UPDATE electricity
 15  			SET total=v_total
 16  			WHERE cons_id=i.cons_id;
 17  		END;
 18  	END LOOP;
 19  	COMMIT;
 20  END;
 21  /
