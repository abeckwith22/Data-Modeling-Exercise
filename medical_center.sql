-- [*] A medical center employs several doctors
-- [*] A doctor can see many patients
-- [*] A patient can be seen by many doctors
-- [*] During a visit, a patient may be diagnosed to have one or more diseases.

DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center;

CREATE TABLE doctors -- a medical center can employ several doctors
(
    doctor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

CREATE TABLE diagnoses 
(
    diagnosis_id SERIAL PRIMARY KEY,
    diagnosis_name VARCHAR(255) NOT NULL
);

CREATE TABLE patients
(
    patient_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    diag_id INTEGER REFERENCES diagnoses(diagnosis_id) -- diagnosis can be null if patient hasn't seen doctor yet.
);

CREATE TABLE appointment -- a doctor can see many patients, and a patient can be seen by many doctors
(
    appointment_id SERIAL PRIMARY KEY,
    doc_id INTEGER REFERENCES doctors(doctor_id),
    pat_id INTEGER REFERENCES patients(patient_id),
    appointment_date DATE NOT NULL
);

CREATE TABLE patient_diagnoses -- during a visit, a patient may be diagnosed to have one or more diseases
(
    patient_diagnosis_id SERIAL PRIMARY KEY,
    pat_id INTEGER REFERENCES patients(patient_id) NOT NULL,
    diag_id INTEGER REFERENCES diagnoses(diagnosis_id) NOT NULL,
    doc_id INTEGER REFERENCES doctors(doctor_id) NOT NULL
);