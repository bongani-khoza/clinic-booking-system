/*
This database design includes the following:

Patients Table: Stores patient information with a unique PatientID as primary key.
Doctors Table: Stores doctor information with a unique DoctorID as primary key.
Appointments Table: Stores appointment information with foreign keys referencing Patients and Doctors tables.
MedicalHistory Table: Stores medical history of patients with a composite primary key (PatientID, Diagnosis).
Billing Table: Stores billing information for appointments with a foreign key referencing Appointments table.
*/

-- Table to store patient information
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
    Phone VARCHAR(20),
    Address VARCHAR(255),
    PRIMARY KEY (PatientID)
);

-- Table to store doctor information
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT,
    FirstName VARCHAR(255) NOT NULL,
    LastName VARCHAR(255) NOT NULL,
    Email VARCHAR(255),
    Phone VARCHAR(20),
    Specialty VARCHAR(100),
    PRIMARY KEY (DoctorID)
);

-- Table to store appointment information
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    Date DATE NOT NULL,
    Time TIME NOT NULL,
    Duration INT NOT NULL,
    Status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    PRIMARY KEY (AppointmentID),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Table to store medical history of patients
CREATE TABLE MedicalHistory (
    PatientID INT NOT NULL,
    Diagnosis VARCHAR(255),
    Treatment VARCHAR(255),
    PRIMARY KEY (PatientID, Diagnosis),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

-- Table to store billing information for appointments
CREATE TABLE Billing (
    AppointmentID INT NOT NULL,
    BillAmount DECIMAL(10, 2),
    PaymentStatus ENUM('Paid', 'Unpaid') DEFAULT 'Unpaid',
    PRIMARY KEY (AppointmentID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID)
);
