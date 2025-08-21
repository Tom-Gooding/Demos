DROP TABLE IF EXISTS first_table

create table first_table (
    subject VARCHAR,
    name VARCHAR,
    visit VARCHAR
);

-- alter the name of the table
alter table first_table RENAME TO test_table;

--add column
alter table test_table add COLUMN heart_rate int;

--add values to table
insert into test_table (subject, name, visit, heart_rate)
values ('S01', 'Tom', 'visit 1', '58'
);

--add multiple values to one column of data
insert into test_table (subject)
values ('Amanda'),( 'Ian'), ('Chey'), ('Brooke'), ('Chris'), ('Erin'), ('Alex');

--replace wrong data with correct data (subject vs. name)


--insert multiple rows of data into multiple columns
INSERT into test_table (name, visit, heart_rate) VALUES
('Amanda'),( 'Ian'), ('Chey'), ('Brooke'), ('Chris'), ('Erin'), ('Alex');

--add index colum
insert INTO test_table (index)
generate series(1,10);

--add index column for future referencing
alter table test_table add column idx serial; 

--drop column
alter table test_table
drop column idx;

-- more modern and standard-compliant way to make index
alter TABLE test_table add column idx INT generated always as identity; 

--make another column for practice
alter table test_table add column RHR int;

--insert multiple values for a row
update test_table
set rhr = 58
where idx = 1;

--try it a different wy
insert into test_table (name, visit, heart_rate, rhr)
values ('Amanda', 'Visit 1', 178, 64)

--alter table test_table rename column heart_rate to MHR
alter table test_table rename column heart_rate to MHR

--fix where names were accidentally placed in wrong column
update test_table 
set name = subject,
subject = null
where name is null;

--add sex as a column variable
alter table test_table add column sex VARCHAR;

delete from test_table
where name in ('S02');

update test_table
set
subject = case name   -- name is the control 
when 'Amanda' then 'S02'
when 'Ian' then 'S03'
when 'Chey' then 'S04'
when 'Brooke' then 'S05'
when 'Chris' then 'S06'
when 'Erin' then 'S07'
end;

update test_table
set
subject = case idx
when 8 then 'S09'
when 15 then 'S10'
else subject --need this here to keep current values when the idx doesn't match
end; 

update test_table
SET
sex = case idx
when 1 then 'M'
when 16 then 'F'
when 3 then 'M'
when 4 then 'F'
when 5 then 'F'
when 6 then 'M'
when 7 then 'F'
when 8 then 'M'
when 9 then 'F'
when 10 then 'M'
when 11 then 'F'
when 12 then 'F'
when 13 then 'M'
when 14 then 'F'
when 15 then 'M'
else sex
end;

update test_table
SET
subject = case idx
when 1 then 'S01'
else subject
end;