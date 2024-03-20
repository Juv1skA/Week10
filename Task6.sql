with correctexercises as (
    select student_id, count(distinct exercise_id) as correct_exercises_count
    from transmissions
    where state = 1
    group by student_id
)
select a.owner as student_name, coalesce(ce.correct_exercises_count, 0) as correct_exercises_count
from accounts a
left join correctexercises ce on a.id = ce.student_id;
