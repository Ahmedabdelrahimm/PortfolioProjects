-- SQI:
CREATE TABLE Employee
(
  E_ID INT NOT NULL,
  Name VARCHAR(30) NOT NULL,
  Gender_ VARCHAR(6) NOT NULL,
  PRIMARY KEY (E_ID)
);

CREATE TABLE Admin
(
  Security_code INT NOT NULL,
  password INT NOT NULL,
  E_ID INT NOT NULL,
  PRIMARY KEY (E_ID),
  FOREIGN KEY (E_ID) REFERENCES Employee(E_ID)
);

CREATE TABLE Driver
(
  Line VARCHAR(50) NOT NULL,
  E_ID INT NOT NULL,
  PRIMARY KEY (E_ID),
  FOREIGN KEY (E_ID) REFERENCES Employee(E_ID)
);

CREATE TABLE Maintenance
(
  Work_field_ VARCHAR(50) NOT NULL,
  E_ID INT NOT NULL,
  PRIMARY KEY (E_ID),
  FOREIGN KEY (E_ID) REFERENCES Employee(E_ID)
);

CREATE TABLE Reservation
(
  Code INT NOT NULL,
  Total_seats INT NOT NULL,
  E_ID INT NOT NULL,
  PRIMARY KEY (Code),
  FOREIGN KEY (E_ID) REFERENCES Admin(E_ID)
);

CREATE TABLE Passenger
(
  P_ID INT NOT NULL,
  p_name VARCHAR(50) NOT NULL,
  PRIMARY KEY (P_ID)
);

CREATE TABLE Maintenance_system
(
  Prog_ID INT NOT NULL,
  Prog_name VARCHAR(50) NOT NULL,
  E_ID INT NOT NULL,
  PRIMARY KEY (Prog_ID),
  FOREIGN KEY (E_ID) REFERENCES Maintenance(E_ID)
);

CREATE TABLE Employee_phone_no
(
  phone_no INT NOT NULL,
  E_ID INT NOT NULL,
  PRIMARY KEY (phone_no, E_ID),
  FOREIGN KEY (E_ID) REFERENCES Employee(E_ID)
);

CREATE TABLE Passenger_phone_no
(
  p_phone_no INT NOT NULL,
  P_ID INT NOT NULL,
  PRIMARY KEY (p_phone_no, P_ID),
  FOREIGN KEY (P_ID) REFERENCES Passenger(P_ID)
);

CREATE TABLE ticket
(
  T_Code INT NOT NULL,
  Destination VARCHAR(50) NOT NULL,
  Price INT NOT NULL,
  Code INT NOT NULL,
  P_ID INT NOT NULL,
  PRIMARY KEY (T_Code),
  FOREIGN KEY (Code) REFERENCES Reservation(Code),
  FOREIGN KEY (P_ID) REFERENCES Passenger(P_ID)
);

CREATE TABLE Train
(
  TR_code INT NOT NULL,
  Departure_station VARCHAR(50) NOT NULL,
  Arrival_station VARCHAR(50) NOT NULL,
  T_Code INT NOT NULL,
  E_ID INT NOT NULL,
  Prog_ID INT NOT NULL,
  M_E_ID INT NOT NULL,
  PRIMARY KEY (TR_code),
  FOREIGN KEY (T_Code) REFERENCES ticket(T_Code),
  FOREIGN KEY (E_ID) REFERENCES Driver(E_ID),
  FOREIGN KEY (Prog_ID) REFERENCES Maintenance_system(Prog_ID),
  FOREIGN KEY (E_ID) REFERENCES Maintenance(E_ID)
);

CREATE TABLE Station
(
  S_ID INT NOT NULL,
  location VARCHAR(50) NOT NULL,
  Line VARCHAR(50) NOT NULL,
  TR_code INT NOT NULL,
  PRIMARY KEY (S_ID),
  FOREIGN KEY (TR_code) REFERENCES Train(TR_code)
);

---Inserting records for testing:
INSERT INTO Employee (E_ID, Name, Gender_) VALUES (1, 'John Doe', 'Male');
INSERT INTO Employee (E_ID, Name, Gender_) VALUES (2, 'Jane Smith', 'Female');
INSERT INTO Employee (E_ID, Name, Gender_) VALUES (3, 'Bob Johnson', 'Male');
INSERT INTO Employee (E_ID, Name, Gender_) VALUES (4, 'Emily Johnson', 'Female');
INSERT INTO Employee (E_ID, Name, Gender_) VALUES (5, 'Michael Smith', 'Male');
INSERT INTO Employee (E_ID, Name, Gender_) VALUES (6, 'Olivia Davis', 'Female');
INSERT INTO Employee (E_ID, Name, Gender_) VALUES (7, 'Daniel Brown', 'Male');
INSERT INTO Employee (E_ID, Name, Gender_) VALUES (8, 'Sophia Wilson', 'Female');
INSERT INTO Employee (E_ID, Name, Gender_) VALUES (9, 'Matthew Taylor', 'Male');
INSERT INTO Employee (E_ID, Name, Gender_) VALUES (10, 'Emma Miller', 'Female');
-
INSERT INTO Admin (Security_code, password, E_ID) VALUES (1234, 5678, 1);
INSERT INTO Admin (Security_code, password, E_ID) VALUES (4321, 8765, 2);
INSERT INTO Admin (Security_code, password, E_ID) VALUES (9876, 5432, 3);
INSERT INTO Admin (Security_code, password, E_ID) VALUES (5678, 1234, 4);
INSERT INTO Admin (Security_code, password, E_ID) VALUES (8765, 4321, 5);
INSERT INTO Admin (Security_code, password, E_ID) VALUES (5432, 9876, 6);
INSERT INTO Admin (Security_code, password, E_ID) VALUES (4321, 8765, 7);
-
INSERT INTO Driver (Line, E_ID) VALUES ('Blue Line', 1);
INSERT INTO Driver (Line, E_ID) VALUES ('Red Line', 2);
INSERT INTO Driver (Line, E_ID) VALUES ('Green Line', 3);
INSERT INTO Driver (Line, E_ID) VALUES ('Yellow Line', 4);
INSERT INTO Driver (Line, E_ID) VALUES ('Purple Line', 5);
INSERT INTO Driver (Line, E_ID) VALUES ('Orange Line', 6);
INSERT INTO Driver (Line, E_ID) VALUES ('Brown Line', 7);
-
INSERT INTO Maintenance (Work_field_, E_ID) VALUES ('Track Maintenance', 1);
INSERT INTO Maintenance (Work_field_, E_ID) VALUES ('Signal Maintenance', 2);
INSERT INTO Maintenance (Work_field_, E_ID) VALUES ('Facility Maintenance', 3);
INSERT INTO Maintenance (Work_field_, E_ID) VALUES ('Electrical Maintenance', 4);
INSERT INTO Maintenance (Work_field_, E_ID) VALUES ('Track Repair', 5);
INSERT INTO Maintenance (Work_field_, E_ID) VALUES ('Facility Inspection', 6);
INSERT INTO Maintenance (Work_field_, E_ID) VALUES ('Signal Maintenance', 7);
-
INSERT INTO Reservation (Code, Total_seats, E_ID) VALUES (1001, 50, 1);
INSERT INTO Reservation (Code, Total_seats, E_ID) VALUES (1002, 40, 2);
INSERT INTO Reservation (Code, Total_seats, E_ID) VALUES (1003, 30, 3);
INSERT INTO Reservation (Code, Total_seats, E_ID) VALUES (1004, 20, 4);
INSERT INTO Reservation (Code, Total_seats, E_ID) VALUES (1005, 35, 5);
INSERT INTO Reservation (Code, Total_seats, E_ID) VALUES (1006, 45, 6);
INSERT INTO Reservation (Code, Total_seats, E_ID) VALUES (1007, 25, 7);
-
INSERT INTO Passenger (P_ID, p_name) VALUES (101, 'Alice Johnson');
INSERT INTO Passenger (P_ID, p_name) VALUES (102, 'Bob Williams');
INSERT INTO Passenger (P_ID, p_name) VALUES (103, 'Catherine Davis');
INSERT INTO Passenger (P_ID, p_name) VALUES (104, 'Liam Jones');
INSERT INTO Passenger (P_ID, p_name) VALUES (105, 'Ava Martinez');
INSERT INTO Passenger (P_ID, p_name) VALUES (106, 'Ethan Wilson');
INSERT INTO Passenger (P_ID, p_name) VALUES (107, 'Isabella Moore');
-
INSERT INTO Maintenance_system (Prog_ID, Prog_name, E_ID) VALUES (201, 'Track Inspection', 1);
INSERT INTO Maintenance_system (Prog_ID, Prog_name, E_ID) VALUES (202, 'Signal Upgrade', 2);
INSERT INTO Maintenance_system (Prog_ID, Prog_name, E_ID) VALUES (203, 'Facility Repairs', 3);
INSERT INTO Maintenance_system (Prog_ID, Prog_name, E_ID) VALUES (204, 'HVAC System Maintenance', 4);
INSERT INTO Maintenance_system (Prog_ID, Prog_name, E_ID) VALUES (205, 'Elevator Repair', 5);
INSERT INTO Maintenance_system (Prog_ID, Prog_name, E_ID) VALUES (206, 'Plumbing Inspection', 6);
INSERT INTO Maintenance_system (Prog_ID, Prog_name, E_ID) VALUES (207, 'Roof Repairs', 7);
-
INSERT INTO Employee_phone_no (phone_no, E_ID) VALUES (1234567890, 1);
INSERT INTO Employee_phone_no (phone_no, E_ID) VALUES (9876543210, 2);
INSERT INTO Employee_phone_no (phone_no, E_ID) VALUES (5555555555, 3);
INSERT INTO Employee_phone_no (phone_no, E_ID) VALUES (1112223333, 4);
INSERT INTO Employee_phone_no (phone_no, E_ID) VALUES (4445556666, 5);
INSERT INTO Employee_phone_no (phone_no, E_ID) VALUES (7778889999, 6);
INSERT INTO Employee_phone_no (phone_no, E_ID) VALUES (9990001111, 7);
-
INSERT INTO Passenger_phone_no (p_phone_no, P_ID) VALUES (9998887777, 101);
INSERT INTO Passenger_phone_no (p_phone_no, P_ID) VALUES (1112223333, 102);
INSERT INTO Passenger_phone_no (p_phone_no, P_ID) VALUES (4445556666, 103);
INSERT INTO Passenger_phone_no (p_phone_no, P_ID) VALUES (7777777777, 104);
INSERT INTO Passenger_phone_no (p_phone_no, P_ID) VALUES (8888888888, 105);
INSERT INTO Passenger_phone_no (p_phone_no, P_ID) VALUES (9999999999, 106);
INSERT INTO Passenger_phone_no (p_phone_no, P_ID) VALUES (1010101010, 107);
-
INSERT INTO ticket (T_Code, Destination, Price, Code, P_ID) VALUES (5001, 'City A', 50, 1001, 101);
INSERT INTO ticket (T_Code, Destination, Price, Code, P_ID) VALUES (5002, 'City B', 40, 1002, 102);
INSERT INTO ticket (T_Code, Destination, Price, Code, P_ID) VALUES (5003, 'City C', 30, 1003, 103);
INSERT INTO ticket (T_Code, Destination, Price, Code, P_ID) VALUES (5004, 'City D', 60, 1004, 104);
INSERT INTO ticket (T_Code, Destination, Price, Code, P_ID) VALUES (5005, 'City E', 25, 1005, 105);
INSERT INTO ticket (T_Code, Destination, Price, Code, P_ID) VALUES (5006, 'City F', 40, 1006, 106);
INSERT INTO ticket (T_Code, Destination, Price, Code, P_ID) VALUES (5007, 'City G', 30, 1007, 107);
-
INSERT INTO Train (TR_code, Departure_station, Arrival_station, T_Code, E_ID, Prog_ID, M_E_ID) VALUES (6001, 'Station X', 'Station Y', 5001, 1, 201, 1);
INSERT INTO Train (TR_code, Departure_station, Arrival_station, T_Code, E_ID, Prog_ID, M_E_ID) VALUES (6002, 'Station P', 'Station Q', 5002, 2, 202, 2);
INSERT INTO Train (TR_code, Departure_station, Arrival_station, T_Code, E_ID, Prog_ID, M_E_ID) VALUES (6003, 'Station M', 'Station N', 5003, 3, 203, 3);
INSERT INTO Train (TR_code, Departure_station, Arrival_station, T_Code, E_ID, Prog_ID, M_E_ID) VALUES (6004, 'Station W', 'Station X', 5004, 4, 204, 4);
INSERT INTO Train (TR_code, Departure_station, Arrival_station, T_Code, E_ID, Prog_ID, M_E_ID) VALUES (6005, 'Station R', 'Station S', 5005, 5, 205, 5);
INSERT INTO Train (TR_code, Departure_station, Arrival_station, T_Code, E_ID, Prog_ID, M_E_ID) VALUES (6006, 'Station L', 'Station M', 5006, 6, 206, 6);
INSERT INTO Train (TR_code, Departure_station, Arrival_station, T_Code, E_ID, Prog_ID, M_E_ID) VALUES (6007, 'Station K', 'Station N', 5007, 7, 207, 7);
-
INSERT INTO Station (S_ID, location, Line, TR_code) VALUES (701, 'City X', 'Blue Line', 6001);
INSERT INTO Station (S_ID, location, Line, TR_code) VALUES (702, 'City Y', 'Red Line', 6002);
INSERT INTO Station (S_ID, location, Line, TR_code) VALUES (703, 'City Z', 'Green Line', 6003);
INSERT INTO Station (S_ID, location, Line, TR_code) VALUES (704, 'City D', 'Yellow Line', 6004);
INSERT INTO Station (S_ID, location, Line, TR_code) VALUES (705, 'City E', 'Purple Line', 6005);
INSERT INTO Station (S_ID, location, Line, TR_code) VALUES (706, 'City F', 'Orange line', 60060;


