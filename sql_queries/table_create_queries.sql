DROP DATABASE IF EXISTS patient_information_system ;

--  'patient_information_system'
CREATE DATABASE patient_information_system;


USE patient_information_system;




CREATE TABLE Address (
    id INT AUTO_INCREMENT,
    street VARCHAR(50),
    city VARCHAR(50),
    post_code VARCHAR(10),
    country VARCHAR(50),
    CONSTRAINT pk_address_id PRIMARY KEY (id)  
);



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




CREATE TABLE Departments (
    id INT AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL,
    location VARCHAR(50),
    head_of_department VARCHAR(50),
    CONSTRAINT pk_department_id PRIMARY KEY (id)  
);



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


--stored function
SELECT get_patient_full_name(id) As patient_full_name, calculate_age(date_of_birth) AS age
FROM Patients
WHERE id = 1;



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


-- Sub queries examples

SELECT p.id, p.name, p.surname, p.email, p.contact_number
FROM Patients p
WHERE p.id IN (
    SELECT patient_id
    FROM Appointments
    WHERE appointment_date >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
    GROUP BY patient_id
);
    
