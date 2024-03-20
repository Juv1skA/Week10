select count(*) as Combination_count
from Products p1
join Products p2 on p1.id <= p2.id
where p1.price + p2.price = 10