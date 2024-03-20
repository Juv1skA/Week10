select accounts.owner, coalesce(sum(transactions.change), 0) as balance
from accounts
left join transactions on accounts.id = transactions.account_id
group by owner
order by balance desc