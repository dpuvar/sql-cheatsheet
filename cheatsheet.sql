create table employee(empno int,f_name varchar(20),l_name varchar(20),designation varchar(20),salary int,comm int,deptno int);

insert  into employee values(1001,'stefan','salvatore','business analyst',50000,NULL,40);
insert  into employee values(1002,'diana','lorrence','technical architect',70000,NULL,10);
insert  into employee values(1003,'james','madison','manager',80400,NULL,40);
insert  into employee values(1004,'jones','nick','hr analyst',47000,NULL,30);
insert  into employee values(1005,'lucy','gelller','hr associate',35000,200,30);
insert  into employee values(1006,'isaac','stefan','traineee',20000,NULL,40);
insert  into employee values(1007,'john','smith','clerk',12000,NULL,10);
insert  into employee values(1008,'nancy','gillbert','salesman',18000,300,10);

select  * from employee;


create table department(depno int,deptname varchar(20));

insert  into department values(10,'Marketing ');
insert  into department values(20,'General Management');
insert  into department values(30,'Operations ');
insert  into department values(40,'Finance ');
insert  into department values(50,'Sales ');
insert  into department values(60,'Human resources');
insert  into department values(70,'Purchase ');
insert  into department values(80,'IT');

select  * from department;

declare
fname varchar2(20):='dhruv';

begin
fname:='puvar';
dbms_output.put_line(fname);
end;
/


declare 
e_salary int;

begin
 select salary into e_salary from employee
 where empno =1001;
 dbms_output.put_line(e_salary);
end;

declare 
e_salary int;
fname varchar2(20);

begin
 select salary,f_name into e_salary,fname from employee
 where empno =1001;
 dbms_output.put_line(fname || ' has salary '||e_salary);
end;

declare 
fname employee.f_name%type;

begin
 select f_name into fname from employee
 where empno =1001;
 dbms_output.put_line(fname);
end;

declare 
pi constant int(7,6):=3.14532;

begin
 dbms_output.put_line(pi);
end;


declare 
pi constant int(7,6);

begin
 pi :=3.14532;

 dbms_output.put_line(pi);
end;

declare

pi constant int(7,6) default 3.14532;

begin
 dbms_output.put_line(pi);
end;

declare

pi constant int(7,6) not null default 3.14532;

begin
 dbms_output.put_line(pi);
end;

declare

e_num int := 9; 

begin
 if e_num > 18 then
    dbms_output.put_line('you can drive');
 
 end if;
    dbms_output.put_line('all d best');
end;

declare

e_num int := 9; 

begin
 if e_num > 18 then
    dbms_output.put_line('you can drive');
 else
    dbms_output.put_line('you cannot drive');
 end if;
    dbms_output.put_line('all d best');
end;

declare

e_num int := 9; 

begin
 if e_num > 18 then
    dbms_output.put_line('you can drive');
 else
    dbms_output.put_line('you cannot drive');
 end if;
    dbms_output.put_line('all d best');
end;

declare

e_num varchar(20) := 'F'; 

begin
 if e_num = 'A' then
    dbms_output.put_line('A-grade');
 elsif e_num = 'B' then
    dbms_output.put_line('B-grade');
 
 elsif e_num = 'C' then
    dbms_output.put_line('C-grade');
 
 elsif e_num = 'D' then
    dbms_output.put_line('D-grade');
 else
    dbms_output.put_line('fail');
 end if;
    dbms_output.put_line('all d best');
end;



declare
counter int:= 0;

begin
loop
counter:= counter + 1;
    dbms_output.put_line('counter is = '|| counter);
 
 if counter >=10 then
    exit;
  end if;
 
--  exit when counter=10;
end loop;
end;

declare
counter int:= 0;

begin
while counter <= 10  loop
    dbms_output.put_line('counter is = '|| counter);
counter:= counter + 1;
end loop;
end;


declare
begin
for counter in reverse 1..10 loop
    dbms_output.put_line('counter is = '|| counter);
end loop;
end;

select * from employee;

declare
fname varchar(20);

cursor dhruv is
select f_name from employee
where empno<1005;
begin
open dhruv;

loop

fetch dhruv into fname;
    dbms_output.put_line('employee name is : '|| fname);
 exit when dhruv%notfound;

end loop;
close dhruv;
end;

declare
fname varchar(20);

cursor dhruv(var_e_id int) is
select f_name from employee
where empno<var_e_id;

begin

open dhruv(1004);

loop

fetch dhruv into fname;
 exit when dhruv%notfound;
    dbms_output.put_line('employee name is : '|| fname);

end loop;
close dhruv;
end;


declare
fname varchar(20);

cursor dhruv(var_e_id int) is
select f_name from employee
where empno<var_e_id;

begin

open dhruv(1004);

loop

fetch dhruv into fname;
 exit when dhruv%notfound;
    dbms_output.put_line('employee name is : '|| fname);

end loop;
close dhruv;
end;

declare
fname varchar(20);

cursor dhruv(var_e_id int := 1003) is
select f_name from employee
where empno<var_e_id;

begin

-- open dhruv(1004);
open dhruv;

loop

fetch dhruv into fname;
 exit when dhruv%notfound;
    dbms_output.put_line('employee name is : '|| fname);

end loop;
close dhruv;
end;

declare
cursor dhruv is
select f_name from employee
where empno<1005;

begin
for emp_name in dhruv
loop
  dbms_output.put_line('employee name is : '|| emp_name.f_name);
end loop;
end;


declare
fname varchar(20);

cursor dhruv(var_e_id int := 1003) is
select f_name from employee
where empno<var_e_id;

begin
for emp_name in dhruv(1008)
loop
  dbms_output.put_line('employee name is : '|| emp_name.f_name);
end loop;
end;


declare
emp employee%rowtype;
begin
select * into emp from employee
where empno=1002;

dbms_output.put_line('employee name is : '|| emp.f_name ||'  '|| emp.salary);
end;

declare
emp employee.f_name%type;
begin
select f_name into emp from employee
where empno=1002;

dbms_output.put_line('employee name is : '|| emp);
end;

declare
emp employee%rowtype;
begin
select f_name into emp.f_name from employee
where empno=1002;

dbms_output.put_line('employee name is : '|| emp.f_name);
end;

declare 

cursor dhruv is
select f_name,salary from employee
where empno= 1002;

var_emp dhruv%rowtype;

begin
open dhruv;
fetch dhruv into var_emp;

dbms_output.put_line('employee name is : '|| var_emp.f_name);
dbms_output.put_line('employee salary is : '|| var_emp.salary);
close dhruv;
end;

declare 

cursor dhruv is
select f_name,salary from employee
where empno>1002;

var_emp dhruv%rowtype;

begin
open dhruv;
loop
fetch dhruv into var_emp;
exit when dhruv%notfound;

dbms_output.put_line('employee name is : '|| var_emp.f_name);
dbms_output.put_line('employee salary is : '|| var_emp.salary);
end loop;
close dhruv;
end;


declare
  cursor  dhruv is 
  select  f_name,salary from  employee 
  where  empno<1004;
  
  v_emp dhruv%ROWTYPE;
begin
  for v_emp in dhruv
    loop
      dbms_output.put_line(v_emp.f_name||' '||v_emp.salary);
    end loop;
end;

declare
type var_emp is record(
fname varchar2(20),
dname department.deptname%type
);

dhruv var_emp;
begin

select f_name,deptname into dhruv.fname,dhruv.dname 
from employee join department on employee.deptno = department.depno where empno =1001;

dbms_output.put_line(dhruv.fname||' '||dhruv.dname);

end;



create or replace function circle_area(rad float)
return float is
pi constant int(7,3) :=3.141;
area int (7,3);

begin
area :=pi*(rad*rad);

return area;

end;



begin 
 dbms_output.put_line(circle_area(25));
end;


create or replace procedure dhruv is
var_name varchar(20) := 'dhruv';
var_sal varchar(20) := '25252';

begin
  dbms_output.put_line('name is : '|| var_name || 'salary is : '||var_sal);
end dhruv;


execute dhruv;

exec dhruv;

begin
  dhruv;
end;


create or replace procedure dhruv_emp(dept_id int ,sal_raise int) is


begin
update employee set 
salary =salary *sal_raise
where deptno = dept_id;
end dhruv_emp;


execute dhruv_emp(30,20);

exec dhruv_emp(10,20);

begin
  dhruv_emp(10,20);
end ;


select * from employee



declare 
var_num int := 45;
var_deno int := 5;
result int;
exdiv_zero exception;

begin

if var_deno = 0 then
  raise exdiv_zero;
end if;

result := var_num / var_deno;
  dbms_output.put_line('division ans is : '|| result);

exception when exdiv_zero then
  dbms_output.put_line('error your denominator is 0!!');
end;


declare 
ex_age exception;
age int := 19;
pragma exception_init(ex_age,-20109);
begin

if age<18 then
  raise_application_error(-20109,'your age should be 18 or above for the drinks');

end if;

  dbms_output.put_line('you can drink');

exception when ex_age then
  dbms_output.put_line(sqlerrm);
end;






