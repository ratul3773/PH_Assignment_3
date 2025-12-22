SELECT bookings.id AS booking_id,
       users.name AS customer_name,
       vehicles.vehicle_name,
       bookings.start_date,
       bookings.end_date,
       bookings.booking_status AS status
FROM bookings JOIN users ON bookings.user_id = users.id
              JOIN vehicles ON bookings.vehicle_id = vehicles.id;


SELECT vehicle_name AS name,
       type,
       model,
       registration_number,
       rental_price_per_day AS rental_price,
       availability_status AS status
FROM vehicles EXISTS
WHERE availability_status = 'available' OR availability_status = 'maintenance';


SELECT * FROM vehicles WHERE type = 'car' AND availability_status = 'available';


SELECT vehicle_name,
       count(*) AS total_bookings
FROM bookings JOIN vehicles ON bookings.vehicle_id = vehicles.id  WHERE bookings.booking_status = 'completed' OR bookings.booking_status = 'confirmed'
GROUP BY vehicle_name HAVING count(*) > 2;