
select * from (orders join supplier_pricing on orders.pricing_id = supplier_pricing.pricing_id) join product on supplier_pricing.pro_id = product.pro_id where orders.ord_date > '2021-10-05';
