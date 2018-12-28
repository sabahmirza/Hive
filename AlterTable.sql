ALTER TABLE TO ADD/DROP COLUMNS:
You cannot drop column directly from a table using command "ALTER TABLE table_name drop col_name;"
The only way to drop column is using replace command.
CREATE TABLE test_change (a int, b int, c int);
ALTER TABLE test_change REPLACE COLUMNS (a int, b int);" will remove column 'c' from test_change's schema.


========================================ALTER PARTITION=============================================
CREATE external TABLE TRANX (
tid int,
tdate string,
custid int,
amount double, 
category string, 
product string,
city string,
state string,
spendby string)
comment 'base transaction table' 
PARTITIONED BY (country STRING) 
row format delimited 
fields terminated by ',' 
stored as textfile 
tblproperties('created by' = 'rajesh');

truncate table TRANX;


LOAD DATA LOCAL INPATH '/home/cloudera/Desktop/Hive2/txns' INTO TABLE TRANX123 PARTITION (COUNTRY = 'US');

-- Alter PARTITION TO CHANGE LOCATION
ALTER TABLE TRANX ADD PARTITION (country = 'JAPAN') LOCATION '/user/cloudera/JAPAN';

ALTER TABLE TRANX PARTITION (country = 'JAPAN') SET LOCATION '/user/cloudera/INPUT/JAPAN';
--
 
LOAD DATA LOCAL INPATH '/home/cloudera/Desktop/Hive2/txns' INTO TABLE TRANX partition (country = 'india');

--Alter PARTITION ADD STATIC PARTITION
ALTER TABLE TRANX ADD PARTITION (country = 'CHINA');

CREATE EXTERNAL TABLE PARTITION.ABC (tid int,tdate string, custid int, amount double, category string, product string,city string, 
state string, spendby string) row format delimited fields terminated by ',' stored as textfile LOCATION '/user/cloudera/JAPAN';

INSERT INTO TRANX PARTITION (country = 'CHINA') SELECT * FROM ABC;

--Alter PARTITION RENAME PARTITION
ALTER TABLE TRANX PARTITION (country = 'CHINA') RENAME TO PARTITION (country = 'LANKA')

--Alter PARTITION DROP PARTITION
ALTER TABLE TRANX DROP PARTITION (COUNTRY = 'JAPAN');

================================Sir===================================
Alter  table transaction  
add partition (tdate,category)  location '/user/gds/part-00009' 
partition (tdate,category)      location '/user/gds/part-00011';



Solution-
Alter  table transaction  add partition (tdate,category) 
location '/user/gds/part-00009';

Alter  table transaction  add partition (tdate,category) 
location '/user/gds/part-00011';
