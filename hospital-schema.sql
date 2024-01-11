drop database if exists hospital;
create database hospital;
use hospital;

create table physician (
  id int primary key,
  name varchar(255),
  phonenumber varchar(255),
  address varchar(255),
  certificationnumber varchar(255),
  fieldofexpertise varchar(255)
);

create table nurse (
  id int primary key,
  name varchar(255),
  phonenumber varchar(255),
  address varchar(255),
  certificationnumber varchar(255)
);

create table patient (
  id int primary key,
  name varchar(255),
  address varchar(255),
  phonenumber varchar(255)
);

create table healthrecord (
  id int primary key,
  patientid int,
  disease varchar(255),
  date date,
  status varchar(255),
  description text
);

create table room (
  roomnumber int primary key,
  capacity int,
  feepernight decimal(10, 2)
);

create table hospitalized (
  patientid int,
  roomnumber int,
  startdate date,
  enddate date,
  primary key (patientid, startdate)
);

create table monitored (
  physicianid int,
  patientid int,
  starttime timestamp,
  endtime timestamp,
  primary key (physicianid, patientid, starttime)
);

create table medication (
  patientid int,
  nurseid int,
  date date,
  medicationinfo text,
  statuscode varchar(255),
  amount int,
  primary key (patientid, nurseid, date)
);

create table payment (
  paymentid int primary key,
  patientid int,
  amount decimal(10, 2),
  date date
);

create table instructions (
  code int primary key,
  fee decimal(10, 2),
  description text
);

create table invoice (
  invoice_id int primary key,
  patient_id int,
  issue_date date,
  total_amount decimal(10,2),
  foreign key (patient_id) references patient(id)
);

create table executed_instructions (
  nurse_id int,
  patient_id int,
  instruction_code int,
  execution_date date,
  status_code varchar(255),
  primary key (nurse_id, patient_id, instruction_code),
  foreign key (nurse_id) references nurse(id),
  foreign key (patient_id) references patient(id),
  foreign key (instruction_code) references instructions(code)
);


alter table healthrecord
  add constraint fk_healthrecord_patient
  foreign key (patientid) references patient(id);

alter table hospitalized
  add constraint fk_hospitalized_patient
  foreign key (patientid) references patient(id),
  add constraint fk_hospitalized_room
  foreign key (roomnumber) references room(roomnumber);

alter table monitored
  add constraint fk_monitored_physician
  foreign key (physicianid) references physician(id),
  add constraint fk_monitored_patient
  foreign key (patientid) references patient(id);

alter table medication
  add constraint fk_medication_patient
  foreign key (patientid) references patient(id),
  add constraint fk_medication_nurse
  foreign key (nurseid) references nurse(id);

alter table payment
  add constraint fk_payment_patient
  foreign key (patientid) references patient(id);
  
  