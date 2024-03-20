select a.owner as name, isnull(max(transmission_count), 0) as max_transmissions
from accounts a
left join (
    select student_id, count(*) as transmission_count
    from transmissions t
    where exercise_id = (
            select top 1 exercise_id 
            from transmissions 
            where student_id = t.student_id
            group by student_id, exercise_id
        )
    group by student_id
) as subquery on a.id = subquery.student_id
group by a.owner