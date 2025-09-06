-- tasks 

--1. Write a query using an INNER JOIN to retrieve all bookings and the respective users who made those bookings.
SELECT 
    user.first_name AS first_name
    user.last_name AS last_name
    booking.booking_id AS booking_id
FROM 
    User AS user
JOIN
    Booking AS booking 
ON
    user.user_id  = booking.user_id


--2. Write a query using aLEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews.

SELECT
    prop.property_id AS property_id
    prop.property_name AS property_name
    rev.review_comment AS  review_comment
FROM
    Property as prop
LEFT JOIN
    Review as rev
ON
    prop.property_id = rev.property_id


--3. Write a query using a FULL OUTER JOIN to retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user.

select 
    user.first_name as first_name
    user.last_name as last_name
    booking.booking_id as booking_id
from 
    User as user
join 
    Booking as booking
on 
    user.user_id = booking.user_id