-- Create a new database named 'patient_information_system'
CREATE DATABASE patient_information_system;

-- Use the newly created database for subsequent operations
USE patient_information_system;

-- Create the Patients table to store patient information
CREATE TABLE Patients (
    id INT,                                     -- Unique identifier for each patient
    name VARCHAR(50) NOT NULL,                  -- Patient's first name (mandatory)
    surname VARCHAR(50) NOT NULL,               -- Patient's last name (mandatory)
    date_of_birth DATE NOT NULL,                -- Patient's date of birth (mandatory)
    gender VARCHAR(50),                         -- Patient's gender
    contact_number VARCHAR(11),                  -- Patient's contact number
    email VARCHAR(50),                           -- Patient's email address
    address_id INT                               -- Foreign key reference to Address table
);

-- Modify the Patients table to set id as AUTO_INCREMENT and define it as the primary key
ALTER TABLE Patients
MODIFY id INT AUTO_INCREMENT,                  -- Enable auto-incrementing for id
ADD PRIMARY KEY (id),                          -- Set id as the primary key
ADD CONSTRAINT FK_Patient_Address              -- Add foreign key constraint to link address_id
FOREIGN KEY (address_id) REFERENCES Address(id);  -- References address_id in Address table

-- Create the Doctors table to store doctor information
CREATE TABLE Doctors (
    id INT,                                     -- Unique identifier for each doctor
    name VARCHAR(50) NOT NULL,                  -- Doctor's first name (mandatory)
    surname VARCHAR(50) NOT NULL,               -- Doctor's last name (mandatory)
    specialisation VARCHAR(50),                  -- Doctor's area of specialization
    contact_number VARCHAR(11),                  -- Doctor's contact number
    email VARCHAR(50),                           -- Doctor's email address
    working_hours VARCHAR(50),                   -- Doctor's working hours
    department_id INT                            -- Foreign key reference to Departments table
);

-- Modify the Doctors table to set id as AUTO_INCREMENT and define it as the primary key
ALTER TABLE Doctors
MODIFY id INT AUTO_INCREMENT,                  -- Enable auto-incrementing for id
ADD PRIMARY KEY (id),                          -- Set id as the primary key
ADD CONSTRAINT FK_Doctor_Department           -- Add foreign key constraint to link department_id
FOREIGN KEY (department_id) REFERENCES Departments(id);  -- References id in Departments table

-- Create the Appointments table to store appointment details
CREATE TABLE Appointments( 
    id INT,                                     -- Unique identifier for each appointment
    patient_id INT,                             -- Foreign key reference to Patients table
    doctor_id INT,                              -- Foreign key reference to Doctors table
    appointment_date DATE NOT NULL,              -- Date of the appointment (mandatory)
    appointment_status ENUM('Scheduled', 'Completed', 'Cancelled') NOT NULL,  -- Status of the appointment
    remarks TEXT                                 -- Additional notes about the appointment
);

-- Modify the Appointments table to set id as AUTO_INCREMENT and define it as the primary key
ALTER TABLE Appointments
MODIFY id INT AUTO_INCREMENT,                  -- Enable auto-incrementing for id
ADD PRIMARY KEY (id),                          -- Set id as the primary key
ADD CONSTRAINT FK_Appointment_Patient         -- Add foreign key constraint to link patient_id
FOREIGN KEY (patient_id) REFERENCES Patients(id),  -- References id in Patients table
ADD CONSTRAINT FK_Appointment_Doctor          -- Add foreign key constraint to link doctor_id
FOREIGN KEY (doctor_id) REFERENCES Doctors(id);  -- References id in Doctors table

-- Create the Departments table to store department information
CREATE TABLE Departments(
    id INT,                                     -- Unique identifier for each department
    department_name VARCHAR(50) NOT NULL,      -- Name of the department (mandatory)
    location VARCHAR(50),                       -- Location of the department
    head_of_department VARCHAR(50)              -- Head of the department's name
);

-- Modify the Departments table to set id as AUTO_INCREMENT and define it as the primary key
ALTER TABLE Departments
MODIFY id INT AUTO_INCREMENT,                  -- Enable auto-incrementing for id
ADD PRIMARY KEY (id);                          -- Set id as the primary key

-- Create the Prescriptions table to store prescription details
CREATE TABLE Prescriptions(
    id INT,                                     -- Unique identifier for each prescription
    patient_id INT,                             -- Foreign key reference to Patients table
    doctor_id INT,                              -- Foreign key reference to Doctors table
    medicine_name VARCHAR(50) NOT NULL,         -- Name of the prescribed medicine (mandatory)
    dosage VARCHAR(50),                          -- Dosage of the medicine
    duration VARCHAR(50),                        -- Duration for which the medicine should be taken
    prescription_date DATETIME NOT NULL         -- Date when the prescription was made (mandatory)
);

-- Modify the Prescriptions table to set id as AUTO_INCREMENT and define it as the primary key
ALTER TABLE Prescriptions
MODIFY id INT AUTO_INCREMENT,                  -- Enable auto-incrementing for id
ADD PRIMARY KEY (id),                          -- Set id as the primary key
ADD CONSTRAINT FK_Prescription_Patient        -- Add foreign key constraint to link patient_id
FOREIGN KEY (patient_id) REFERENCES Patients(id),  -- References id in Patients table
ADD CONSTRAINT FK_Prescription_Doctor         -- Add foreign key constraint to link doctor_id
FOREIGN KEY (doctor_id) REFERENCES Doctors(id);  -- References id in Doctors table

-- Create the Address table to store address information
CREATE TABLE Address (
    id INT,                                     -- Unique identifier for each address
    street VARCHAR(50),                         -- Street address
    city VARCHAR(50),                           -- City of the address
    post_code VARCHAR(10),                      -- Postal code
    country VARCHAR(50)                         -- Country of the address
);

-- Modify the Address table to set id as AUTO_INCREMENT and define it as the primary key
ALTER TABLE Address
MODIFY id INT AUTO_INCREMENT,                  -- Enable auto-incrementing for id
ADD PRIMARY KEY (id);                          -- Set id as the primary key
