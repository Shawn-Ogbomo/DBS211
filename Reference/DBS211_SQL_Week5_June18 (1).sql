--***************************************************************************************
-- DBS211 Lecture SQL Statement
-- June 16, 2020
--***************************************************************************************
-- CREATE TABLE <tablename> (
--     <fieldname_1> <datatype> <constraints>,
--     <fieldname_2> <datatype> <constraints>,
--      ....
--     <fieldname_n> <datatype> <constraints>,
--     CONSTRAINT <constraintname> <constraintType> <constaint parameters> 
-- );    

-- drop table memeber;
-- name constraints
-- PK   FK  UK  CK  NN

-- Create table named trainer with the constraints defined after column definition

create table trainer (
    t_id number(2),
    t_name varchar(50) not null,
    email varchar(3),
    phone varchar(10),
    w_hours number(2) not null,
    m_level char(1),
    constraint trainer_tid_pk
    primary key (t_id),
    constraint trainer_email_uk
    unique (email),
    constraint trainer_hours_ck
    check (w_hours >= 0 and w_hours <= 40), -- between 0 and 40
    constraint trainer_level_ck
    check (m_level in ('A', 'B', 'C') and m_level is not null)
   
);
-- Create table named member, you can see the commnted foreign key definition
-- You can define a foreign key in create statement or later in Alter statement.
create table member (
    mem_id number(3) primary key, 
    mem_name varchar(40) not null, 
    email varchar(20) unique, 
    age number(2) check(age > 18), 
    trainer_id number(2)
   -- constraint member_trainerid_fk
   -- foreign key (trainer_id)
   -- references trainer (t_id)
); 
-- add the foreign key using Alter statement
alter table member
add constraint member_trainerid_fk
foreign key (trainer_id)
references trainer (t_id);

-- To drop a constraint
alter table member
drop constraint member_trainerid_fk;

-- add a new column named score of type number in member table:
alter table member
add score number(3) not null;

-- add a constraint on column score 
alter table member
add constraint member_score_ck
check (score >= 0 and score < 1000);

-- drop the score column
alter table member
drop column score;

-- insert data to the member table
insert into member (MEM_ID, MEM_NAME, EMAIL, AGE, TRAINER_ID) 
            values (100, 'Sarah', 's@email.com', 20, null);
insert into member (MEM_ID, MEM_NAME, EMAIL, AGE, TRAINER_ID) 
            values (101, 'Nick', 'n@email.com', 20, 22);


-- create a table exactly the same as table member with data
create table new_member as
(select * from member);

select * from new_member;

-- remove the new_member table
drop table new_member;

-- create a table exactly the same as table member without data 
create table new_member as
(select * from member where 1 = 2);


    

