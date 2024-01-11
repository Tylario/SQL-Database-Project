# list of patients with their assigned physicians
select patient.name as patient_name, physician.name as physician_name
from patient
join monitored on patient.id = monitored.patientid
join physician on monitored.physicianid = physician.id;

# details of nurses and the medications they administered
select nurse.name as nurse_name, medication.medicationinfo
from nurse
join medication on nurse.id = medication.nurseid;

# patients and their room details during hospitalization:
select patient.name as patient_name, room.roomnumber, hospitalized.startdate, hospitalized.enddate
from patient
join hospitalized on patient.id = hospitalized.patientid
join room on hospitalized.roomnumber = room.roomnumber;

# count of patients per physician
select physician.id as physician_id, physician.name as physician_name, count(monitored.patientid) as patient_count
from physician
join monitored on physician.id = monitored.physicianid
group by physician.id;

# total fees collected per room
select room.roomnumber, sum(payment.amount) as total_fees
from payment
join hospitalized on payment.patientid = hospitalized.patientid
join room on hospitalized.roomnumber = room.roomnumber
group by room.roomnumber;

# average medication amount prescribed by nurses:
select nurse.id as nurse_id, nurse.name as nurse_name, avg(medication.amount) as average_medication_amount
from nurse
join medication on nurse.id = medication.nurseid
group by nurse.id;

# physicians treating patients with a specific disease
select physician.name
from physician
where exists (
  select 1
  from monitored
  join healthrecord on monitored.patientid = healthrecord.patientid
  where healthrecord.disease = 'diabetes' and monitored.physicianid = physician.id # replace diabetes with whatever you're searching for
);

# patients who have never been hospitalized
select patient.name
from patient
where not exists (
  select 1
  from hospitalized
  where hospitalized.patientid = patient.id
);

# nurses who have administered a certain medication:
select nurse.name
from nurse
where exists (
  select 1
  from medication
  where medication.nurseid = nurse.id and medication.medicationinfo = 'ibuprofen' # replace ibuprofen with whatever you're searching for
);

# list all patients with their latest health record
select patient.name, healthrecord.disease, healthrecord.date
from patient
join healthrecord on patient.id = healthrecord.patientid
where healthrecord.date = (
  select max(healthrecord2.date)
  from healthrecord healthrecord2
  where healthrecord2.patientid = patient.id
);

# total amount billed to each patient
select invoice.patient_id, sum(invoice.total_amount) as total_billed
from invoice
group by invoice.patient_id;

# physicians with more than 3 patients:
select physician.name
from physician
join monitored on physician.id = monitored.physicianid
group by physician.id
having count(distinct monitored.patientid) > 3;


# patients who have been hospitalized more than once
select patient.name
from patient
join hospitalized on patient.id = hospitalized.patientid
group by patient.id
having count(hospitalized.startdate) > 1;

# most common disease among patients:
select disease, count(*) as count
from healthrecord
group by disease
order by count(*) desc
limit 1;

# rooms that have never been used:
select room.roomnumber
from room
where not exists (
  select 1
  from hospitalized
  where hospitalized.roomnumber = room.roomnumber
);
