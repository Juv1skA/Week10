select min(abs(p1.price - p2.price)) as smallest_difference
from products p1
join products p2 on p1.id < p2.id
where p1.price != p2.price