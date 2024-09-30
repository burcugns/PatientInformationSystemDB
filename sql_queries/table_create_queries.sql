-- CREATE DATABASE patient_information_system
-- USE  patient_information_system;

-- CREATE TABLE Patients (
--     patient_id INT,
--     name VARCHAR(50) NOT NULL,
--     surname VARCHAR(50) NOT NULL,
--     date_of_birth DATE NOT NULL,
--     gender VARCHAR(50),
--     contact_number VARCHAR(11),
--     email VARCHAR(50),
--     address_id INT
-- );
-- CREATE TABLE Doctors (
--     doctor_id INT,
--     name VARCHAR(50) NOT NULL,
--     surname VARCHAR(50) NOT NULL,
--     specialisation VARCHAR(50),
--     contact_number VARCHAR(11),
--     email VARCHAR(50),
--     working_hours VARCHAR(50),
--     department_id INT
--     
-- );

-- CREATE TABLE Appointments( 
-- appointment_id INT,
-- patient_id INT,
-- doctor_id INT ,
-- appointment_date DATE NOT NULL,
-- appointment_status ENUM('Scheduled', 'Completed', 'Cancelled') NOT NULL, -- enum ?
-- remarks TEXT 
-- );

-- CREATE TABLE Departments(
-- department_id INT,
-- department_name VARCHAR(50) NOT NULL,
-- location VARCHAR(50),
-- head_of_department VARCHAR(50)
-- );

-- CREATE TABLE  Prescriptions(
-- prescription_id INT,
-- patient_id INT,
-- doctor_id INT,
-- medicine_name VARCHAR(50) NOT NULL,
-- dosage VARCHAR(50),
-- duration VARCHAR(50),
-- prescription_date DATETIME NOT NULL
-- );

-- CREATE TABLE Address (
-- address_id INT,
-- street VARCHAR(50),
-- city VARCHAR(50),
-- post_code VARCHAR(10),
-- country VARCHAR(50)
-- );







