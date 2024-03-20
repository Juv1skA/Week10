with balancehistory as (
    select id, account_id,
        sum(change) over (partition by account_id order by id) as cumulative_balance
    from transactions
)
select 
    a.owner as account_name,
    coalesce(max(b.cumulative_balance), 0) as largest_balance
from accounts a
left join balancehistory b on a.id = b.account_id
group by a.owner, a.id