SELECT unnest(string_to_array(categories, ';')) category, SUM(review_count) review_cnt
FROM yelp_business
GROUP BY 1
ORDER BY 2 DESC