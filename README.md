# 📊 Vehicle Booking System – SQL Queries Documentation

This document contains important SQL queries used in the **Vehicle Booking System** database to retrieve booking, vehicle, and availability information.

---

## 🗂 Database Tables Used

- **users** – stores customer information  
- **vehicles** – stores vehicle details  
- **bookings** – stores booking records  

---

## 🧾 SQL Queries

### 1️⃣ Retrieve Booking Details with Customer and Vehicle Information

This query retrieves booking details along with the customer name and vehicle information.
```sql
SELECT bookings.id AS booking_id,
       users.name AS customer_name,
       vehicles.vehicle_name,
       bookings.start_date,
       bookings.end_date,
       bookings.booking_status AS status
FROM bookings
JOIN users USING (user_id)
JOIN vehicles USING (vehicle_id);
```

### 2️⃣ Find All Vehicles That Have Never Been Booked

This query returns vehicles that do not appear in the bookings table.
```sql
SELECT vehicle_name AS name,
       type,
       model,
       registration_number,
       rental_price_per_day AS rental_price,
       availability_status AS status
FROM vehicles
WHERE NOT EXISTS (
    SELECT vehicle_id
    FROM bookings
    WHERE bookings.vehicle_id = vehicles.vehicle_id
);
```

### 3️⃣ Retrieve All Available Vehicles of a Specific Type (e.g., Cars)

This query finds all vehicles of type car that are currently available.
```sql
SELECT *
FROM vehicles
WHERE type = 'car'
AND availability_status = 'available';
```

### 4️⃣ Find Vehicles with More Than 2 Bookings

This query calculates the total number of bookings per vehicle and displays only vehicles with more than two bookings.
```sql
SELECT vehicle_name,
       COUNT(*) AS total_bookings
FROM bookings
JOIN vehicles USING (vehicle_id)
GROUP BY vehicle_name
HAVING COUNT(*) > 2;
```

### ✅ Use Cases

Booking history reporting

Vehicle availability tracking

Admin analytics

Business insights
