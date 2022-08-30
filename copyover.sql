
-- add appointment even types

--insert into dbo.PatientEvents 
--	( PatientId, Location, EventType, EventTime, Event5W, Periodicity, SourceEvent)
--	values
--	('004-1234567-11005500','OACCP Clinic 1', 'Appointment', dateadd(d,10,(select EventTime from dbo.PatientEvents where id = 3)) , '5w', null, 0)

-- insert peridocitysetfromdefault, periodicityoverride, surveynotificationsent, surveycompleted
--delete from dbo.PatientEvents where id = 1
/* update dbo.PatientEvents
	set EventTime = (select EventTime from dbo.PatientEvents where id = 5)
where
	id = 7

update dbo.PatientEvents	
	set EventTime = dateadd(d,-10,(select EventTime from dbo.PatientEvents where id = 3)), EventType = 'Appointment'
	where id = 10

*/
select FORMAT(p.EventTime, 'dd/MMM/y hh:mm') as 'Event Happened',
		p.PatientId, p.[Location], p.EventType, 
		p.Periodicity, p.SourceEvent, p.Id as EventId, p.EventTime
 from dbo.PatientEvents p
order by EventTime asc

-- select EventTime, DateAdd(m, -1, EventTime) 'one month prior' from dbo.PatientEvents where id = 3

delete from dbo.PatientEvents where Location like 'Primary%' AND EventType like 'Period%' AND	
	EventTime > '08/Mar/23 01:10'


insert into dbo.PatientEvents 
	( PatientId, Location, EventType, EventTime, Event5W, SourceEvent)	
		select PatientId,Location,'EncounterDischarge', dateadd(mi,30,EventTime), Event5W,
			43
		from dbo.PatientEvents where Location = 'PrimaryCare Clinic1' and EventType = 'EncounterAdmission'
		order by EventTime

 -- delete from dbo.PatientEvents where id> 49

/*
 update dbo.PatientEvents 
	
	set EventTime = 
		dateadd(m,30,
				(select top 1 EventTime from dbo.PatientEvents p1
					where
						 Location like 'PrimaryCare%' and EventType = 'EncounterAdmission'
						 and p1.EventTime < EventTime
					order by EventType desc
						  ))


	where Location like 'PrimaryCare%' and EventType = 'EncounterDischarge' 

*/
	select 
		p2.EventTime, dateadd(mi,30,
				(select top 1 EventTime from dbo.PatientEvents p1
					where
						 p1.Location like 'PrimaryCare%' and p1.EventType = 'EncounterAdmission'
						 and p1.EventTime > p2.EventTime
					order by p1.EventTime desc
						  )) AS samedaydischarge
	from dbo.PatientEvents p2
	where p2.Location like 'PrimaryCare%' and p2.EventType = 'EncounterDischarge' 

	select 
		p2.*
	from dbo.PatientEvents p2
	where p2.Location like 'PrimaryCare%' and p2.EventType = 'EncounterDischarge' 
		and p2.EventTime = (select p1. EventTime from dbo.PatientEvents p1 where p1.id != p2.id and p1.EventTime = p2.EventTime)
	order by EventTime


delete from dbo.PatientEvents where id = 93

update dbo.PatientEvents
	set Periodicity = 3 where Periodicity is null and EventType like 'Period%'