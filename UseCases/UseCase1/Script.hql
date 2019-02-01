reate table employee (id int,first_name string,last_name string,email string,gender string,completion_date string)
row format delimited
fields terminated by ','
stored as textfile;

load data local inpath '/home/cloudera/Desktop/Slave.csv' into table employee;


create table master(Description string,completion_date string)
row format delimited
fields terminated by ','
stored as textfile;

load data local inpath '/home/cloudera/Desktop/MAster.csv' into table master;

SET hive.auto.convert.join=false;

Create temporary table temp as select e.id, date_add(e.completion_date, 1) as completion_date from employee e join master m on e.completion_date=m.completion_date;

select e.id,e.first_name,e.last_name,e.email, e.gender, case
when t.completion_date is null then e.completion_date
else t.completion_date
end as completion_date
from employee e left outer join temp t on e.id = t.id;


OR



select e.id,e.first_name,e.last_name,e.email, e.gender, if(t.completion_date is null, e.completion_date,t.completion_date) as completion_date
from employee e left outer join temp t on e.id = t.id;
