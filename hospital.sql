create database hospital_data;
use hospital_data;
create table country(
contry_id int primary key,
contry_name varchar(50)

);
desc country;
create table patient(
patient_id int primary key,
first_naem varchar(50),
last_naem varchar(50),
dat_of_birth date,
phone_number int,
email_address varchar(50),
address_line1 varchar(50),
address_line2 varchar(50),
stat varbinary(50),
contry_id int,
foreign key (contry_id)
references  country(contry_id),
created_at datetime
);
create table gender(
gender_id int primary key,
gender_name varchar(50)
);
alter table patient
add column gender_id int;
alter table patient
add constraint fk_gender_patient
foreign key (gender_id)
references gender(gender_id);
select* from patient;
desc patient;
create table doctor(
doctor_id int primary key,
first_name varchar(50),
last_naem varchar(50),
gender_id int,
foreign key (gender_id)
references gender(gender_id),
created_at datetime
);
create table doctor_specillisation(
doctor_id int primary key,
foreign key (doctor_id)
references doctor(doctor_id)
);
create table special(
specialisation_id int primary key,
full_name varchar(50)
);
alter table doctor_specillisation
add column specialisation_id int ;
alter table doctor_specillisation
add constraint fk_special_doctor_specillisation
foreign key (specialisation_id)
references special(specialisation_id);
create table appointment(
appointment_id int primary key,
patient_id int,
doctor_id int ,
appointment_datetime datetime,
reason varchar(100),
created_at datetime,
foreign key (patient_id)
references patient(patient_id),
foreign key (doctor_id) 
references doctor(doctor_id)
);
create table appointment_states(
status_id int primary key,
full_name varchar(100));
alter table appointment
add column status_id int;
alter table appointment
add constraint fk_appointment_states_appointment
foreign key (status_id)
references appointment_states(status_id);
create table appointment_note(
note_id int primary key,
appointment_id int,
notes varchar(50),
created_at datetime,
creared_by varchar(100),
foreign key (appointment_id)
references appointment(appointment_id)
);
create table prescription(
prescription_id int primary key,
appointment_id int,
foreign key (appointment_id)
references appointment(appointment_id),
medicine_name varchar(50),
dosage int,
frequency int,
instructions varchar(1000),
created_at datetime,
created_by varchar(100)
);
create table bill_states(
bill_status_id int primary key,
full_name varchar(100)
);
create table pyment_method(
payment_method_id int primary key,
full_name varchar(100)
);
create table patient_bill(

bill_id int primary key,
appointment_id int ,
amount int ,
bill_status_id int,
payment_method_id int ,
foreign key (appointment_id)
references appointments(appointment_id),
foreign key (payment_method_id)
references pyment_method(payment_method_id),
foreign key (bill_status_id)
references bill_states(bill_status_id)
);

INSERT INTO country VALUES
(1, 'India'),
(2, 'United States'),
(3, 'United Kingdom'),
(4, 'Australia'),
(5, 'Canada');

INSERT INTO gender VALUES
(1, 'Male'),
(2, 'Female'),
(3, 'Other');


INSERT INTO special VALUES
(301, 'Cardiology'),
(302, 'Dermatology'),
(303, 'Orthopedics'),
(304, 'Neurology'),
(305, 'General Medicine');

INSERT INTO appointment_states VALUES
(1, 'Scheduled'),
(2, 'Completed'),
(3, 'Cancelled'),
(4, 'In Progress'),
(5, 'Rescheduled');


INSERT INTO bill_states VALUES
(1, 'Paid'),
(2, 'Pending'),
(3, 'Partially Paid'),
(4, 'Cancelled'),
(5, 'Refunded');

INSERT INTO pyment_method VALUES
(1, 'UPI'),
(2, 'Cash'),
(3, 'Credit Card'),
(4, 'Debit Card'),
(5, 'Net Banking');


ALTER TABLE patient
MODIFY phone_number VARCHAR(15);
select * from patient;
desc patient;
ALTER TABLE patient
CHANGE COLUMN stat state VARCHAR(50);
INSERT INTO patient VALUES
(101, 'Rahul', 'Sharma', '1998-05-12', '9876543210',
 'rahul@example.com', '12 MG Road', 'Near Metro Station',
 'Karnataka', 1, '2026-01-10 09:30:00', 1),

(102, 'Priya', 'Patil', '2000-08-21', '9876543211',
 'priya@example.com', '45 Jayanagar', '4th Block',
 'Karnataka', 1, '2026-01-11 10:00:00', 2),

(103, 'Arjun', 'Reddy', '1995-03-15', '9876543212',
 'arjun@example.com', '22 Banjara Hills', 'Road No 5',
 'Telangana', 1, '2026-01-12 11:00:00', 1),

(104, 'Sneha', 'Kulkarni', '2001-11-09', '9876543213',
 'sneha@example.com', '18 FC Road', 'Shivaji Nagar',
 'Maharashtra', 1, '2026-01-13 12:00:00', 2),

(105, 'Kiran', 'Kumar', '1997-07-25', '9876543214',
 'kiran@example.com', '33 Anna Nagar', 'Near Bus Stand',
 'Tamil Nadu', 1, '2026-01-14 13:00:00', 1);

INSERT INTO doctor VALUES
(201, 'Ramesh', 'Gowda', 1, '2026-01-01 09:00:00'),
(202, 'Anjali', 'Rao', 2, '2026-01-01 09:30:00'),
(203, 'Vikram', 'Desai', 1, '2026-01-02 10:00:00'),
(204, 'Meena', 'Iyer', 2, '2026-01-02 10:30:00');

INSERT INTO doctor_specillisation VALUES
(201, 301),
(202, 302),
(203, 303),
(204, 305);

INSERT INTO appointment VALUES
(401, 101, 201, '2026-02-10 10:00:00',
 'Chest pain consultation', '2026-02-01 09:00:00', 2),

(402, 102, 202, '2026-02-11 11:30:00',
 'Skin allergy', '2026-02-02 10:00:00', 2),

(403, 103, 203, '2026-02-12 14:00:00',
 'Knee pain', '2026-02-03 11:00:00', 1),

(404, 104, 204, '2026-02-13 09:30:00',
 'General health checkup', '2026-02-04 12:00:00', 2),

(405, 105, 201, '2026-02-14 16:00:00',
 'Heart health consultation', '2026-02-05 13:00:00', 3);


-- =====================================
-- 11. APPOINTMENT NOTE
-- =====================================

INSERT INTO appointment_note VALUES
(501, 401, 'Patient condition stable',
 '2026-02-10 10:45:00', 'Dr. Ramesh'),

(502, 402, 'Skin allergy observed',
 '2026-02-11 12:15:00', 'Dr. Anjali'),

(503, 403, 'X-ray recommended',
 '2026-02-12 14:45:00', 'Dr. Vikram'),

(504, 404, 'Routine checkup completed',
 '2026-02-13 10:30:00', 'Dr. Meena');

INSERT INTO prescription VALUES
(601, 401, 'Aspirin', 75, 1,
 'Take as prescribed by the doctor',
 '2026-02-10 10:50:00', 'Dr. Ramesh'),

(602, 402, 'Cetirizine', 10, 1,
 'Take as prescribed by the doctor',
 '2026-02-11 12:20:00', 'Dr. Anjali'),

(603, 403, 'Paracetamol', 500, 2,
 'Take as prescribed by the doctor',
 '2026-02-12 14:50:00', 'Dr. Vikram'),

(604, 404, 'Vitamin D', 60, 1,
 'Take as prescribed by the doctor',
 '2026-02-13 10:35:00', 'Dr. Meena');

INSERT INTO patient_bill VALUES
(701, 401, 1500, 1, 1),
(702, 402, 800, 1, 2),
(703, 403, 2500, 2, 3),
(704, 404, 1200, 1, 4),
(705, 405, 1800, 3, 5);
SELECT * FROM country;
SELECT * FROM gender;
SELECT * FROM patient;
desc patient;
SELECT * FROM doctor;
SELECT * FROM special;
SELECT * FROM doctor_specillisation;
SELECT * FROM appointment_states;
SELECT * FROM appointment;
SELECT * FROM appointment_note;
SELECT * FROM prescription;
SELECT * FROM bill_states;
SELECT * FROM pyment_method;
SELECT * FROM patient_bill;

desc patient_bill;
use hospital_data;
alter table appointment
rename appointments;
alter table appointments
add column name_u int;
alter table appointments
drop column name_u ;
alter table appointments 
modify column reason varchar(1000);
commit;
truncate table patient_bill;
drop table patient_bill;
rollback;
select * from patient_bill;
commit;
start transaction;
update country
set contry_name = 'India'
where contry_id=1;
rollback ; 
select* from country;
START TRANSACTION;

UPDATE country
SET contry_name = 'India_ka'
WHERE contry_id = 1;

SELECT * FROM country;

ROLLBACK;

SELECT * FROM country;
create user 'ragghs'@'localhost'
identified by 'ullas@123';
grant select
on hospital_data.bill_states
to  'ragghs'@'localhost';