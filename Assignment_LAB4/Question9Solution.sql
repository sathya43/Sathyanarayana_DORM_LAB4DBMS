
drop procedure if exists get_Type_Of_Service;

DELIMITER &&  
CREATE PROCEDURE get_Type_Of_Service ()  
BEGIN 
   
  Create table Result_Table
      select supplier.supp_id as Supplier_ID,supplier.supp_name as Supplier_Name,avg(rating.rat_ratstars) as Avg_Rating,
           Case
              WHEN avg(rating.rat_ratstars) = 5 THEN 'Excellent Service'
              WHEN avg(rating.rat_ratstars) > 4 THEN 'Good Service'
              WHEN avg(rating.rat_ratstars) > 2 THEN 'Average Service'
              ELSE 'Poor Service'
           End As Type_of_Service from 
	  (
       ((rating join orders on rating.ord_id = orders.ord_id) 
           join supplier_pricing on orders.pricing_id = supplier_pricing.pricing_id )
           join supplier on supplier_pricing.supp_id = supplier.supp_id
      ) group by Supplier_ID;  
    
  select * from Result_Table;
    
  drop table Result_Table;

END &&  
DELIMITER ;  

CALL get_Type_Of_Service() ;