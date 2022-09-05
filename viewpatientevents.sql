select FORMAT(p.EventTime, 'dd/MMM/y hh:mm') as 'Event Happened',
		p.PatientId, p.[Location], p.EventType, 
		p.Periodicity, p.SourceEvent, p.Id as EventId, p.EventTime, p.JourneyId
 from dbo.PatientEvents p
order by EventTime asc


--update dbo.PatientEvents 
--    set Periodicity = null where Periodicity < 0

-- for all a periodicity events
-- insert survey assignments events for the  pe params
-- insert survey completion events
-- survey completion prior to encounter (-24hrs)

-- almost need a chain of events generated randomly