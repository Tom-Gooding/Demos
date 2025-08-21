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

