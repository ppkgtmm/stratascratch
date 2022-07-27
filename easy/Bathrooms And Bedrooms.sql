SELECT city, property_type, AVG(bathrooms) n_bathrooms_avg, AVG(bedrooms) n_bedrooms_avg
FROM airbnb_search_details
GROUP BY 1, 2