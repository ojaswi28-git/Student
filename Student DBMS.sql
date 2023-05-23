create table STUDENT(student_id int primary key,student_name varchar(20) NOT NULL,street varchar(20) NOT NULL,state varchar(20) NOT NULL,city varchar(20) NOT NULL,pin int NOT NULL,DOB date NOT NULL)
create table STUD_HOBBY(student_id int,hobby varchar(20),primary key(student_id,hobby));
create table COURSE(course_id int primary key,course_name varchar(20) NOT NULL);
create table LECTURER(lecturer_id int primary key,lecturer_name varchar(20) NOT NULL,course_id int,foreign key(course_id) references Course(course_id))
create table SUBJECT(subject_id int primary key,subject_name varchar(20) NOT NULL,lecturer_id int,foreign key(lecturer_id) references Lecturer(lecturer_id))

insert into STUDENT values(1,'abc','abc','haryana','sonipat',131001,'01-JAN-2023')
insert into STUDENT values(2,'abc','abc','haryana','gurugram',110038,'01-JAN-2023')
insert into STUDENT values(3,'abc','abc','haryana','gurugram',131001,'01-JAN-2023')
insert into STUDENT values(4,'abc','abc','haryana','rohtak',11111,'01-FEB-2023')
insert into STUDENT values(5,'abc','abc','haryana','karnal',110033,'01-MAR-2023')

insert into STUD_HOBBY values(1,'cricket')
insert into STUD_HOBBY values(1,'football')
insert into STUD_HOBBY values(2,'cricket')
insert into STUD_HOBBY values(4,'basketball')
insert into STUD_HOBBY values(5,'badminton')

insert into COURSE values(100,'BTECH')
insert into COURSE values(101,'BSC')
insert into COURSE values(102,'MSC')
insert into COURSE values(103,'MTECH')
insert into COURSE values(104,'BDES')

insert into LECTURER values(10,’DEF’,101) 
insert into LECTURER values(30,’ABC,100)
insert into LECTURER values(40,'ABC',102)
insert into LECTURER values(50,'ABC',103)
insert into LECTURER values(20,'ABC',101)

insert into SUBJECT values(201,’ADA’,10)
insert into SUBJECT values(202,’COA’,30) 
insert into SUBJECT values(203,’OS’,20) 
insert into SUBJECT values(200,’DBMS’,20) 
insert into SUBJECT values(204,'DE',50)

select * from STUDENT

select * from STUD_HOBBY

select * from COURSE

select * from LECTURER

select * from SUBJECT

update STUDENT set student_name='RAHUL' where DOB='01-JAN-2023' 
update STUD_HOBBY set hobby='skating' where student_id=5 
update LECTURER set lecturer_name='Geetanjali Maam' where lecturer_name='ABC' 

select * from STUDENT 
select * from STUD_HOBBY 
select * from LECTURER 

insert into STUDENT values(6,'abc','abc','haryana','delhi',110081,'01-JAN-2023') 
select * from STUDENT 
delete from STUDENT where city!='delhi'
delete from STUD_HOBBY where hobby='football'
delete from SUBJECT where lecturer_id=10

select * from STUDENT
select * from STUD_HOBBY
select * from SUBJECT

insert into STUD_HOBBY values(6,'volleyball')
select * from STUD_HOBBY 
update STUDENT set student_name='ROHAN' where student_id in(select student_id from STUD_HOBBY) 
select * from STUDENT     

update COURSE set course_name='DSA' where course_id in(select course_id from LECTURER)
select * from COURSE
update SUBJECT set subject_name='OOPS' where lecturer_id in(select lecturer_id from LECTURER)
select * from SUBJECT

select * from STUDENT natural join STUD_HOBBY
select * from STUDENT inner join STUD_HOBBY on(STUDENT.STUDENT_id=STUD_HOBBY.STUDENT_id)
select * from LECTURER full outer join COURSE on(LECTURER.COURSE_ID=COURSE.COURSE_id)
select * from LECTURER left outer join COURSE on(LECTURER.COURSE_ID=COURSE.COURSE_id) 
select * from LECTURER right outer join COURSE on(LECTURER.COURSE_ID=COURSE.COURSE_id) 

select count(STUDENT_NAME), STUDENT_ID from STUDENT group by STUDENT_ID 
select count(LECTURER_NAME), LECTURER_ID from LECTURER group by LECTURER_ID  
select min(COURSE_NAME),COURSE_ID from COURSE group by COURSE_ID 
select max(COURSE_NAME),COURSE_ID from COURSE group by COURSE_ID 
select count(SUBJECT_NAME),SUBJECT_ID from SUBJECT group by SUBJECT_ID 
select avg(LECTURER_ID),COURSE_ID from LECTURER group by COURSE_ID 
select count(COURSE_NAME),COURSE_ID from COURSE group by COURSE_ID having COURSE_ID=100 
select count(COURSE_NAME),COURSE_ID from COURSE group by COURSE_ID having COURSE_ID>100 
select count(STUDENT_NAME), STUDENT_ID from STUDENT group by STUDENT_ID having STUDENT_ID<5  
select count(STUDENT_NAME), STUDENT_ID from STUDENT group by STUDENT_ID having STUDENT_ID<10  
select avg(LECTURER_ID),COURSE_ID from LECTURER group by COURSE_ID  
select avg(LECTURER_ID),COURSE_ID from LECTURER group by COURSE_ID order by count(LECTURER_NAME)  
select count(LECTURER_ID),COURSE_ID from LECTURER group by COURSE_ID order by count(LECTURER_NAME) 
select count(LECTURER_ID),COURSE_ID from LECTURER group by COURSE_ID order by count(LECTURER_ID)  
select count(LECTURER_ID),COURSE_ID from LECTURER group by COURSE_ID order by count(LECTURER_ID),COURSE_ID  
select count(SUBJECT_NAME),SUBJECT_ID from SUBJECT group by SUBJECT_ID order by SUBJECT_ID  

create or REPLACE TRIGGER T1 
After update 
on STUD_HOBBY 
    for each row 
begin  
dbms_output.put_line('HELLo'); 
end;
update STUD_HOBBY set hobby='play' where hobby='cricket'

create or REPLACE TRIGGER T1 
After update 
on STUD_HOBBY 
begin  
dbms_output.put_line('HELLo'); 
end;
update STUD_HOBBY set hobby='cricket' where hobby='play' 

create or REPLACE TRIGGER T1 
After update 
on STUD_HOBBY  
for each row 
    declare 
 student_id int;    
begin  
dbms_output.put_line('HELLo'); 
student_id:=10; 
end;
update STUD_HOBBY set student_id=student_id+10     

create table stud1(id int, name varchar(20))
create sequence s1  
start with 1 
increment by 1 
minvalue 0 
maxvalue 100 
nocycle
insert into stud1 values (s1.nextval,'abc') 
select * from stud1 

create table stud2(id int, name varchar(20)) 
create sequence s2 
start with 1 
increment by 1 
minvalue 1 
maxvalue 100 
cache 40 
cycle
insert into stud2 values (s2.nextval,'abc') 
select * from stud2 

create index i1 
on stud1(id)
create index ind2 
on stud2(id, name)

create view v1 as 
select * from stud1 
where id<20
select * from v1 

create table stud3(id int primary key, marks int) 
insert into stud3 values ( 1, 78) 
insert into stud3 values ( 2, 45) 
insert into stud3 values ( 3, 90) 
insert into stud3 values ( 4, 23) 
insert into stud3 values ( 23, 24) 

create view v2 as  
select * from stud1 natural join stud3
select * from v2 

create view v3 as 
select * from v1 natural join v2
select * from v3 

create or replace view v4 as 
select marks from stud2
insert into v4 values('def') 
 select * from stud2 


create or replace view v4 as 
select id from stud2
insert into v4 values (10) 
select * from stud2
