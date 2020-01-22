use vk;

select gender 
from 
	(select gender, count((select count(*) from likes as g_Like where g_Like.user_id = sex.user_id)) as gender_likes_count from profiles as sex
where gender = 'm'
group by gender
union all 
select gender, count((SELECT count(*) from likes as g_Like where g_like.user_id = sex.user_id)) from profiles as sex
where gender = 'f'
group by gender
) as hhhhlk
group by gender
order by max(gender_likes_count) desc
limit 1;