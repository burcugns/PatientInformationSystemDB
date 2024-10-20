
    
INSERT INTO Address (street, city, post_code, country)
VALUES

('1 Market Street', 'Cambridge', 'CB1 1AL', 'United Kingdom'),
('221B Baker Street', 'London', 'NW1 6XE', 'United Kingdom'),
('12 Marine Parade', 'Brighton', 'BN2 1TL', 'United Kingdom'),
('15 Kings Parade', 'Cambridge', 'CB2 1SP', 'United Kingdom'),
('10 Downing Street', 'London', 'SW1A 2AA', 'United Kingdom'),
('34 Western Road', 'Brighton', 'BN1 2EB', 'United Kingdom'),
('7 Chesterton Road', 'Cambridge', 'CB4 3AR', 'United Kingdom'),
('45 Oxford Street', 'London', 'W1D 1BS', 'United Kingdom'),
('55 North Street', 'Brighton', 'BN1 1EB', 'United Kingdom'),
('25 Mill Road', 'Cambridge', 'CB1 2AB', 'United Kingdom'),
('50 Piccadilly Circus', 'London', 'W1J 9HP', 'United Kingdom'),
('8 Kings Road', 'Brighton', 'BN1 2JF', 'United Kingdom'),
('10 Castle Hill', 'Cambridge', 'CB3 0AH', 'United Kingdom'),
('20 Strand', 'London', 'WC2R 1JD', 'United Kingdom'),
('70 Queens Road', 'Brighton', 'BN1 3XD', 'United Kingdom'),
('30 Newmarket Road', 'Cambridge', 'CB5 8JH', 'United Kingdom'),
('5 Trafalgar Square', 'London', 'WC2N 5DN', 'United Kingdom'),
('22 Preston Park Avenue', 'Brighton', 'BN1 6HG', 'United Kingdom'),
('18 Hills Road', 'Cambridge', 'CB2 8RN', 'United Kingdom'),
('30 Kensington High Street', 'London', 'W8 4SG', 'United Kingdom');



INSERT INTO Patients (name, surname, date_of_birth, gender, contact_number, email, address_id)
VALUES
('James', 'Smith', '1985-06-15', 'Male', '07123456789', 'james.smith@example.com', 1),
('James', 'Brown', '1990-11-20', 'Male', '07123456780', 'james.brown@example.com', 2),
('Emily', 'Jones', '1992-03-25', 'Female', '07123456781', 'emily.jones@example.com', 3),
('Emily', 'Taylor', '1987-08-30', 'Female', '07123456782', 'emily.taylor@example.com', 4),
('Oliver', 'Wilson', '1995-12-10', 'Male', '07123456783', 'oliver.wilson@example.com', 5),
('Charlotte', 'Davies', '1993-07-18', 'Female', '07123456784', 'charlotte.davies@example.com', 6),
('Thomas', 'Evans', '1989-09-09', 'Male', '07123456785', 'thomas.evans@example.com', 7),
('Sophie', 'Thomas', '1991-05-05', 'Female', '07123456786', 'sophie.thomas@example.com', 8),
('Daniel', 'Roberts', '1988-04-14', 'Male', '07123456787', 'daniel.roberts@example.com', 9),
('Isabella', 'Johnson', '1994-11-22', 'Female', '07123456788', 'isabella.johnson@example.com', 10),
('Jack', 'Walker', '1990-02-17', 'Male', '07123456789', 'jack.walker@example.com', 11),
('Jessica', 'White', '1985-06-10', 'Female', '07123456790', 'jessica.white@example.com', 12),
('George', 'Harris', '1993-03-01', 'Male', '07123456791', 'george.harris@example.com', 13),
('Amelia', 'King', '1995-10-05', 'Female', '07123456792', 'amelia.king@example.com', 14),
('Jack', 'Edwards', '1986-12-09', 'Male', '07123456793', 'jack.edwards@example.com', 15),
('Hannah', 'Lee', '1990-07-28', 'Female', '07123456794', 'hannah.lee@example.com', 16),
('William', 'Scott', '1988-01-02', 'Male', '07123456795', 'william.scott@example.com', 17),
('Mia', 'Green', '1992-05-13', 'Female', '07123456796', 'mia.green@example.com', 18),
('Charlie', 'Hill', '1994-09-24', 'Male', '07123456797', 'charlie.hill@example.com', 19),
('Sophie', 'Moore', '1991-12-12', 'Female', '07123456798', 'sophie.moore@example.com', 20);





INSERT INTO Departments (department_name, location, head_of_department)
VALUES
('Cardiology', 'Cambridge', 'Dr. Felix Cartwright'),
('Cardiology', 'London', 'Dr. Amelia Starling'),
('Orthopedics', 'Cambridge', 'Dr. Jasper North'),
('Pediatrics', 'London', 'Dr. Clara Wingate'),
('Dermatology', 'Cambridge', 'Dr. Natalie Frost'),
('Oncology', 'Brighton', 'Dr. Leonard Marsh'),
('Gastroenterology', 'London', 'Dr. Sylvie Hawthorne'),
('Radiology', 'Cambridge', 'Dr. Victor Rivers'),
('Psychiatry', 'Brighton', 'Dr. Matilda Grey'),
('Urology', 'London', 'Dr. Harvey Brooks'),
('Ophthalmology', 'Cambridge', 'Dr. Isadora Knight'),
('Dermatology', 'London', 'Dr. Theodore Blaze'),
('Endocrinology', 'Brighton', 'Dr. Veronica Lark'),
('Nephrology', 'Cambridge', 'Dr. Quentin Sage'),
('Pulmonology', 'London', 'Dr. Naomi Ashford'),
('Cardiology', 'Brighton', 'Dr. Cedric Fox'),
('ENT (Ear, Nose, Throat)', 'Cambridge', 'Dr. Zara Redfield'),
('Geriatrics', 'London', 'Dr. Orion Steele'),
('Allergy & Immunology', 'Cambridge', 'Dr. Eliza Windham'),
('Plastic Surgery', 'London', 'Dr. Tobias Fleetwood');



INSERT INTO Doctors (name, surname, specialisation, contact_number, email, working_hours, department_id)
VALUES
('Henry', 'Parker', 'Cardiology', '07123456789', 'henry.parker@example.com', '9 AM - 5 PM', 1),
('Lily', 'Walters', 'Pediatrics', '07712345678', 'lily.walters@example.com', '8 AM - 4 PM', 4),
('George', 'Mason', 'Dermatology', '07890123456', 'george.mason@example.com', '10 AM - 6 PM', 5),
('Isabella', 'Taylor', 'Orthopedics', '07234567890', 'isabella.taylor@example.com', '9 AM - 5 PM', 3),
('Oliver', 'Smith', 'Oncology', '07456789012', 'oliver.smith@example.com', '10 AM - 4 PM', 6),
('Megan', 'Thompson', 'Gastroenterology', '07567890123', 'megan.thompson@example.com', '11 AM - 5 PM', 7),
('Ethan', 'Roberts', 'Radiology', '07678901234', 'ethan.roberts@example.com', '8 AM - 4 PM', 8),
('Chloe', 'White', 'Pulmonology', '07980123456', 'chloe.white@example.com', '9 AM - 5 PM', 9),
('Daniel', 'Evans', 'Psychiatry', '07345678901', 'daniel.evans@example.com', '10 AM - 6 PM', 10),
('Grace', 'Scott', 'Urology', '07123456012', 'grace.scott@example.com', '8 AM - 4 PM', 11),
('Jessica', 'Green', 'Ophthalmology', '07412345678', 'jessica.green@example.com', '9 AM - 5 PM', 12),
('James', 'King', 'Endocrinology', '07789012345', 'james.king@example.com', '10 AM - 4 PM', 13),
('Sophie', 'Hughes', 'Nephrology', '07234567012', 'sophie.hughes@example.com', '8 AM - 4 PM', 14),
('Thomas', 'Harrison', 'Plastic Surgery', '07545678901', 'thomas.harrison@example.com', '9 AM - 5 PM', 15),
('Ella', 'Fletcher', 'ENT (Ear, Nose, Throat)', '07956789012', 'ella.fletcher@example.com', '10 AM - 6 PM', 16),
('Leo', 'Wood', 'Geriatrics', '07890123890', 'leo.wood@example.com', '11 AM - 5 PM', 17),
('Amelia', 'Price', 'Allergy & Immunology', '07345678012', 'amelia.price@example.com', '8 AM - 4 PM', 18),
('Samuel', 'Clarke', 'Dermatology', '07123456345', 'samuel.clarke@example.com', '9 AM - 5 PM', 19),
('Ben', 'Miles', 'Cardiology', '07456789123', 'ben.miles@example.com', '10 AM - 4 PM', 1),
('Ben', 'Nash', 'Pediatrics', '07678901456', 'ben.nash@example.com', '9 AM - 5 PM', 4);


INSERT INTO Appointments (patient_id, doctor_id, appointment_date, appointment_status, remarks)
VALUES
(1, 1, '2024-10-15', 'Scheduled', 'Routine check-up'),                       
(2, 2, '2024-10-22', 'Scheduled', 'Follow-up consultation'),                 
(3, 3, '2024-10-08', 'Completed', 'Annual check-up'),                       
(4, 4, '2024-10-15', 'Cancelled', 'Discussion of symptoms'),                
(5, 5, '2024-10-22', 'Scheduled', 'Skin examination'),                      
(6, 6, '2024-10-08', 'Completed', 'Blood test results'),                    
(7, 7, '2024-10-15', 'Scheduled', 'Consultation for breathing issues'),     
(8, 8, '2024-10-22', 'Scheduled', 'Vision check'),                          
(9, 9, '2024-10-08', 'Completed', 'Psychiatric evaluation'),                 
(10, 10, '2024-10-15', 'Scheduled', 'Urology consultation'),               
(11, 11, '2024-10-22', 'Scheduled', 'Geriatric assessment'),                
(12, 12, '2024-10-08', 'Completed', 'Endocrine check-up'),                  
(13, 13, '2024-10-15', 'Scheduled', 'Surgery consultation'),                 
(14, 14, '2024-10-22', 'Scheduled', 'Allergy testing'),                    
(15, 15, '2024-10-08', 'Completed', 'Pulmonary function test'),              
(16, 16, '2024-10-15', 'Scheduled', 'ENT evaluation'),                     
(17, 17, '2024-10-22', 'Scheduled', 'Check-up for heart'),                  
(18, 18, '2024-10-08', 'Completed', 'Pediatric assessment'),                
(19, 19, '2024-10-15', 'Scheduled', 'Plastic surgery consultation'),         
(20, 20, '2024-10-22', 'Scheduled', 'Follow-up on prescriptions');          


INSERT INTO Prescriptions (patient_id, doctor_id, medicine_name, dosage, duration, prescription_date)
VALUES
(1, 1, 'Atenolol', '50mg', '30 days', '2024-09-15'),
(2, 2, 'Amoxicillin', '500mg', '7 days', '2024-09-22'),
(3, 3, 'Metformin', '1000mg', '30 days', '2024-09-08'),
(4, 4, 'Ibuprofen', '400mg', '15 days', '2024-09-15'),
(5, 5, 'Lisinopril', '20mg', '30 days', '2024-09-22'),
(6, 6, 'Simvastatin', '40mg', '30 days', '2024-09-08'),
(7, 7, 'Sertraline', '100mg', '30 days', '2024-09-15'),
(8, 8, 'Levothyroxine', '50mcg', '30 days', '2024-09-22'),
(9, 9, 'Omeprazole', '20mg', '30 days', '2024-09-08'),
(10, 10, 'Aspirin', '81mg', '30 days', '2024-09-15'),
(11, 11, 'Atorvastatin', '10mg', '30 days', '2024-09-22'),
(12, 12, 'Furosemide', '40mg', '30 days', '2024-09-08'),
(13, 13, 'Gabapentin', '300mg', '30 days', '2024-09-15'),
(14, 14, 'Clonazepam', '0.5mg', '30 days', '2024-09-22'),
(15, 15, 'Citalopram', '20mg', '30 days', '2024-09-08'),
(16, 16, 'Prednisone', '10mg', '30 days', '2024-09-15'),
(17, 17, 'Montelukast', '10mg', '30 days', '2024-09-22'),
(18, 18, 'Albuterol', '90mcg', '30 days', '2024-09-08'),
(19, 19, 'Naproxen', '250mg', '30 days', '2024-09-15'),
(20, 20, 'Vitamin D3', '1000 IU', '30 days', '2024-09-22');