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

--add visit numbers to all participant sessions
update test_table
set visit = 'visit 1'
where visit is null; 

update test_table
SET
rhr = case idx
-- when 1 then 
-- when 16 then 
when 3 then 58
when 4 then 62
when 5 then 73
when 6 then 51
when 7 then 49
when 8 then 60
when 9 then 62
when 10 then 54
when 11 then 67
when 12 then 69
when 13 then 61
when 14 then 69
when 15 then 65
else rhr
end;

update test_table
SET
MHR = case idx
-- when 1 then 
-- when 16 then 
when 3 then 198
when 4 then 180
when 5 then 178
when 6 then 170
when 7 then 200
when 8 then 199
when 9 then 180
when 10 then 182
when 11 then 172
when 12 then 169
when 13 then 189
when 14 then 190
when 15 then 192
else rhr
end;

---- want to test importing a table directly into postresql 
---- this doesn't work because the DB already needs to be created in postgresql server...
-- instead, run python script to get csv then convert to sql

-- copy test_file
-- from '/Users/lamplab/Desktop/test_file.csv'
-- delimiter ',' 
-- CSV header;

-- basic average function of mhr
select avg(mhr)
from test_table
where sex = 'F'
;

select avg(mhr)
from test_table
where sex = 'M'
;

select * from test_table
order by mhr DESC;

-- S02 and S02 MHR wrong, update...
update test_table
SET mhr = case subject
when 'S02' then  185
when 'S01' then  200
else mhr
end; 

select sum(MHR), sex
from test_table
group by sex;

select count(distinct sex) 
from test_table;

select count(distinct idx) as 'number of participants',
from test_table;select count(distinct idx) AS "number employees"
from test_table;

drop table exercise_df;