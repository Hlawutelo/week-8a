
-- ===========================================
-- Answer to Question 1: Build a Complete Database Management System
-- Objective: Design and implement a full-featured database using only MySQL.
-- Use Case: Clinic Booking System
-- ===========================================

-- Step 1: Create Database
CREATE DATABASE IF NOT EXISTS clinic_booking_system;
USE clinic_booking_system;

-- ===========================================
-- Table: Patients
-- ===========================================
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    dob DATE NOT NULL,
    gender ENUM('Male', 'Female', 'Other') NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    address TEXT
);

-- ===========================================
-- Table: Doctors
-- ===========================================
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    specialty VARCHAR(50) NOT NULL,
    phone VARCHAR(15) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    room_number VARCHAR(10)
);

-- ===========================================
-- Table: Appointments
-- ===========================================
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    doctor_id INT NOT NULL,
    appointment_date DATETIME NOT NULL,
    status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    notes TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id) ON DELETE CASCADE,
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id) ON DELETE CASCADE
);

-- ===========================================
-- Table: Services
-- ===========================================
CREATE TABLE Services (
    service_id INT AUTO_INCREMENT PRIMARY KEY,
    service_name VARCHAR(100) NOT NULL UNIQUE,
    description TEXT,
    cost DECIMAL(10,2) NOT NULL
);

-- ===========================================
-- Table: Appointment_Services
-- ===========================================
CREATE TABLE Appointment_Services (
    appointment_id INT,
    service_id INT,
    PRIMARY KEY (appointment_id, service_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES Services(service_id) ON DELETE CASCADE
);

-- ===========================================
-- Table: Prescriptions
-- ===========================================
CREATE TABLE Prescriptions (
    prescription_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT UNIQUE NOT NULL,
    medication_details TEXT NOT NULL,
    issue_date DATE,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id) ON DELETE CASCADE
);

-- ===========================================
-- Table: Payments
-- ===========================================
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    appointment_id INT NOT NULL,
    amount_paid DECIMAL(10,2) NOT NULL,
    payment_method ENUM('Cash', 'Credit Card', 'Mobile Money') NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id) ON DELETE CASCADE
);

-- ===========================================
-- Sample Data Inserts
-- ===========================================

-- Patients
INSERT INTO Patients (full_name, dob, gender, phone, email, address) VALUES
('Alice Johnson', '1990-05-21', 'Female', '0701234567', 'alice@example.com', '123 Apple St'),
('Bob Smith', '1985-09-10', 'Male', '0712345678', 'bob@example.com', '456 Banana Ave');

-- Doctors
INSERT INTO Doctors (full_name, specialty, phone, email, room_number) VALUES
('Dr. Susan King', 'Pediatrics', '0723456789', 'susan@clinic.com', 'A101'),
('Dr. John Doe', 'Cardiology', '0734567890', 'john@clinic.com', 'B202');

-- Services
INSERT INTO Services (service_name, description, cost) VALUES
('General Check-up', 'Routine health check-up', 50.00),
('X-Ray', 'X-ray diagnostic imaging', 150.00),
('Blood Test', 'Complete blood count and analysis', 100.00);

-- Appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, status, notes) VALUES
(1, 1, '2025-05-10 10:00:00', 'Scheduled', 'First visit.'),
(2, 2, '2025-05-11 14:30:00', 'Scheduled', 'Heart checkup.');

-- Appointment_Services
INSERT INTO Appointment_Services (appointment_id, service_id) VALUES
(1, 1), (1, 3), (2, 2);

-- Prescriptions
INSERT INTO Prescriptions (appointment_id, medication_details) VALUES
(1, 'Paracetamol 500mg twice daily'),
(2, 'Atorvastatin 10mg daily');

-- Payments
INSERT INTO Payments (appointment_id, amount_paid, payment_method) VALUES
(1, 150.00, 'Cash'),
(2, 150.00, 'Credit Card');
