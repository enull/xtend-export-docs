-- TEST DATA

INSERT INTO dbo.Client
(Name)
VALUES
('GeneralHospital'),
('VeteranHospital'),
('OtherHospital')
;

INSERT INTO dbo.Facility
(
	FacilityName, AddressLine1, AddressLine2,
	City, [State], Zip
)
VALUES
(
	'General Hospital', '111 Some Street', NULL,
	'Alpha City', 'AL', '11111'
),
(
	'Veteran Hospital', '222 Another Road', 'c/o Contact Person',
	'Betaville', 'AZ', '22222-2222'
),
(
	'Veteran Other', '333 Other Avenue', NULL,
	NULL, NULL, NULL
),
(
	'Other Hospital', '444 Fourth', NULL,
	'Ft. Forth', 'GA', '44444'
)
;

INSERT INTO dbo.Patient
(
	FirstName, LastName, MiddleName,
	SocialSecurityNumber
)
VALUES
(
	'Alan', 'McFirst', 'Alphonze',
	'123-45-6789'
),
(
	'Barry', 'von Second', DEFAULT,
	'987-65-4321'
),
(
	'Carl', 'Tertian, III', 'C',
	'202-02-0202'
)
;

INSERT INTO dbo.Insurance
(
	PlanName, Policy, GroupNumber
)
VALUES
( 'AlphaPlan', 'P1111', 'G1111' ),
( 'BetaPlan', 'P2222', 'G2222' ),
( 'GammaPlan', 'P3333', 'G3333' )
;


INSERT INTO dbo.Account
(
	ClientId, FacilityId, PatientId,
	AccountNumber, Balance, AdmitDate,
	DischargeDate
	
)
VALUES
-- GENERAL
(
	--A
	1, 1, 1,
	'111-00001', 100.11, '2018-01-01T01:01:00',
	'2018-02-01T01:01:00'
),
(
	--B
	1, 1, 2,
	'111-00002', 200.22, '2018-01-01T02:02:00',
	'2018-02-01T02:02:00'	
),
(
	--C
	1, 1, 3,
	'111-00003', 300.33, '2018-01-01T03:03:00',
	'2018-02-01T03:03:00'	
),
-- VETERAN
(
	--A
	2, 2, 1,
	'222-00001', 100.11, '2018-01-01T01:01:00',
	'2018-02-01T01:01:00'
),
(
	--B
	2, 2, 2,
	'222-00002', 200.22, '2018-01-01T02:02:00',
	'2018-02-01T02:02:00'	
),
(
	--C
	2, 2, 3,
	'222-00003', 300.33, '2018-01-01T03:03:00',
	'2018-02-01T03:03:00'	
),
-- VETERAN OTHER
(
	--A
	2, 3, 1,
	'322-00001', 100.11, '2018-01-01T01:01:00',
	'2018-02-01T01:01:00'
),
(
	--B
	2, 3, 2,
	'322-00002', 200.22, '2018-01-01T02:02:00',
	'2018-02-01T02:02:00'	
),
(
	--C
	2, 3, 3,
	'322-00003', 300.33, '2018-01-01T03:03:00',
	'2018-02-01T03:03:00'	
),
-- OTHER
(
	--A
	3, 4, 1,
	'433-00001', 100.11, '2018-01-01T01:01:00',
	'2018-02-01T01:01:00'
),
(
	--B
	3, 4, 2,
	'433-00002', 200.22, '2018-01-01T02:02:00',
	'2018-02-01T02:02:00'	
),
(
	--C
	3, 4, 3,
	'433-00003', 300.33, '2018-01-01T03:03:00',
	'2018-02-01T03:03:00'	
)
;

/*
 TEST DATA HACK: since patient crafted to line up with insurance,
   just exploiting that assumption
*/
INSERT INTO AccountInsurance
(AccountId, InsuranceId)
SELECT
	Id, PatientId
FROM dbo.Account
;



INSERT INTO dbo.ExportFormat
( Label )
VALUES
('Comma Delimited'),
('Pipe Delimited')
;


-- TODO: dbo.ClientSettings
/*
	review coding challenge instructions to ensure settings cover specifics of requirements
*/
