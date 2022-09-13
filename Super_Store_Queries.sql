use Super_Store;

#001. FIND THE MAXIMIUM QUANTITY SOLD IN A TRANSACTION  
select * from tr_orderdetails; 
select max(Quantity), count(*)
from tr_orderdetails; 

#002. FIND THE UNIQUE PRODUCTS IN ALL THE TRANSACTIONS 
select distinct ProductID, Quantity
from tr_orderdetails where Quantity = 3
order by ProductID asc, Quantity desc; 

#003. FIND THE NUMBER OF UNIQUE PROPERTIES
select distinct PropertyID
from tr_orderdetails;

#004. FIND THE PRODUCT CATEGORY THAT HAS MAXIMUM PRODUCTS 
select ProductCategory, count(*) as COUNT
from tr_products 
group by ProductCategory
order by COUNT desc; 

#005. FIND THE STATE WHERE ARE MORE STORES
select PropertyState, count(*) as COUNT
from tr_propertyinfo
group by PropertyState
order by COUNT desc; 

#006. FIND THE TOP 5 PRODUCTS IDs THAT DID THE MAXIMUM SALES IN TERM OF QUANTITY 
select ProductID, sum(Quantity) as TotalQuantity
from tr_orderdetails
group by ProductID 
order by TotalQuantity desc
limit 5;

#007. FIND THE TOP 5 PROPERTIES IDs THAT DID THE MAXIMUM SALES IN TERM OF QUANTITY 
select PropertyID, sum(Quantity) as TotalQuantity
from tr_orderdetails
group by PropertyID 
order by TotalQuantity desc
limit 5;

#008. FIND THE 5 PRODUCTS THAT MADE THE TOP SALES IN TERM OF QUANTITY
select p.ProductName, sum(o.Quantity) as Total_Q
from tr_orderdetails as o
left join tr_products as p on o.ProductID = p.ProductID
group by p.ProductName
order by Total_Q desc
limit 5;

#009. FIND THE 5 PRODUCTS THAT MADE THE TOP SALES IN TERM OF MONEY
select p.ProductName, sum(p.Price) as Total_S
from tr_orderdetails as o 
left join tr_products as p on o.ProductID = p.ProductID
group by ProductName 
order by Total_S desc
limit 5; 

#010. FIND THE 5 CITIES THAT DID THE MAXIMUM SALES 
select pi.PropertyCity, sum(p.Price) as Total_S
from tr_orderdetails as o 
left join tr_products as p on o.ProductID = p.ProductID
left join tr_propertyinfo as pi on o.PropertyID = pi.`Prop ID`
group by pi.PropertyCity
order by Total_S desc
limit 5;







































