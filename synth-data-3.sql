declare @rng int   
select @rng = 1

declare @locname varchar(30)
select @locname = FullName from dbo.Location where id = 8

declare @wevtdt DATETIME

select @wevtdt = GETDATE()

declare @patientId varchar(50)
select @patientId = '004-1234567-11005500'

declare @jnyid UNIQUEIDENTIFIER
select @jnyid = newid()


insert into dbo.PatientEvents 
	( PatientId, Location, EventType, EventTime, Event5W, SourceEvent, JourneyId)	
select  
        @patientId,
        @locname,
        -- pe.EventOrder, 
        pe.EventType, 
        @wevtdt, -- initialise then redo
        'ev5w',0,@jnyid
        -- abs(checksum(NewId())%30+5) as 'days elapsed not cumul'
 from dbo.EventType pe
    --where 
    order by pe.EventOrder

declare @srcevt int

select -- appt inserted above * 
     * from dbo.PatientEvents where PatientId = @patientId and [Location] = @locname
    order by EventTime asc

select top 1 @srcevt =  id from dbo.PatientEvents 
    where EventType = 'Appointment'
    order by id desc
select @srcevt

declare @jid UNIQUEIDENTIFIER
select @jid = '07bca0ee-3ffc-44b1-b9d3-a398fc36d1da'

select p.*, et.* from PatientEvents p, EventType et
     where p.JourneyId = @jid and p.EventType = et.EventType
-- delete from PatientEvents -- where id >=36 and id <=

-- need a event-stream-id (guid)

-- an SP or fx that takes CP, Location, Patient and produces an event stream defined by the EventType table
-- do insert to create trace of events then 
-- update the appointment (single appt case only)
-- update every other event eventdate with days duration accumulating all the previous events durations