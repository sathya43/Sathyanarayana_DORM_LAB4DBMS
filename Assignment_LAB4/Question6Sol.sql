select category.cat_id,category.cat_name,product.pro_name,min(supplier_pricing.supp_price) from 
   ( (supplier_pricing join product on supplier_pricing.pro_id = product.pro_id)
     join category on product.cat_id = category.cat_id
     ) group by category.cat_id order by category.cat_id;
