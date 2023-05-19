	CREATE TABLE PlaneType (
		TypeCode CHAR(8) PRIMARY KEY,
		TypeDescription CHAR(30) NOT NULL,
		Capacity DECIMAL(3 , 0 ) NOT NULL,
		FlightRange DECIMAL(4) NOT NULL
	);	

	CREATE TABLE Plane (
		SerialNumber CHAR(12) PRIMARY KEY,
		TypeCode CHAR(8) NOT NULL,
		YearManufactured DECIMAL(4 , 0 ) NOT NULL,
		DateLastServiced DATE NOT NULL,
		DateNextServiced DATE NOT NULL,
		FOREIGN KEY (TypeCode)
			REFERENCES PlaneType (TypeCode)
	);

	CREATE TABLE Pilot (
		PilotNumber DECIMAL(5 , 0 ) PRIMARY KEY,
		FirstName CHAR(30) NOT NULL,
		LastName CHAR(30) NOT NULL,
		BirthDate DATE NOT NULL,
		SocialSecurityNumber DECIMAL(9 , 0 ) NOT NULL,
		AnnualSalary DECIMAL(10 , 2 ) NOT NULL,
		CellPhoneNumber CHAR(12) NOT NULL
	);

	CREATE TABLE Certification (
		PilotNumber DECIMAL(5 , 0 ) NOT NULL,
		TypeCode CHAR(8) NOT NULL,
		DateCertified DATE NOT NULL,
		PRIMARY KEY (PilotNumber , TypeCode),
		FOREIGN KEY (PilotNumber)
			REFERENCES Pilot (PilotNumber),
		FOREIGN KEY (TypeCode)
			REFERENCES PlaneType (TypeCode)
	);

	CREATE TABLE City (
		CityCode CHAR(3) PRIMARY KEY,
		CityName CHAR(30) NOT NULL,
		State CHAR(2) NOT NULL,
		AirportDescription CHAR(30) NOT NULL
	);

	CREATE TABLE Flight (
		FlightNumber DECIMAL(3 , 0 ) PRIMARY KEY,
		CityOrigination CHAR(3) NOT NULL,
		CityDestination CHAR(3) NOT NULL,
		TimeDeparture TIME NOT NULL,
		TimeArrival TIME NOT NULL,
		FOREIGN KEY (CityOrigination)
			REFERENCES City (CityCode),
		FOREIGN KEY (CityDestination)
			REFERENCES City (CityCode)
	);

	CREATE TABLE ScheduledFlight (
		FlightNumber DECIMAL(3 , 0 ) NOT NULL,
		Date DATE NOT NULL,
		PlaneSerialNumber CHAR(12) NOT NULL,
		CityOrigination CHAR(3) NOT NULL,
		CityDestination CHAR(3) NOT NULL,
		TimeDeparture TIME NOT NULL,
		TimeArrival TIME NOT NULL,
		PilotNumber DECIMAL(5 , 0 ) NOT NULL,
		PRIMARY KEY (FlightNumber , Date),
		FOREIGN KEY (FlightNumber)
			REFERENCES Flight (FlightNumber),
		FOREIGN KEY (PlaneSerialNumber)
			REFERENCES Plane (SerialNumber),
		FOREIGN KEY (PilotNumber)
			REFERENCES Pilot (PilotNumber)
	);

	CREATE TABLE Passenger (
		PassengerID INTEGER PRIMARY KEY,
		FirstName CHAR(30) NOT NULL,
		LastName CHAR(30) NOT NULL,
		MainPhoneNumber CHAR(12) NOT NULL,
		StreetAddress CHAR(50) NOT NULL,
		City CHAR(30) NOT NULL,
		State CHAR(2) NOT NULL,
		Zip CHAR(5) NOT NULL,
		Email CHAR(50),
		BirthDate DATE NOT NULL
	);

	CREATE TABLE Reservation (
		ReservationID INTEGER PRIMARY KEY,
		PassengerID INTEGER NOT NULL,
		FlightNumber DECIMAL(3 , 0) NOT NULL,
		Date DATE NOT NULL,
		FOREIGN KEY (PassengerID)
			REFERENCES Passenger (PassengerID),
		FOREIGN KEY (FlightNumber, Date)
			REFERENCES ScheduledFlight (FlightNumber, Date)
	);


