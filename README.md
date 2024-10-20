# Patient Information System Database

## Overview
The **Patient Information System Database** is designed to manage and organize important data about patients, doctors, departments, appointments, and prescriptions in a healthcare setting. 

## Database Structure

### Tables
- **Address**: Stores patient addresses.
- **Patients**: Holds patient information.
- **Departments**: Manages department data.
- **Doctors**: Stores doctor details.
- **Appointments**: Manages appointment scheduling and details.
- **Prescriptions**: Contains patient prescriptions.

### Relationships and Constraints
- **Primary Keys**: Each table has a unique ID field that serves as the primary key.
- **Foreign Keys**:
  - `address_id` in the **Patients** table links to the **Address** table.
  - `department_id` in the **Doctors** table links to the **Departments** table.
  - `patient_id` and `doctor_id` in the **Appointments** and **Prescriptions** tables link to the **Patients** and **Doctors** tables, respectively.

## Views
The following views have been created to simplify data retrieval:
- `today_appointment_view`: Displays today's appointments with patient and doctor details.
- `patients_by_doctor_name_view`: Lists all patients assigned to each doctor.
- `patient_prescription_view`: Shows prescriptions for each patient.
- `patient_all_info_view`: Provides comprehensive patient information, including appointments and prescriptions.
- `departments_of_doctors_view`: Displays details of doctors and their associated departments.

## Functions and Procedures

### Stored Functions
- **calculate_age**: Computes the patient's age based on their date of birth.
- **get_patient_full_name**: Retrieves the full name of a patient from the records.

### Stored Procedures
- **add_prescription**: Simplifies the process of adding new prescriptions to the database.

## Events and Triggers

### Events
- **delete_past_appointments_event**: Deletes appointments older than 3 months on a recurring basis.

### Triggers
- **delete_patient_appointments_trigger**: Automatically deletes appointments and prescriptions associated with a patient when their record is removed.

## SQL Queries
The system includes SQL queries for:
- **Creating Tables**: Queries for defining the structure of each table.
- **Inserting Data**: Example insert queries to populate the database with sample data.
- **Creating Views**: Queries to create the different views for efficient data retrieval.

## Conclusion
This system provides an efficient way to manage healthcare data, ensuring data integrity, ease of access, and automation of recurring tasks. It offers a solid foundation for maintaining patient records, scheduling, and prescription management.

---