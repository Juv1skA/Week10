select sum(change) over (order by id) as balance_history
from transactions
where account_id = (select id from accounts where owner = 'Uolevi')
order by id;