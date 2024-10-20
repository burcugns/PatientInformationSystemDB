DROP DATABASE IF EXISTS patient_information_system ;

-- Create a new database : 'patient_information_system'
CREATE DATABASE patient_information_system;

-- Use database
USE patient_information_system;

-- Create the Address table


CREATE TABLE Address (
    id INT AUTO_INCREMENT,
    street VARCHAR(50),
    city VARCHAR(50),
    post_code VARCHAR(10),
    country VARCHAR(50),
    CONSTRAINT pk_address_id PRIMARY KEY (id)  
);


-- Create the Patients table 
CREATE TABLE Patients (
    id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    gender VARCHAR(50),
    contact_number VARCHAR(14),
    email VARCHAR(50),
    address_id INT,
    CONSTRAINT pk_patient_id PRIMARY KEY (id),  
    CONSTRAINT fk_patient_address FOREIGN KEY (address_id) 
    REFERENCES Address(id)
);



-- Create the Departments table 
CREATE TABLE Departments (
    id INT AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL,
    location VARCHAR(50),
    head_of_department VARCHAR(50),
    CONSTRAINT pk_department_id PRIMARY KEY (id)  
);


-- Create the Doctors table
CREATE TABLE Doctors (
    id INT AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL,
    specialisation VARCHAR(50),
    contact_number VARCHAR(14),
    email VARCHAR(50),
    working_hours VARCHAR(50),
    department_id INT,
    CONSTRAINT pk_doctor_id PRIMARY KEY (id),  
    CONSTRAINT fk_doctor_department FOREIGN KEY (department_id) 
    REFERENCES Departments(id)
);

-- Create the Appointments table 
CREATE TABLE Appointments (
    id INT AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE NOT NULL,
    appointment_status 
    ENUM('Scheduled', 'Completed', 'Cancelled') NOT NULL,
    remarks TEXT,
    CONSTRAINT pk_appointment_id PRIMARY KEY (id),  
    CONSTRAINT fk_appointment_patient FOREIGN KEY (patient_id) 
    REFERENCES Patients(id),
    CONSTRAINT fk_appointment_doctor FOREIGN KEY (doctor_id)
    REFERENCES Doctors(id)
);


-- Create the Prescriptions table 
CREATE TABLE Prescriptions (
    id INT AUTO_INCREMENT,
    patient_id INT,
    doctor_id INT,
    medicine_name VARCHAR(50) NOT NULL,
    dosage VARCHAR(50),
    duration VARCHAR(50),
    prescription_date DATETIME NOT NULL,
    CONSTRAINT pk_prescription_id PRIMARY KEY (id),  
    CONSTRAINT fk_prescription_patient FOREIGN KEY (patient_id) 
    REFERENCES Patients(id), 
    CONSTRAINT fk_prescription_doctor FOREIGN KEY (doctor_id)
     REFERENCES Doctors(id) 
);


-- Views

CREATE VIEW today_appointment_view AS
SELECT 
    a.id AS appointment_id,
    p.name AS patient_name,
    p.surname AS patient_surname,
    d.name AS doctor_name,
    d.surname AS doctor_surname,
    a.appointment_date,
    a.appointment_status,
    a.remarks
FROM 
    Appointments a
INNER JOIN 
    Patients p ON a.patient_id = p.id
INNER JOIN 
    Doctors d ON a.doctor_id = d.id
WHERE 
    a.appointment_date = CURDATE();




CREATE VIEW patients_by_doctor_name_view AS
SELECT 
    p.name AS patient_name,
    p.surname AS patient_surname,
    d.name AS doctor_name
FROM 
    Appointments a
INNER JOIN 
    Patients p ON a.patient_id = p.id
INNER JOIN 
    Doctors d ON a.doctor_id = d.id;
    

CREATE VIEW patient_prescription_view AS
SELECT
    p.name AS patient_name,
    p.surname AS patient_surname,
    pr.medicine_name AS prescription_medicine,
    pr.dosage AS prescription_dosage
FROM 
    Prescriptions pr
INNER JOIN 
    Patients p ON pr.patient_id = p.id;



     CREATE VIEW departments_of_doctors_view AS
SELECT 
    d.name AS doctor_name,
    d.surname AS doctor_surname,
    de.department_name 
FROM 
   Departments as de
INNER JOIN 
    Doctors d ON de.id = d.id;


CREATE VIEW patient_all_info_view AS
SELECT 
    p.name As patient_name,
	p.surname As patient_surname,
    p.gender As patient_gender,
    p.date_of_birth As patient_date_of_birth,
    p.email As patient_email,
	p.contact_number As patient_contact_number,
    ad.city As patient_city,
    d.name As patient_doctor_name,
    a.appointment_date As patient_appointment_date,
    a.appointment_status As patient_appointment_status,
    dp.department_name AS patient_doctor_department,
    pr.medicine_name As patient_medicine_name
FROM 
    Patients p
INNER JOIN 
   Appointments  a ON a.patient_id = p.id
INNER JOIN 
    Doctors d ON a.doctor_id = d.id
INNER JOIN 
	Address ad ON p.address_id=ad.id
INNER JOIN
	Prescriptions pr ON p.id=pr.patient_id
INNER JOIN
	Departments dp ON dp.id=d.department_id
order by a.appointment_date


-- Stored Functions 

DELIMITER //
CREATE FUNCTION calculate_age(date_of_birth DATE)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE age INT;
    SET age = TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE());
    RETURN age;
END //
DELIMITER ;




DELIMITER //
CREATE FUNCTION get_patient_full_name(patient_id INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    DECLARE full_name VARCHAR(100);
	SELECT CONCAT(name, ' ', surname) INTO full_name
    FROM Patients
    WHERE id = patient_id;
    
    RETURN full_name;
END //
DELIMITER ;


SELECT get_patient_full_name(id) As patient_full_name, calculate_age(date_of_birth) AS age
FROM Patients
WHERE id = 1;


-- Sub queries examples

SELECT p.id, p.name, p.surname, p.email, p.contact_number
FROM Patients p
WHERE p.id IN (
    SELECT patient_id
    FROM Appointments
    WHERE appointment_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
    GROUP BY patient_id
);
    
-- Stored procedure

DELIMITER //
CREATE PROCEDURE add_prescription (
    IN p_patient_id INT,
    IN p_medicine_name VARCHAR(255),
    IN p_dosage VARCHAR(255),
    IN p_prescription_date DATE
)
BEGIN
    INSERT INTO Prescriptions (patient_id, medicine_name, dosage, prescription_date)
    VALUES (p_patient_id, p_medicine_name, p_dosage, p_prescription_date);
END //
DELIMITER ;

-- Event


DELIMITER //
CREATE EVENT delete_past_appointments_event
ON SCHEDULE EVERY 3 MONTH
DO
BEGIN
    DELETE FROM Appointments
    WHERE appointment_date < CURDATE();
END//
DELIMITER ;


--Trigger

DELIMITER //
CREATE TRIGGER delete_patient_appointments_trigger
BEFORE DELETE ON Patients
FOR EACH ROW
BEGIN
    DELETE FROM Appointments
    WHERE patient_id = OLD.id;
	DELETE FROM Prescriptions
    WHERE patient_id = OLD.id;
END//
DELIMITER ;



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