select * from supplier where supp_id in (
select supplier.supp_id from supplier_pricing join supplier on  supplier_pricing.supp_id = supplier.supp_id group by supplier_pricing.supp_id having count(*) > 1
);