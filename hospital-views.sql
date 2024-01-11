# patient and physician information view
create view patient_physician_info as
select 
    patient.id as patient_id, 
    patient.name as patient_name, 
    physician.id as physician_id, 
    physician.name as physician_name, 
    physician.fieldofexpertise
from patient
join monitored on patient.id = monitored.patientid
join physician on monitored.physicianid = physician.id;

# medication administration details view
create view medication_administration_details as
select 
    medication.patientid, 
    patient.name as patient_name, 
    medication.nurseid, 
    nurse.name as nurse_name, 
    medication.date, 
    medication.medicationinfo, 
    medication.amount
from medication
join nurse on medication.nurseid = nurse.id
join patient on medication.patientid = patient.id;

# hospitalization summary view
create view hospitalization_summary as
select 
    patient.id as patient_id, 
    patient.name as patient_name, 
    hospitalized.roomnumber, 
    room.capacity, 
    room.feepernight, 
    hospitalized.startdate, 
    hospitalized.enddate,
    datediff(hospitalized.enddate, hospitalized.startdate) as days_hospitalized
from hospitalized
join patient on hospitalized.patientid = patient.id
join room on hospitalized.roomnumber = room.roomnumber;
