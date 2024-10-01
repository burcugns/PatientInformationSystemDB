-- Insert data into Address table with UK format

INSERT INTO Address (street, city, post_code, country)
VALUES 
('123 High Street', 'London', 'SW1A 1AA', 'UK'),
('456 Station Road', 'Manchester', 'M1 1AE', 'UK'),
('789 Church Lane', 'Birmingham', 'B1 1BB', 'UK'),
('321 Park Avenue', 'Glasgow', 'G1 2NG', 'UK'),
('654 Oak Street', 'Liverpool', 'L1 4JF', 'UK'),
('987 Maple Road', 'Bristol', 'BS1 5HD', 'UK'),
('147 Victoria Street', 'Edinburgh', 'EH1 1YZ', 'UK'),
('258 Kingsway', 'Cardiff', 'CF10 1AA', 'UK'),
('369 Queens Road', 'Leeds', 'LS1 1UR', 'UK'),
('159 Elm Avenue', 'Sheffield', 'S1 2HE', 'UK');


-- Insert data into Departments table
INSERT INTO Departments (department_name, location, head_of_department)
VALUES 
('Cardiology', 'Building A', 'Dr. John Smith'),
('Neurology', 'Building B', 'Dr. Mary Johnson'),
('Orthopedics', 'Building C', 'Dr. Alex Lee'),
('Pediatrics', 'Building D', 'Dr. Sarah Brown'),
('Radiology', 'Building E', 'Dr. Emma Davis'),
('Surgery', 'Building F', 'Dr. David Miller'),
('Oncology', 'Building G', 'Dr. Michael Wilson'),
('Dermatology', 'Building H', 'Dr. Olivia Garcia'),
('Ophthalmology', 'Building I', 'Dr. Daniel Martinez'),
('Psychiatry', 'Building J', 'Dr. Laura Thomas');

-- Insert data into Patients table
INSERT INTO Patients (name, surname, date_of_birth, gender, contact_number, email, address_id)
VALUES 
('John', 'Doe', '1985-02-15', 'Male', '1234567890', 'johndoe@example.com', 1),
('Jane', 'Smith', '1990-07-25', 'Female', '2345678901', 'janesmith@example.com', 2),
('Michael', 'Johnson', '1978-11-10', 'Male', '3456789012', 'michaeljohnson@example.com', 3),
('Emily', 'Davis', '1995-03-22', 'Female', '4567890123', 'emilydavis@example.com', 4),
('Daniel', 'Martinez', '1988-05-30', 'Male', '5678901234', 'danielmartinez@example.com', 5),
('Olivia', 'Garcia', '1993-09-12', 'Female', '6789012345', 'oliviagarcia@example.com', 6),
('James', 'Wilson', '1982-12-18', 'Male', '7890123456', 'jameswilson@example.com', 7),
('Sophia', 'Anderson', '2000-01-04', 'Female', '8901234567', 'sophiaanderson@example.com', 8),
('William', 'Clark', '1997-08-20', 'Male', '9012345678', 'williamclark@example.com', 9),
('Isabella', 'Lopez', '1986-04-14', 'Female', '0123456789', 'isabellalopez@example.com', 10);

-- Insert data into Doctors table
INSERT INTO Doctors (name, surname, specialisation, contact_number, email, department_id)
VALUES 
('Dr. Alex', 'Lee', 'Cardiologist', '1234567800', 'alexlee@example.com', 1),
('Dr. Emma', 'Davis', 'Neurologist', '2345678900', 'emmadavis@example.com', 2),
('Dr. David', 'Miller', 'Orthopedic', '3456789001', 'davidmiller@example.com', 3),
('Dr. Olivia', 'Garcia', 'Pediatrician', '4567890012', 'oliviagarcia@example.com', 4),
('Dr. Michael', 'Wilson', 'Radiologist', '5678900123', 'michaelwilson@example.com', 5),
('Dr. John', 'Smith', 'Surgeon', '6789010234', 'johnsmith@example.com', 6),
('Dr. Sarah', 'Brown', 'Oncologist', '7890120345', 'sarahbrown@example.com', 7),
('Dr. Laura', 'Thomas', 'Dermatologist', '8901230456', 'laurathomas@example.com', 8),
('Dr. Daniel', 'Martinez', 'Ophthalmologist', '9012340567', 'danielmartinez@example.com', 9),
('Dr. Mary', 'Johnson', 'Psychiatrist', '0123450678', 'maryjohnson@example.com', 10);

-- Insert data into Appointments table
INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_status, remarks)
VALUES 
(1, 1, '2023-09-01', 'Completed', 'Follow-up in 3 months'),
(2, 2, '2023-09-10', 'Scheduled', 'Initial consultation'),
(3, 3, '2023-09-15', 'Completed', 'Physical therapy advised'),
(4, 4, '2023-09-20', 'Cancelled', 'Patient requested cancellation'),
(5, 5, '2023-09-25', 'Completed', 'Next appointment in 6 months'),
(6, 6, '2023-10-01', 'Scheduled', 'Follow-up appointment'),
(7, 7, '2023-10-05', 'Scheduled', 'Blood tests required'),
(8, 8, '2023-10-10', 'Completed', 'Routine check-up'),
(9, 9, '2023-10-15', 'Cancelled', 'Doctor unavailable'),
(10, 10, '2023-10-20', 'Scheduled', 'Discuss test results');

-- Insert data into Prescriptions table
INSERT INTO Prescriptions (patient_id, doctor_id, medicine_name, dosage, duration, prescription_date)
VALUES 
(1, 1, 'Atorvastatin', '10mg', '1 month', '2023-09-01 10:00:00'),
(2, 2, 'Ibuprofen', '200mg', '2 weeks', '2023-09-10 14:00:00'),
(3, 3, 'Metformin', '500mg', '3 months', '2023-09-15 09:30:00'),
(4, 4, 'Paracetamol', '500mg', '5 days', '2023-09-20 11:15:00'),
(5, 5, 'Losartan', '50mg', '2 months', '2023-09-25 13:45:00'),
(6, 6, 'Omeprazole', '20mg', '1 week', '2023-10-01 15:00:00'),
(7, 7, 'Simvastatin', '20mg', '6 months', '2023-10-05 12:00:00'),
(8, 8, 'Amoxicillin', '500mg', '10 days', '2023-10-10 09:45:00'),
(9, 9, 'Metoprolol', '25mg', '3 months', '2023-10-15 10:30:00'),
(10, 10, 'Albuterol', '90mcg', 'As needed', '2023-10-20 14:00:00');
