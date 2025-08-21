create table table_1 (
first_name varchar,
last_name varchar,
idx int);


insert into table_1 (first_name, last_name, idx)
values
('Tom', 'Gooding', 001),
('Nicole', 'Bachelet', 002);

alter table table_1
Add Column RHR int;

alter table table_1
add column MHR int,
add column Age int;

update table_1
SET
MHR = case idx
when 002 then 196
when 001 then 201
else MHR
end;

update table_1
SET
age = case idx
when 001 then 34
when 002 then 34
else age
end;

update table_1
SET
rhr = case idx
when 001 then 62
when 002 then 63
else rhr
end;

insert into table_1 (first_name, last_name, idx, rhr, mhr, age)
Values ('Julian', 'Gooding', 003, 88, 218, 2.5);

insert into table_1 (first_name, last_name, idx, rhr, mhr, age)
values ('Indira', 'Velasquez', 004, 65, 169, 68),
('Carol', 'Biegun', 004, 72, 162, 68),
('Christina', 'Quick', 005, 68, 178, 38);