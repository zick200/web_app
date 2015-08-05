--? LAST#
SHOW DATABASES
SELECT * FROM `items` WHERE 1
SHOW TABLES
SHOW COLUMNS FROM customers
SELECT DISTINCT state FROM customers -- DISTINCT Not Reaped same thing
SELECT id,name FROM customers LIMIT 5 -- LIMIT fomr 1-5 or LIMIT 5,10 Start from 6 and countt throw 15


-- Sorting by alfabetic order and numerical
SELECT name FROM customers ORDER BY name
SELECT name , id FROM customers ORDER BY id			
SELECT state ,city, name FROM customers ORDER BY state ,name -- mltyple order available , order from state end from name
--Sort  by Hight to low 
SELECT name,state FROM customers ORDER BY zip DESC -- Desending  to low z-a
SELECT id ,name FROM customers ORDER BY id DESC LIMIT 1 -- limit 1 return obne value with hightest id number

--# Pointing to index location 
SELECT id,name FROM customers WHERE id=54 -- poitn by id 54
SELECT id,name FROM customers WHERE id!=54 --  if not equal 54 return 
SELECT id,name FROM customers WHERE id > 54 AND id <= 64 -- Greater or less are alowed AND,OR,NOT  GATES to
SELECT id,name FROM customers WHERE id BETWEEN 25 AND 30 -- BETWEEN can be use falimar as Bounds
SELECT name,state FROM customers WHERE state='CA' -- Also can be sorded by string 
SELECT name,state,city FROm customers WHERE state='CA'AND city='HollyWood' -- Can use multyple searh
  --Also you can OR them with method IN
SELECT name,state FROM customers WHERE state IN ('CA','NC','NY') -- Serath for state where is selectected as arguments
SELECT name,state FROM customers WHERE state NOT IN ('CA','NC','NY')-- Also Can be reaverse
  --Also Searth Engine Works
  SELECT name FROM items WHERE name LIKE 'new%' -- Look new then stared in text
  SELECT name FROM items WHERE name LIKE '%computer%' -- Look in full name that math enywhere
  SELECT city FROM items WHERE city LIKE 'h%d' -- Also can be searth between h and d, not matter strin lenght
  SELECT name FROM items WHERE name LIKE '_ boxes of frogs' -- underscore select only specific item 
  SELECT name FROM items WHERE name REGEXP 'new' -- Reqular expresion works like % just looking all mathes
  SELECT name FROM items WHERE name REGEXP '. boxes' -- Works like %
  SELECT name FROM items WHERE name REGEXP 'gold|car' -- Can be use pipeline LOGIC GATES
  SELECt name FROM items WHERE name REGEXP '[12345] boxes of frogs' -- Also in square bracets can argue a string that shoud be in list and math with full string
  SELECt name FROM items WHERE name REGEXP '[^12345] boxes of frogs' -- ^ No gate of brakets list to serath that is not string math
  SELECt name FROM items WHERE name REGEXP '[1-5] boxes of frogs' -- shurtcut from one throw five or a-z
   -- Also can concatinate as string the data 
   SELECT CONCAT(city,', ',state) FROM customers -- where data  can concatinate with method CONCAT 
     --Also can name collum that don have eny of name 
     SELECT CONCAT(city,', ',state) AS new_address FROM customers -- as is just pass true new_addres name of collumn
     SELECT name,cost,cost-1 AS sale_price FROM items -- giving new sale column name from cost-substracted by -1 that return new collumn with no name
     SELECT seller_id, COUNT(*) AS item_count FROM items GROUP BY seller_id -- Grou by seller id and item counts
     SELECT seller_id, COUNT(*) AS item_count FROM items GROUP BY seller_id HAVING COUNT(*)>=3 --  Grou by seller id and item counts that have item count hitger than 3 or equal




--# Using function 
SELECT name, UPPER(name) AS new_name FROM customers  -- just translate in in upper letters of selected names
SELECT cost, SQRT(cost) FROM items -- SQRT return number values
SELECT AVG(cost) FROM items -- return average cost of all items
SELECT SUM(bids) FROM items -- return sum of the all bits from items
SELECT COUNT(name) FROM items -- Return of rows count by name
  --Also combined function 
  SELECT AVG(cost) FROM items WHERE seller_id = 6 -- select seller_id and retur n average of that seller
  SELECT COUNT(*) AS item_count,MAX(cost) AS max,AVG(cost) as avg FROM items WHERE seller_id = 12 -- Return Count of seller_id and MAX value of that fives
  SELECT seller_id, COUNT(*) AS item_count FROM items GROUP BY seller_id HAVING COUNT(*)>=3 ORDER BY item_count DESC --return seller id and number of items from eath seller  who listed three or more items and araigment them from hight to low
  SELECT name,MIN(cost) FROM items WHERE name LIKE'%boxes of frogs' --Select minimum cost of 'boxes of frogs'
--# Subqueries


--#joinArrays
SELECT  customers.id,  customers.name , items.id, items.name FROM  customers , items
SELECT  customers.id,  customers.name , items.id, items.name FROM  customers , items WHERE customers.id = seller_id
SELECT  customers.id,  customers.name , items.id, items.name FROM  customers , items WHERE customers.id = items.seller_id
SELECT  customers.id,  customers.name , items.id, items.name FROM  customers , items WHERE customers.id = items.seller_id ORDER BY customers.id
SELECT  customers.id,  customers.name , items.id, items.name,items.cost FROM  customers , items WHERE customers.id = items.seller_id ORDER BY customers.id
  -- Table   shortcut
  SELECT i.id,i.name,c.id,c.name FROM customers AS c, items AS i -- Use joins to specyfie
  SELECT i.id,i.name,c.id,c.name FROM customers AS c, items AS i WHERE i.seller_id = c.id -- same here

--# Joins
SELECT customers.name , items.name FROM customers LEFT OUTER JOIN items ON customers.id = seller_id -- Output FROM left whatever is items or not , return NULL
SELECT customers.name , items.name FROM customers RIGHT OUTER JOIN items ON customers.id = seller_id -- Output FROM RIGHT whatever is items or not , return NULL


--#UNION 
SELECT name,cost,bids FROM items WHERE bids > 190
UNION -- Union bouth as one with condition AND , also merge in one leaving one object and rezult 
SELECT name,cost,bids FROM items WHERE cost > 100
--
SELECT name,cost,bids FROM items WHERE bids > 190
UNION ALL -- Union, also leave same objects not merged
SELECT name,cost,bids FROM items WHERE cost > 100



--#Hybrid methods
SELECT id,CONCAT('#',seller_id,' ',name,', have ',COUNT(*),' items.') AS statistic  FROM items GROUP BY seller_id  -- repot about what have in one string
SELECT seller_id, COUNT(*) AS item_count FROM items GROUP BY seller_id HAVING COUNT(*)>=3 ORDER BY item_count DESC --return seller id and number of items from eath seller  who listed three or more items and araigment them from hight to low
SELECT customers.name , items.name FROM customers,items WHERE customers.id = items.id--relation 

--Text seching Advance (ranking system biuld in)
    --#Text enable
    ALTER TABLE items ADD FULLTEXT(name)
      -- Text serth syntax 
      SELECT name,cost FROM items WHERE MATCH (name)AGAINST('baby') -- searth baby 
      SELECT name,cost FROM items WHERE MATCH (name)AGAINST('+baby -soap' in BOOLEAN MODE ) --Searth baby and not soap

--#Insert row  
INSERT INTO items VALUES ('101','bacon strips','9.95','1','0') -- insert in constructed database 
  --Insert data more structure then raw row
  INSERT INTO items(id,name,cost,seller_id,bids) VALUES('102','fish in chips','7.99','1','0')
  INSERT INTO items(id,name,cost) VALUES ('103','Bronius','99.99') -- Also can costimies order  
    -- Insert multyple rows 
    INSERT INTO items(id,name,cost,seller_id,bids) VALUES 
    ('104','beef whidout stick','3.29','56','0'),
    ('105','Huge cat','784.99','112','1'),
    ('106','Hugies','2.39','156','0')
      --Insert and delete 
      UPDATE items SET name='FreshMilk-zick' WHERE id=106 -- delete and redwrite data in single row 
      UPDATE items SET name = 'Puding paste',bids=66 WHERE id = 106 -- Also can change multyple arguments in row 
        --delete
        DELETE FROM items WHERE id = 106 -- Delete row 106 
--#Create ALTER / DROP / RENAME  Column methods
ALTER TABLE people ADD samplecolumn varchar(10)  -- create new samplecolumn column 
ALTER TABLE people DROP COLUMN samplecolumn  -- Remove samplecolumn column
 --RENAME DATABASE TABLE TITLE NAME 
  RENAME TABLE customers TO users
    --DELET ALL DATABASE TABLE!!
    DROP TABLE people

--Views method (dinamicly updating table)
CREATE VIEW moustBits AS SELECT id,name,bids FROM items ORDER BY bids DESC LIMIT 10 -- its table with needed rezults
--#Create table!
CREATE TABLE users(
id int, -- give datatype for integer
username varchar(30), -- give datatype foe string that cannot be longer then 30 
password varchar(20),
PRIMARY KEY(id) -- Also to say what column woud be in table 
)
 -- in More opion 
  CREATE TABLE people (
  id int NOT NULL AUTO_INCREMENT, -- if not null then continue to auto increment integer with count by one !
  username varchar (30),
  password varchar(30),
  PRIMARY KEY(id)
)