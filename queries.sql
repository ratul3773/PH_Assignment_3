SELECT bookings.id AS booking_id,
       users.name AS customer_name,
       vehicles.vehicle_name,
       bookings.start_date,
       bookings.end_date,
       bookings.booking_status AS status
FROM bookings JOIN users USING(user_id)
              JOIN vehicles USING(vehicle_id);


SELECT vehicle_name AS name,
       type,
       model,
       registration_number,
       rental_price_per_day AS rental_price,
       availability_status AS status
       FROM vehicles 
WHERE NOT EXISTS(
    SELECT vehicle_id FROM bookings 
    WHERE bookings.vehicle_id = vehicles.vehicle_id 
)
    

SELECT * FROM vehicles WHERE type = 'car' AND availability_status = 'available';


SELECT vehicle_name,
       count(*) AS total_bookings
FROM bookings JOIN vehicles USING (vehicle_id)
GROUP BY vehicle_name HAVING count(*) > 2;
