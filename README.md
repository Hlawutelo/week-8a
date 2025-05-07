# Clinic Booking System - Database Management Project

## 📌 Question 1: Build a Complete Database Management System

### 🎯 Objective:
Design and implement a *full-featured relational database* using *only MySQL* for a real-world use case.

---

## 🏥 Use Case: Clinic Booking System

This system is designed to manage various aspects of a clinic’s operations, including patients, doctors, appointments, services, prescriptions, and payments.

---

## 🗂️ Database Overview

### ✅ Features:
- Store and manage patient and doctor information
- Schedule and track appointments
- Handle payments and prescriptions
- Manage clinic services and associate them with appointments

---

## 🧱 Tables Created (With Constraints)

1. *Patients*
   - patient_id (PK)
   - full_name, dob, gender, phone, email, address

2. *Doctors*
   - doctor_id (PK)
   - full_name, specialty, phone, email, room_number

3. *Appointments*
   - appointment_id (PK)
   - patient_id (FK → Patients)
   - doctor_id (FK → Doctors)
   - appointment_date, status, notes

4. *Services*
   - service_id (PK)
   - service_name, description, cost

5. *Appointment_Services*
   - appointment_id (FK → Appointments)
   - service_id (FK → Services)
   - Composite PK (appointment_id, service_id)

6. *Prescriptions*
   - prescription_id (PK)
   - appointment_id (FK → Appointments, UNIQUE)
   - medication_details, issue_date

7. *Payments*
   - payment_id (PK)
   - appointment_id (FK → Appointments)
   - amount_paid, payment_method, payment_date

---

## 🔗 Relationships Modeled

| Relationship Type | Description |
|-------------------|-------------|
| One-to-Many       | Patients → Appointments |
| One-to-Many       | Doctors → Appointments |
| One-to-One        | Appointments → Prescriptions (via UNIQUE FK) |
| Many-to-Many      | Appointments ↔ Services (via Appointment_Services) |

---

## 📎 Constraints Used
- PRIMARY KEY, FOREIGN KEY
- NOT NULL, UNIQUE
- AUTO_INCREMENT
- ON DELETE CASCADE for safe cleanup


---

## 📄 Deliverables

- ✅ CREATE TABLE and 'INSERT INTO' data statements SQL statements (with proper comments)
- ERD diagram

---

## 📌 Notes

- The schema supports *extensibility* for future modules like user authentication, lab tests, medical history, etc.
- The Prescriptions table enforces a *1-to-1* relationship with Appointments using a UNIQUE constraint.

---

## 👨‍💻 Developed By:
> Hlawutelo PLP Academy  
> Project: MySQL Database Management System  
> Submission: Final SQL Schema + ERD
