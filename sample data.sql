
INSERT INTO PERSON (Person_id, FName, MName, SName, Date_of_birth, Phone_number, Gender, Address, Email)
VALUES
    ('P-001', 'John', NULL, 'Doe', '1980-05-15', '+1234567890', 'M', '123 Main St, City, Country', 'john.doe@example.com'),
    ('P-002', 'Jane', NULL, 'Smith', '1975-09-20', '+1987654321', 'F', '456 Oak St, City, Country', 'jane.smith@example.com'),
    ('P-003', 'William', 'Henry', 'Jones', '1982-03-10', '+1122334455', 'M', '789 Elm St, City, Country', 'william.jones@example.com'),
    ('P-004', 'Sarah', NULL, 'Brown', '1990-07-18', '+9988776655', 'F', '987 Maple St, City, Country', 'sarah.brown@example.com'),
    ('P-005', 'Emily', 'Anne', 'Wilson', '1985-11-25', '+3344556677', 'M', '654 Pine St, City, Country', 'emily.wilson@example.com'),
    ('P-006', 'David', 'Michael', 'Johnson', '1988-02-03', '+5566778899', 'F', '321 Cedar St, City, Country', 'david.johnson@example.com'),
    ('P-007', 'Lisa', 'Marie', 'Miller', '1993-06-12', '+9900112233', 'M', '789 Broadway St, City, Country', 'lisa.miller@example.com'),
    ('P-008', 'Michael', NULL, 'Davis', '1978-04-28', '+7788990011', 'F', '987 Oak St, City, Country', 'michael.davis@example.com'),
    ('P-009', 'Amanda', 'Grace', 'Martinez', '1983-08-07', '+5544332211', 'M', '456 Elm St, City, Country', 'amanda.martinez@example.com'),
    ('P-010', 'Matthew', 'Thomas', 'Thompson', '1977-01-17', '+6677889900', 'F', '123 Cedar St, City, Country', 'matthew.thompson@example.com'),
    ('P-011', 'Michael', 'Joseph', 'Brown', '1980-01-01', '+1235631890', 'M', '123 Elm St, City, Country', 'michael.brown@example.com');


    
INSERT INTO HEALTHCARE_PROFESSIONAL (Person_id, Employee_id, Specialization, Department, Working_hours, Start_date)
VALUES
    ('P-003', 'EMP-001', 'Cardiologist', 'Cardiology', '8:00 AM - 4:00 PM', '2021-04-28'),
    ('P-004', 'EMP-002', 'Pediatrician', 'Pediatrics', '9:00 AM - 5:00 PM', '2022-03-27'),
    ('P-005', 'EMP-003', 'Orthopedic Surgeon', 'Orthopedics', '7:00 AM - 3:00 PM', '2023-02-26'),
    ('P-006', 'EMP-004', 'Radiologist', 'Radiology', '8:30 AM - 4:30 PM', '2024-01-25'),
    ('P-007', 'EMP-005', 'Dermatologist', 'Dermatology', '8:00 AM - 4:00 PM', '2021-12-24'),
    ('P-008', 'EMP-006', 'Physical Therapist', 'Physical Therapy', '10:00 AM - 6:00 PM', '2022-11-23'),
    ('P-009', 'EMP-007', 'Pharmacist', 'Pharmacy', '9:00 AM - 5:00 PM', '2023-10-22'),
    ('P-010', 'EMP-008', 'Surgical Nurse', 'Surgery', '7:00 AM - 3:00 PM', '2024-05-03'),
    ('P-011', 'EMP-009', 'Medical Secretary', 'Administration', '8:30 AM - 4:30 PM', '2022-08-20');

-- Sample data for PATIENT table
INSERT INTO PATIENT (Person_id, Patient_id, Medical_history)
VALUES
    ('P-001', 'PT-00001', 'High blood pressure, Diabetes'),
    ('P-002', 'PT-00002', 'Asthma, Allergies'),
    ('P-003', 'PT-00003', 'Knee injury'),
    ('P-004', 'PT-00004', 'Fractured arm'),
    ('P-005', 'PT-00005', 'Acne, Eczema'),
    ('P-006', 'PT-00006', 'Chronic back pain'),
    ('P-007', 'PT-00007', 'Anxiety, Depression'),
    ('P-008', 'PT-00008', 'Migraines'),
    ('P-009', 'PT-00009', 'Heart murmur'),
    ('P-010', 'PT-00010', 'Hypothyroidism');


-- Sample data for ALLERGENS table (already inserted in previous queries)

-- Sample data for MEDICAL_RECORD table
INSERT INTO MEDICAL_RECORD (Record_id, Patient_id, Employee_id, Current_medications, Allergies, Treatment_history, Lab_results, Past_Diagnoses)
VALUES
    ('REC-001', 'PT-00001', 'EMP-001', 'Metformin, Lisinopril', 'Peanuts', 'Regular checkups', 'Blood test normal, ECG results pending', 'High blood pressure, Diabetes'),
    ('REC-002', 'PT-00002', 'EMP-002', 'Albuterol, Fluticasone', 'Tree-Nuts', 'Annual checkups', 'Spirometry results normal', 'Asthma, Allergies'),
    ('REC-003', 'PT-00003', 'EMP-003', NULL, NULL, 'Physical therapy sessions', 'MRI shows torn meniscus', 'Knee injury'),
    ('REC-004', 'PT-00004', 'EMP-004', 'Ibuprofen', 'Dairy', 'Cast applied', 'X-ray shows fracture', 'Fractured arm'),
    ('REC-005', 'PT-00005', 'EMP-005', 'Benzoyl peroxide', NULL, 'Prescribed topical cream', 'Skin biopsy results pending', 'Acne, Eczema'),
    ('REC-006', 'PT-00006', 'EMP-001', 'Acetaminophen, Ibuprofen', NULL, 'Physical therapy sessions', 'MRI results pending', 'Chronic back pain'),
    ('REC-007', 'PT-00007', 'EMP-002', 'Sertraline, Lorazepam', NULL, 'Counseling sessions', NULL, 'Anxiety, Depression'),
    ('REC-008', 'PT-00008', 'EMP-003', 'Sumatriptan', NULL, 'Prescribed medication', NULL, 'Migraines'),
    ('REC-009', 'PT-00009', 'EMP-004', 'Levothyroxine', NULL, 'Regular checkups', NULL, 'Heart murmur'),
    ('REC-010', 'PT-00010', 'EMP-005', 'Levothyroxine', NULL, 'Annual checkups', NULL, 'Hypothyroidism');

-- Sample data for INSURANCE_INFORMATION table
INSERT INTO INSURANCE_INFORMATION (Insurance_id, Patient_id, Amount, Insurance_company, Patient_insurance)
VALUES
    ('INS-001', 'PT-00001', 1500.00, 'Health Insurance Inc.', 'Gold Plan'),
    ('INS-002', 'PT-00002', 2000.00, 'Health Insurance Inc.', 'Silver Plan'),
    ('INS-003', 'PT-00003', 3000.00, 'MediCare', 'Platinum Plan'),
    ('INS-004', 'PT-00004', 1200.00, 'MediCare', 'Basic Plan'),
    ('INS-005', 'PT-00005', 2500.00, 'Health Insurance Inc.', 'Gold Plan'),
    ('INS-006', 'PT-00006', 1800.00, 'MediCare', 'Silver Plan'),
    ('INS-007', 'PT-00007', 2200.00, 'Health Insurance Inc.', 'Bronze Plan'),
    ('INS-008', 'PT-00008', 1500.00, 'MediCare', 'Gold Plan'),
    ('INS-009', 'PT-00009', 1800.00, 'Health Insurance Inc.', 'Silver Plan'),
    ('INS-010', 'PT-00010', 2000.00, 'MediCare', 'Platinum Plan');

-- Sample data for BILLING table
INSERT INTO BILLING (Billing_id, Patient_id, Insurance_id, Payment_method, Itemized_costs, Date)
VALUES
    ('BIL-001', 'PT-00001', 'INS-001', 'Insurance', 'Consultation: $300, Medications: $200', '2024-04-15'),
    ('BIL-002', 'PT-00002', 'INS-002', 'Credit Card', 'Consultation: $500, Medications: $300', '2024-04-16'),
    ('BIL-003', 'PT-00003', 'INS-003', 'Insurance', 'Consultation: $400, Physical therapy: $500', '2024-04-17'),
    ('BIL-004', 'PT-00004', 'INS-004', 'Cash', 'Cast: $300, X-ray: $200', '2024-04-18'),
    ('BIL-005', 'PT-00005', 'INS-005', 'Insurance', 'Consultation: $400, Medications: $100', '2024-04-19'),
    ('BIL-006', 'PT-00006', 'INS-006', 'Credit Card', 'Consultation: $350, Physical therapy: $450', '2024-04-20'),
    ('BIL-007', 'PT-00007', 'INS-007', 'Insurance', 'Consultation: $300, Counseling: $200', '2024-04-21'),
    ('BIL-008', 'PT-00008', 'INS-008', 'Insurance', 'Consultation: $250, Medications: $100', '2024-04-22'),
    ('BIL-009', 'PT-00009', 'INS-009', 'Credit Card', 'Consultation: $300', '2024-04-23'),
    ('BIL-010', 'PT-00010', 'INS-010', 'Insurance', 'Consultation: $400', '2024-04-24');

-- Sample data for APPOINTMENT table
INSERT INTO APPOINTMENT (Appointment_id, Patient_id, Employee_id, Purpose, Date, Time)
VALUES
    ('APT-001', 'PT-00001', 'EMP-001', 'Follow-up appointment', '2024-05-01', '09:00:00'),
    ('APT-002', 'PT-00002', 'EMP-002', 'Annual checkup', '2024-05-02', '10:00:00'),
    ('APT-003', 'PT-00003', 'EMP-003', 'Physical therapy session', '2024-05-03', '11:00:00'),
    ('APT-004', 'PT-00004', 'EMP-004', 'Cast removal', '2024-05-04', '12:00:00'),
    ('APT-005', 'PT-00005', 'EMP-005', 'Dermatology consultation', '2024-05-05', '13:00:00'),
    ('APT-006', 'PT-00006', 'EMP-001', 'Back pain assessment', '2024-05-06', '14:00:00'),
    ('APT-007', 'PT-00007', 'EMP-002', 'Counseling session', '2024-05-07', '15:00:00'),
    ('APT-008', 'PT-00008', 'EMP-003', 'Migraine consultation', '2024-05-08', '16:00:00'),
    ('APT-009', 'PT-00009', 'EMP-004', 'Heart murmur checkup', '2024-05-09', '17:00:00'),
    ('APT-010', 'PT-00010', 'EMP-005', 'Thyroid checkup', '2024-05-10', '18:00:00');
    
-- Sample data for TREATMENT table
INSERT INTO TREATMENT (Treatment_id, Recipient_id, Employee_id_prescriber, Employee_id_conductor, Outcome, End_date, Start_date, Description, Pharmacy)
VALUES
    ('TRT-001', 'PT-00001', 'EMP-001', 'EMP-001', 'Stable condition', '2024-07-15', '2023-03-01', 'Prescribed medication', 'ABC Pharmacy'),
    ('TRT-002', 'PT-00002', 'EMP-002', 'EMP-002', 'Improvement shown', '2023-06-16', '2023-03-02', 'Prescribed inhaler', 'XYZ Pharmacy'),
    ('TRT-003', 'PT-00003', 'EMP-003', 'EMP-003', 'Successful recovery', '2024-09-17', '2023-02-03', 'Physical therapy sessions', 'DEF Pharmacy'),
    ('TRT-004', 'PT-00004', 'EMP-004', 'EMP-004', 'Healing well', '2023-08-18', '2023-01-04', 'Follow-up appointment scheduled', 'GHI Pharmacy'),
    ('TRT-005', 'PT-00005', 'EMP-005', 'EMP-005', 'Skin condition improving', '2024-05-19', '2023-06-05', 'Continue medication', 'JKL Pharmacy'),
    ('TRT-006', 'PT-00006', 'EMP-001', 'EMP-001', 'Reduced pain levels', '2024-08-20', '2023-01-06', 'Physical therapy sessions', 'MNO Pharmacy'),
    ('TRT-007', 'PT-00007', 'EMP-002', 'EMP-002', 'Mental health improving', '2023-10-21', '2023-02-07', 'Continued counseling sessions', 'PQR Pharmacy'),
    ('TRT-008', 'PT-00008', 'EMP-003', 'EMP-003', 'Less frequent migraines', '2024-11-22', '2023-02-08', 'Prescribed new medication', 'STU Pharmacy'),
    ('TRT-009', 'PT-00009', 'EMP-004', 'EMP-004', 'Stable condition', '2024-07-23', '2023-04-09', 'Follow-up appointment scheduled', 'VWX Pharmacy'),
    ('TRT-010', 'PT-00010', 'EMP-005', 'EMP-005', 'Thyroid levels balanced', '2024-06-24', '2023-05-10', 'Continue current medication', 'YZA Pharmacy');

-- Sample data for DOCTOR, TECHNICIAN, NURSE, and ADMINISTRATIVE_STAFF tables
INSERT INTO DOCTOR (Employee_doctor_id)
VALUES
    ('EMP-001'),
    ('EMP-002'),
    ('EMP-003'),
    ('EMP-004'),
    ('EMP-005');

INSERT INTO TECHNICIAN (Employee_tech_id)
VALUES
	('EMP-003'),
    ('EMP-007'),
    ('EMP-008');

INSERT INTO NURSE (Employee_nurse_id)
VALUES
    ('EMP-004'),
    ('EMP-009');

INSERT INTO ADMINISTRATIVE_STAFF (Employee_admin_id)
VALUES
    ('EMP-005');

-- Additional data for VIP Patient View
INSERT INTO APPOINTMENT (Appointment_id, Patient_id, Employee_id, Purpose, Date, Time)
VALUES
    ('APT-011', 'PT-00001', 'EMP-001', 'Follow-up appointment', '2024-04-25', '09:00:00'),
    ('APT-012', 'PT-00001', 'EMP-001', 'Consultation', '2024-04-26', '10:00:00'),
    ('APT-013', 'PT-00001', 'EMP-001', 'Consultation', '2024-04-27', '11:00:00'),
    ('APT-014', 'PT-00001', 'EMP-001', 'Consultation', '2024-04-28', '12:00:00'),
    ('APT-015', 'PT-00001', 'EMP-001', 'Consultation', '2024-04-29', '13:00:00'),
    ('APT-016', 'PT-00002', 'EMP-002', 'Follow-up appointment', '2024-04-25', '09:00:00'),
    ('APT-017', 'PT-00002', 'EMP-002', 'Consultation', '2024-04-26', '10:00:00'),
    ('APT-018', 'PT-00002', 'EMP-002', 'Consultation', '2024-04-27', '11:00:00'),
    ('APT-019', 'PT-00002', 'EMP-002', 'Consultation', '2024-04-28', '12:00:00'),
    ('APT-020', 'PT-00002', 'EMP-002', 'Consultation', '2024-04-29', '13:00:00'),
    ('APT-021', 'PT-00003', 'EMP-003', 'Follow-up appointment', '2024-04-25', '09:00:00'),
    ('APT-022', 'PT-00003', 'EMP-003', 'Consultation', '2024-04-26', '10:00:00'),
    ('APT-023', 'PT-00003', 'EMP-003', 'Consultation', '2024-04-27', '11:00:00'),
    ('APT-024', 'PT-00003', 'EMP-003', 'Consultation', '2024-04-28', '12:00:00'),
    ('APT-025', 'PT-00003', 'EMP-003', 'Consultation', '2024-04-29', '13:00:00');

-- Additional data for Preferred Healthcare Professional View
INSERT INTO APPOINTMENT (Appointment_id, Patient_id, Employee_id, Purpose, Date, Time)
VALUES
    ('APT-026', 'PT-00004', 'EMP-004', 'Follow-up appointment', '2024-03-15', '09:00:00'),
    ('APT-027', 'PT-00004', 'EMP-004', 'Follow-up appointment', '2024-03-25', '09:00:00'),
    ('APT-028', 'PT-00004', 'EMP-004', 'Follow-up appointment', '2024-04-15', '09:00:00'),
    ('APT-029', 'PT-00004', 'EMP-004', 'Follow-up appointment', '2024-04-25', '09:00:00'),
    ('APT-030', 'PT-00005', 'EMP-005', 'Follow-up appointment', '2024-03-15', '09:00:00'),
    ('APT-031', 'PT-00005', 'EMP-005', 'Follow-up appointment', '2024-03-25', '09:00:00'),
    ('APT-032', 'PT-00005', 'EMP-005', 'Follow-up appointment', '2024-04-15', '09:00:00'),
    ('APT-033', 'PT-00005', 'EMP-005', 'Follow-up appointment', '2024-04-25', '09:00:00');

-- Additional data for TREATMENT table
INSERT INTO TREATMENT (Treatment_id, Recipient_id, Employee_id_prescriber, Employee_id_conductor, Outcome, End_date, Start_date, Description, Pharmacy)
VALUES
    ('TRT-011', 'PT-00001', 'EMP-001', 'EMP-001', 'Stable condition', '2024-05-15', '2024-04-01', 'Prescribed medication', 'ABC Pharmacy'),
    ('TRT-012', 'PT-00002', 'EMP-002', 'EMP-002', 'Improvement shown', '2024-05-16', '2024-04-02', 'Prescribed inhaler', 'XYZ Pharmacy'),
    ('TRT-013', 'PT-00002', 'EMP-003', 'EMP-003', 'Successful recovery', '2024-05-17', '2024-04-03', 'Physical therapy sessions', 'DEF Pharmacy'),
    ('TRT-014', 'PT-00002', 'EMP-004', 'EMP-004', 'Healing well', '2024-05-18', '2024-04-04', 'Follow-up appointment scheduled', 'GHI Pharmacy'),
    ('TRT-015', 'PT-00005', 'EMP-005', 'EMP-005', 'Skin condition improving', '2024-05-19', '2024-04-05', 'Continue medication', 'JKL Pharmacy'),
    ('TRT-016', 'PT-00001', 'EMP-001', 'EMP-001', 'Reduced pain levels', '2024-05-20', '2024-04-06', 'Physical therapy sessions', 'MNO Pharmacy'),
    ('TRT-017', 'PT-00001', 'EMP-002', 'EMP-002', 'Mental health improving', '2024-05-21', '2024-04-07', 'Continued counseling sessions', 'PQR Pharmacy'),
    ('TRT-018', 'PT-00001', 'EMP-003', 'EMP-003', 'Less frequent migraines', '2024-05-22', '2024-04-08', 'Prescribed new medication', 'STU Pharmacy'),
    ('TRT-019', 'PT-00001', 'EMP-004', 'EMP-004', 'Stable condition', '2024-05-23', '2024-04-09', 'Follow-up appointment scheduled', 'VWX Pharmacy'),
    ('TRT-020', 'PT-00010', 'EMP-005', 'EMP-005', 'Thyroid levels balanced', '2024-05-24', '2024-04-10', 'Continue current medication', 'YZA Pharmacy'),
    ('TRT-021', 'PT-00001', 'EMP-001', 'EMP-001', 'Stable condition', '2024-05-15', '2024-04-11', 'Prescribed medication', 'ABC Pharmacy'),
    ('TRT-022', 'PT-00002', 'EMP-002', 'EMP-002', 'Improvement shown', '2024-05-16', '2024-04-12', 'Prescribed inhaler', 'XYZ Pharmacy'),
    ('TRT-023', 'PT-00003', 'EMP-003', 'EMP-003', 'Successful recovery', '2024-05-17', '2024-04-13', 'Physical therapy sessions', 'DEF Pharmacy'),
    ('TRT-024', 'PT-00002', 'EMP-004', 'EMP-004', 'Healing well', '2024-05-18', '2024-04-14', 'Follow-up appointment scheduled', 'GHI Pharmacy'),
    ('TRT-025', 'PT-00002', 'EMP-005', 'EMP-005', 'Skin condition improving', '2024-05-19', '2024-04-15', 'Continue medication', 'JKL Pharmacy');


-- Additional data for Potential VIP Patient View
INSERT INTO APPOINTMENT (Appointment_id, Patient_id, Employee_id, Purpose, Date, Time)
VALUES
    ('APT-034', 'PT-00007', 'EMP-002', 'Follow-up appointment', '2024-03-15', '09:00:00'),
    ('APT-035', 'PT-00007', 'EMP-002', 'Follow-up appointment', '2024-03-25', '09:00:00'),
    ('APT-036', 'PT-00007', 'EMP-002', 'Follow-up appointment', '2024-04-05', '09:00:00'),
    ('APT-037', 'PT-00007', 'EMP-002', 'Follow-up appointment', '2024-04-15', '09:00:00'),
    ('APT-038', 'PT-00007', 'EMP-002', 'Follow-up appointment', '2024-04-25', '09:00:00'),
    ('APT-039', 'PT-00008', 'EMP-003', 'Follow-up appointment', '2024-03-15', '09:00:00'),
    ('APT-040', 'PT-00008', 'EMP-003', 'Follow-up appointment', '2024-03-25', '09:00:00'),
    ('APT-041', 'PT-00008', 'EMP-003', 'Follow-up appointment', '2024-04-05', '09:00:00'),
    ('APT-042', 'PT-00008', 'EMP-003', 'Follow-up appointment', '2024-04-15', '09:00:00'),
    ('APT-043', 'PT-00008', 'EMP-003', 'Follow-up appointment', '2024-04-25', '09:00:00');

-- Additional data for Top Staff View
INSERT INTO APPOINTMENT (Appointment_id, Patient_id, Employee_id, Purpose, Date, Time)
VALUES
    ('APT-044', 'PT-00009', 'EMP-004', 'Follow-up appointment', '2024-04-01', '09:00:00'),
    ('APT-045', 'PT-00009', 'EMP-004', 'Follow-up appointment', '2024-04-02', '09:00:00'),
    ('APT-046', 'PT-00009', 'EMP-004', 'Follow-up appointment', '2024-04-03', '09:00:00'),
    ('APT-047', 'PT-00009', 'EMP-004', 'Follow-up appointment', '2024-04-04', '09:00:00'),
    ('APT-048', 'PT-00009', 'EMP-004', 'Follow-up appointment', '2024-04-05', '09:00:00'),
    ('APT-049', 'PT-00010', 'EMP-005', 'Follow-up appointment', '2024-04-01', '09:00:00'),
    ('APT-050', 'PT-00010', 'EMP-005', 'Follow-up appointment', '2024-04-02', '09:00:00'),
    ('APT-051', 'PT-00010', 'EMP-005', 'Follow-up appointment', '2024-04-03', '09:00:00'),
    ('APT-052', 'PT-00010', 'EMP-005', 'Follow-up appointment', '2024-04-04', '09:00:00'),
    ('APT-053', 'PT-00010', 'EMP-005', 'Follow-up appointment', '2024-04-05', '09:00:00');
