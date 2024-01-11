insert into physician values 
(1, 'Dr. John Smith', '919-555-1234', '101 Wellness Dr, Raleigh, NC', 'CN12345', 'Cardiology'),
(2, 'Dr. Emily Johnson', '919-555-5678', '102 Wellness Dr, Raleigh, NC', 'CN23456', 'Neurology'),
(3, 'Dr. William Brown', '919-555-9012', '103 Wellness Dr, Raleigh, NC', 'CN34567', 'Orthopedics'),
(4, 'Dr. Ava Davis', '919-555-3456', '104 Wellness Dr, Raleigh, NC', 'CN45678', 'Pediatrics'),
(5, 'Dr. James Wilson', '919-555-7890', '105 Wellness Dr, Raleigh, NC', 'CN56789', 'Dermatology');

insert into nurse values 
(1, 'Nurse Olivia Martin', '919-555-1122', '201 Care St, Durham, NC', 'CN98765'),
(2, 'Nurse Liam Anderson', '919-555-3344', '202 Care St, Durham, NC', 'CN87654'),
(3, 'Nurse Sophia Thompson', '919-555-5566', '203 Care St, Durham, NC', 'CN76543'),
(4, 'Nurse Lucas Garcia', '919-555-7788', '204 Care St, Durham, NC', 'CN65432'),
(5, 'Nurse Mia Harris', '919-555-9900', '205 Care St, Durham, NC', 'CN54321');

insert into patient values 
(1, 'Alice Green', '123 Healing Way, Chapel Hill, NC', '919-111-2222'),
(2, 'Bob White', '124 Healing Way, Chapel Hill, NC', '919-333-4444'),
(3, 'Charlie Black', '125 Healing Way, Chapel Hill, NC', '919-555-6666'),
(4, 'Diana Gray', '126 Healing Way, Chapel Hill, NC', '919-777-8888'),
(5, 'Ethan Stone', '127 Healing Way, Chapel Hill, NC', '919-999-0000'),
(6, 'Tyler Hudson', '128 Healing Way, Chapel Hill, NC', '919-101-2020'),
(7, 'Natalie Travis', '129 Healing Way, Chapel Hill, NC', '919-202-3030'),
(8, 'Ryan Hoover', '130 Healing Way, Chapel Hill, NC', '919-303-4040'),
(9, 'Phoenix Glover', '131 Healing Way, Chapel Hill, NC', '919-404-5050'),
(10, 'Grayson Hess', '132 Healing Way, Chapel Hill, NC', '919-505-6060'),
(11, 'Senna Hairdar', '133 Healing Way, Chapel Hill, NC', '919-606-7070'),
(12, 'Aaran Lawing', '134 Healing Way, Chapel Hill, NC', '919-707-8080'),
(13, 'Tatiana Dudina', '135 Healing Way, Chapel Hill, NC', '919-808-9090');


insert into healthrecord values 
(1, 1, 'Flu', '2023-01-10', 'Recovered', 'Patient had a mild case of flu.'),
(2, 2, 'Fracture', '2023-02-15', 'Healing', 'Patient is recovering from a leg fracture.'),
(3, 3, 'Hypertension', '2023-03-20', 'Under Treatment', 'Patient is being treated for high blood pressure.'),
(4, 4, 'Asthma', '2023-04-25', 'Stable', 'Patient has stable asthma.'),
(5, 5, 'Diabetes', '2023-05-30', 'Under Treatment', 'Patient is being treated for diabetes.');

insert into room values 
(101, 2, 150.00),
(102, 2, 200.00),
(103, 1, 300.00),
(104, 1, 250.00),
(105, 3, 100.00);

insert into hospitalized values 
(1, 101, '2023-01-10', '2023-01-15'),
(2, 102, '2023-02-15', '2023-02-25'),
(3, 103, '2023-03-20', '2023-03-30'),
(4, 104, '2023-04-25', '2023-05-05'),
(5, 105, '2023-05-30', '2023-06-10');

insert into monitored values 
(1, 1, '2023-01-10 08:00:00', '2023-01-10 08:30:00'),
(2, 2, '2023-02-15 09:00:00', '2023-02-15 09:30:00'),
(3, 3, '2023-03-20 10:00:00', '2023-03-20 10:30:00'),
(4, 4, '2023-04-25 11:00:00', '2023-04-25 11:30:00'),
(5, 5, '2023-05-30 12:00:00', '2023-05-30 12:30:00');

insert into medication values 
(1, 1, '2023-01-10', 'Paracetamol', 'Given', 2),
(2, 2, '2023-02-15', 'Ibuprofen', 'Given', 1),
(3, 3, '2023-03-20', 'Amlodipine', 'Given', 1),
(4, 4, '2023-04-25', 'Salbutamol', 'Given', 1),
(5, 5, '2023-05-30', 'Metformin', 'Given', 2);

insert into payment values 
(1, 1, 750.00, '2023-01-16'),
(2, 2, 2000.00, '2023-02-26'),
(3, 3, 3000.00, '2023-03-31'),
(4, 4, 2500.00, '2023-05-06'),
(5, 5, 1000.00, '2023-06-11');

insert into instructions values 
(101, 50.00, 'Take medication every 8 hours'),
(102, 100.00, 'Daily physiotherapy session'),
(103, 150.00, 'Weekly check-up'),
(104, 200.00, 'Biweekly blood test'),
(105, 250.00, 'Monthly specialist consultation');

insert into invoice values 
(1, 1, '2023-01-16', 800.00),
(2, 2, '2023-02-26', 2100.00),
(3, 3, '2023-03-31', 3150.00),
(4, 4, '2023-05-06', 2700.00),
(5, 5, '2023-06-11', 1250.00);

insert into executed_instructions values 
(1, 1, 101, '2023-01-11', 'Completed'),
(2, 2, 102, '2023-02-16', 'Completed'),
(3, 3, 103, '2023-03-21', 'Completed'),
(4, 4, 104, '2023-04-26', 'Completed'),
(5, 5, 105, '2023-05-31', 'Completed');


