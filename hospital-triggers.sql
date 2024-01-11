delimiter //
create trigger before_hospitalized_insert
before insert on hospitalized
for each row
begin
  declare room_occupied int;

  select count(*)
  into room_occupied
  from hospitalized
  where roomnumber = new.roomnumber
  and new.startdate < enddate
  and new.enddate > startdate;

  if room_occupied > 0 then
    signal sqlstate '45000'
    set message_text = 'Room is already occupied during the selected dates';
  end if;
end; //
delimiter ;

delimiter //
create trigger before_physician_nurse_certification_insert
before insert on physician
for each row
begin
  declare cert_exists int;

  select count(*)
  into cert_exists
  from (select certificationnumber from physician
        union
        select certificationnumber from nurse) as all_certs
  where certificationnumber = new.certificationnumber;

  if cert_exists > 0 then
    signal sqlstate '45000'
    set message_text = 'Certification number already exists';
  end if;
end; //
delimiter ;


delimiter //
create trigger before_medication_insert
before insert on medication
for each row
begin
  declare patient_admitted int;

  select count(*)
  into patient_admitted
  from hospitalized
  where patientid = new.patientid
  and new.date between startdate and enddate;

  if patient_admitted = 0 then
    signal sqlstate '45000'
    set message_text = 'Patient is not currently admitted';
  end if;
end; //
delimiter ;
