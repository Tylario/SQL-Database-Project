# transaction 1
start transaction;

insert into hospitalized (patientid, roomnumber, startdate, enddate)
values (123, 456, '2023-11-28', NULL); # Assuming patient ID 123 is admitted to room 456 on Nov 28, 2023

update room
set capacity = capacity - 1 # Assuming one less available spot in the room
where roomnumber = 456;

commit;

# transaction 2
start transaction;

update hospitalized
set enddate = '2023-12-04' # Setting the date to Dec 4 (my birthday), 2023
where patientid = 6 and startdate = '2023-11-28'; 

insert into payment (paymentid, patientid, amount, date)
values (789, 6, 1500.00, '2023-12-04'); # a payment of $1500 on Dec 4, 2023

commit;
