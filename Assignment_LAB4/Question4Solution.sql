select product.pro_name from supplier_pricing join product on supplier_pricing.pro_id = product.pro_id where supplier_pricing.pro_id in (
select pro_id from orders join supplier_pricing on orders.pricing_id = supplier_pricing.pricing_id  where orders.cus_id = 2
);