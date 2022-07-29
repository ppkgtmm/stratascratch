WITH friend_count AS (
    SELECT user1 fb_user, COUNT(*) friends
    FROM facebook_friends
    GROUP BY 1
    UNION 
    SELECT user2 fb_user, COUNT(*) friends
    FROM facebook_friends
    GROUP BY 1
), user_total_friends AS (
    SELECT fb_user, SUM(friends) total_friends
    FROM friend_count
    GROUP BY 1
), total_users AS (
    SELECT COUNT(*)
    FROM user_total_friends
)
SELECT fb_user, total_friends * 100 / (SELECT * FROM total_users) popularity_percent
FROM user_total_friends
ORDER BY 1