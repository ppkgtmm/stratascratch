SELECT home_library_code
FROM library_usage
WHERE provided_email_address = False AND circulation_active_year = 2016 AND
notice_preference_definition = 'email'
GROUP BY 1