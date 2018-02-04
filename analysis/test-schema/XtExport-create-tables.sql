-- SCHEMA
--DROP TABLE dbo.Client
CREATE TABLE dbo.Client
(
	Id int
		IDENTITY(1,1)
		NOT NULL
		CONSTRAINT PK_Client
			PRIMARY KEY CLUSTERED,
	Name nvarchar(200)
		NOT NULL
);

--DROP TABLE dbo.Facility
CREATE TABLE dbo.Facility
(
	Id int
		IDENTITY(1,1)
		NOT NULL
		CONSTRAINT PK_Facility
			PRIMARY KEY CLUSTERED,
	FacilityName nvarchar(200)
		NOT NULL,
	AddressLine1 nvarchar(200)
		NULL,
	AddressLine2 nvarchar(200)
		NULL,
	City nvarchar(100)
		NULL,
	[State] nvarchar(100)
		NULL,
	Zip nvarchar(10)
		NULL
);

--DROP TABLE dbo.Patient
CREATE TABLE dbo.Patient
(
	Id int
		IDENTITY(1,1)
		NOT NULL
		CONSTRAINT PK_Patient
			PRIMARY KEY CLUSTERED,
	FirstName nvarchar(200)
		NOT NULL,
	LastName nvarchar(200)
		NOT NULL,
	MiddleName nvarchar(200)
		NOT NULL
		CONSTRAINT DF_Patient_MiddleName
			DEFAULT(''),
	SocialSecurityNumber varchar(11)
		NOT NULL
		CONSTRAINT DF_Patient_SocialSecurityNumber
			DEFAULT('')
		--TODO: enforce format
);

--DROP TABLE dbo.Insurance
CREATE TABLE dbo.Insurance
(
	Id int
		IDENTITY(1,1)
		NOT NULL
		CONSTRAINT PK_Insurance
			PRIMARY KEY CLUSTERED,
	PlanName nvarchar(200)
		NOT NULL,
	Policy nvarchar(200)
		NOT NULL,
	GroupNumber nvarchar(200)
		NOT NULL
);

--DROP TABLE dbo.Account
CREATE TABLE dbo.Account
(
	Id int
		IDENTITY(1,1)
		NOT NULL
		CONSTRAINT PK_Account
			PRIMARY KEY CLUSTERED,
	ClientId int
		NOT NULL
		CONSTRAINT FK_Account_Client
			FOREIGN KEY
				REFERENCES dbo.Client (Id),
	FacilityId int
		NOT NULL
		CONSTRAINT FK_Account_Facility
			FOREIGN KEY
				REFERENCES dbo.Facility (Id),
	PatientId int
		CONSTRAINT FK_Account_Patient
			FOREIGN KEY
				REFERENCES dbo.Patient (Id),
	AccountNumber varchar(50)
		NOT NULL,
	Balance decimal(19,4)
		NOT NULL
		CONSTRAINT DF_Account_Balance
			DEFAULT(0),
	AdmitDate datetime
		NULL,
	DischargeDate datetime
		NULL
);


--DROP TABLE dbo.AccountInsurance
CREATE TABLE dbo.AccountInsurance
(
	AccountId int
		CONSTRAINT FK_AccountInsurance_Account
			FOREIGN KEY
				REFERENCES dbo.Account (Id),
	InsuranceId int
		CONSTRAINT FK_AccountInsurance_Insurance
			FOREIGN KEY 
				REFERENCES dbo.Insurance (Id) 
);

--DROP TABLE dbo.ExportFormat
CREATE TABLE dbo.ExportFormat
(
	Id int
		IDENTITY(1,1)
		NOT NULL
		CONSTRAINT PK_ExportFormat
			PRIMARY KEY CLUSTERED,
	Label varchar(50)
		NOT NULL
);

--DROP TABLE dbo.ClientSettings
CREATE TABLE dbo.ClientSettings
(
	Id int
		IDENTITY(1,1)
		NOT NULL
		CONSTRAINT PK_ClientSettings
			PRIMARY KEY CLUSTERED,
	ClientId int
		NOT NULL
		CONSTRAINT FK_ClientSettings_Client
			FOREIGN KEY
				REFERENCES dbo.Client (Id),
	ExportFormat int
		NOT NULL
		CONSTRAINT FK_ClientSettings_ExportFormat
			FOREIGN KEY
				REFERENCES dbo.ExportFormat (Id),
	DatePattern varchar(20)
		NOT NULL
		CONSTRAINT DF_ClientSettings_DatePattern
			DEFAULT (''),
	PatientInfoPattern varchar(100)
      NOT NULL
		CONSTRAINT DF_ClientSettings_PatientInfoPattern
			DEFAULT (''),
	FileNamePattern varchar(100)
		NOT NULL
		CONSTRAINT DF_ClientSettings_FileNamePattern
			DEFAULT ('')
);

--DROP TABLE dbo.ExportHistory
CREATE TABLE dbo.ExportHistory
(
	Id int
		IDENTITY(1,1)
		NOT NULL
		CONSTRAINT PK_ExportHistory
			PRIMARY KEY CLUSTERED,
	ClientId int	
		NOT NULL
		CONSTRAINT FK_ExportHistory_Client
			FOREIGN KEY
				REFERENCES dbo.Client (Id),
	ExportDate datetime
		NOT NULL,
	AccountCount int
		NOT NULL,
	AccountTotalBalance decimal(19,4)
		NOT NULL	
);
