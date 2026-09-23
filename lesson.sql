/*
Example lesson stub
*/

--tiny change for example
SELECT   ps.PatientId,
         ps.AdmittedDate,
         ps.DischargeDate,
         ps.Hospital,
         ps.Ward,
         ps.Ethnicity,
         DATEDIFF(DAY, ps.AdmittedDate, ps.DischargeDate) AS LengthOfStay
FROM     PatientStay AS ps
WHERE    ps.Hospital IN ('Kingston', 'PRUH')
         AND --AND ps.ward LIKE '%Surgery'
         ps.admitteddate BETWEEN DATEFROMPARTS(2024, 2, 28) AND DATEFROMPARTS(2024, 03, 01)
ORDER BY LengthOfStay DESC, ps.AdmittedDate DESC;

SELECT   ps.Hospital,
         ps.Ward,
         COUNT(*) AS NumberOfPatients
FROM     PatientStay AS ps
GROUP BY ps.Hospital, ps.Ward;

SELECT   ps.Hospital,
         ps.Ward,
         COUNT(*) AS [NumberOfPatients],
         SUM(ps.tariff) AS [TotalTariff],
         MAX(ps.Tariff) AS BiggestTariff
FROM     PatientStay AS ps
GROUP BY ps.Hospital, ps.Ward
HAVING   SUM(ps.Tariff) >= 10
ORDER BY TotalTariff DESC;