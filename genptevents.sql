

select * from dbo.EventType order by id

select distinct Initiative from dbo.PromsCollectionPoints
select * from dbo.PromsCollectionPoints -- where Initiative is null

delete from dbo.PromsCollectionPoints where Initiative is null

select top 2 * from dbo.PatientEvents

select  * from dbo.Location
--delete from Location where id = 3

declare @cnt int
select int = 2
declare @cnts varchar(100)
select @cnts = @cnt

insert into dbo.Location  (Name) 
    select distinct Initiative from dbo.PromsCollectionPoints

update Location 
    set FullName = concat(Name, ' ', cast(id as varchar(10)))

select * from dbo.Run
insert into dbo.Run (name) values ('x')

declare @rng int   
select @rng = 1
select r.id as  'Run#', pe.EventOrder, pe.EventType, abs(checksum(NewId())%30+5) as 'days elapsed',
                (select top 1 FullName from dbo.Location where id = 5/* = abs(checksum(NewId())%30)+5 */
                )
 from dbo.EventType pe, dbo.Run r
    where r.Id < 3
    order by r.id, pe.EventOrder


select abs(checksum(NewId())%6+2)

select min(id), max(id) from Location

select  r.id, abs(checksum(NewId())%30)+5 from Run r where r.id < 7 order by r.id

select * from Run order by id


