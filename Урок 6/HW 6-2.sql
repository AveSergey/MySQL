use vk;

select count(user_id) as Likes_Count
from
	(select user_id, 
	(select birthday from profiles as user_BD where user_BD.user_id = user_like.user_id) as birthday
	from likes as user_like
    order by birthday desc
    limit 10
	) as like_count;