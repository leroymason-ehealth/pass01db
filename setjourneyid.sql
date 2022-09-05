/* 
alter table dbo.PatientEvents   
    add JourneyId UNIQUEIDENTIFIER  null
*/
declare @x1 UNIQUEIDENTIFIER
select @x1 = NEWID()
update dbo.PatientEvents set JourneyId = @x1 -- since all for patient1 journey through OACCP