SELECT *
FROM facebook_posts p
WHERE 'heart' = ANY (
    SELECT reaction 
    FROM facebook_reactions
    WHERE post_id = p.post_id
)