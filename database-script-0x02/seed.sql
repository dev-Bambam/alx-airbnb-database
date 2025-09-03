-- Sample Users (Admin, Hosts, and Guests)
INSERT INTO users (first_name, last_name, email, password_hash, phone_number, role) VALUES
('Admin', 'User', 'admin@airbnb.com', '$2a$12$1234', '+2347001234567', 'admin'),
('John', 'Host', 'john.host@email.com', '$2a$12$5678', '+2347012345678', 'host'),
('Sarah', 'Host', 'sarah.host@email.com', '$2a$12$9012', '+2347023456789', 'host'),
('Michael', 'Guest', 'michael.guest@email.com', '$2a$12$3456', '+2347034567890', 'user'),
('Emma', 'Guest', 'emma.guest@email.com', '$2a$12$7890', '+2347045678901', 'user');

-- Sample Locations
INSERT INTO locations (country, state, city) VALUES
('Nigeria', 'Lagos', 'Lekki'),
('Nigeria', 'Lagos', 'Victoria Island'),
('Nigeria', 'Abuja', 'Central Business District'),
('Nigeria', 'Rivers', 'Port Harcourt'),
('Nigeria', 'Oyo', 'Ibadan');

-- Sample Properties
INSERT INTO properties (host_id, name, description, location_id, price_per_night) VALUES
((SELECT user_id FROM users WHERE email = 'john.host@email.com'),
 'Luxury Lekki Apartment',
 'Beautiful 2-bedroom apartment with ocean view',
 (SELECT location_id FROM locations WHERE city = 'Lekki'),
 50000.00),

((SELECT user_id FROM users WHERE email = 'john.host@email.com'),
 'VI Executive Suite',
 'Modern suite in the heart of Victoria Island',
 (SELECT location_id FROM locations WHERE city = 'Victoria Island'),
 75000.00),

((SELECT user_id FROM users WHERE email = 'sarah.host@email.com'),
 'Abuja Penthouse',
 'Luxurious penthouse with city views',
 (SELECT location_id FROM locations WHERE city = 'Central Business District'),
 100000.00);

-- Sample Bookings
INSERT INTO bookings (property_id, user_id, start_date, end_date, total_price, status) VALUES
((SELECT property_id FROM properties WHERE name = 'Luxury Lekki Apartment'),
 (SELECT user_id FROM users WHERE email = 'michael.guest@email.com'),
 '2024-03-01', '2024-03-05',
 200000.00, 'confirmed'),

((SELECT property_id FROM properties WHERE name = 'VI Executive Suite'),
 (SELECT user_id FROM users WHERE email = 'emma.guest@email.com'),
 '2024-03-10', '2024-03-15',
 375000.00, 'confirmed'),

((SELECT property_id FROM properties WHERE name = 'Abuja Penthouse'),
 (SELECT user_id FROM users WHERE email = 'michael.guest@email.com'),
 '2024-04-01', '2024-04-03',
 200000.00, 'pending');

-- Sample Reviews
INSERT INTO reviews (property_id, user_id, rating, comment) VALUES
((SELECT property_id FROM properties WHERE name = 'Luxury Lekki Apartment'),
 (SELECT user_id FROM users WHERE email = 'michael.guest@email.com'),
 5, 'Excellent apartment with amazing views! Host was very accommodating.'),

((SELECT property_id FROM properties WHERE name = 'VI Executive Suite'),
 (SELECT user_id FROM users WHERE email = 'emma.guest@email.com'),
 4, 'Great location and comfortable stay. Would recommend!');

-- Sample Messages
INSERT INTO messages (sender_id, recipient_id, message_body) VALUES
((SELECT user_id FROM users WHERE email = 'michael.guest@email.com'),
 (SELECT user_id FROM users WHERE email = 'john.host@email.com'),
 'Hi, is the Lekki apartment available for next weekend?'),

((SELECT user_id FROM users WHERE email = 'john.host@email.com'),
 (SELECT user_id FROM users WHERE email = 'michael.guest@email.com'),
 'Yes, it is available. Would you like to make a booking?');