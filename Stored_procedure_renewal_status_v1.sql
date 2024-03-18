use library_db_v5;

DELIMITER $$

CREATE PROCEDURE GetPersonRenewStatus()
BEGIN
    
    SELECT 
	CONCAT('Name: ', firstName, ' ', lastName) AS Person,
    CONCAT('Email: ', email) AS Email,
    CONCAT('Renewal Status: ', renew_status) AS RenewalStatus
    FROM Renew_Status
    JOIN loan ON Renew_Status.Renew_Count = loan.Renew_Count
    join person
    on loan.PersonID = person.PersonID
    where renew_status.renew_count = 2;
    
END $$

DELIMITER ;
   
CALL GetPersonRenewStatus();