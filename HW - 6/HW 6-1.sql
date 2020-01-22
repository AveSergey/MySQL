SELECT (SELECT firstname from users WHERE id = best_friend_id) AS best_fiend,
        MAX(count_messages) as count_messages 
FROM (
SELECT best_friend_id, COUNT(*) AS count_messages FROM (
	SELECT to_user_id AS best_friend_id FROM messages WHERE from_user_id = 1
	union ALL
	SELECT from_user_id  FROM messages WHERE to_user_id = 1
) AS T
GROUP BY best_friend_id
) AS FD -- FRIEND_STATISTIC
GROUP BY best_fiend
ORDER BY  count_messages DESC
LIMIT 1;