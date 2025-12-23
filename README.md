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
