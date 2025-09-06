SELECT user_id, first_name, email FROM users WHERE role = 'host';

-- Join
SELECT
    U.first_name,
    U.last_name,
    P.name,
FROM
    Property AS P
LEFT JOIN
    User AS U ON P.host_id = U.user_id;

Your Task (again): Write a query that joins the User table and the Property table to retrieve the property's name and the host's first_name and last_name.

SELECT
    P.name AS property_name,
    U.first_name AS host_first_name,
    U.last_name AS host_last_name,
FROM
    Property AS P
JOIN
    User AS U ON P.host_id = U.user_id;

SELECT 
    