

-- activity 1:

select count(ClientId) from Client

-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------

-- activity 2:

select count(BirthDate) from Client

-- ...or:

select count(ClientId) from Client
where BirthDate is not null

-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------

-- activity 3:

select City, count(ClientId) as totalClients
from Client
group by City
order by totalClients desc

-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------

-- activity 4:

-- to check distinct invoice IDs:

select distinct InvoiceId
from InvoiceLineItem
order by InvoiceId asc


-- solution:

select InvoiceId, cast(sum(Price * Quantity) as Decimal(7,2)) as totalPriceOfInvoice
from InvoiceLineItem
where Price is not null
and Quantity is not null
group by InvoiceId
order by totalPriceOfInvoice  desc


-- ...or:

select InvoiceId, cast(sum(Price * Quantity) as Decimal(7,2)) as totalPriceOfInvoice
from InvoiceLineItem
where Price is not null
and Quantity is not null
group by InvoiceId
order by InvoiceId asc

-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------

-- activity 5:

select InvoiceId, cast(sum(Price * Quantity) as Decimal(7,2)) as totals
from InvoiceLineItem
group by InvoiceId
having sum(Price * Quantity) > 500.00
order by totals  asc

-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------

-- activity 6:

-- checking data:

select distinct Description from InvoiceLineItem


-- solution:

select Description, cast(avg(Price * Quantity) as Decimal(7,2)) as averagePrice
from InvoiceLineItem
group by Description
order by averagePrice asc

-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------

-- activity 7:

select distinct c.ClientId, c.FirstName, c.LastName, cast(sum(Price * Quantity) as Decimal(7,2)) as total from Client c
inner join Invoice i
on i.ClientId = c.ClientId
inner join InvoiceLineItem ili
on ili.InvoiceId = i.InvoiceId
where i.InvoiceStatus = 2
group by c.ClientId,c.FirstName, c.LastName
having sum(ili.Price * ili.Quantity) > 1000
order by c.LastName, c.FirstName

-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------

-- activity 8:

select ec.Name, count(e.ExerciseId) from Exercise e
inner join ExerciseCategory ec
on ec.ExerciseCategoryId = e.ExerciseCategoryId
group by ec.Name
order by count(e.ExerciseId) desc

-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------

-- activity 9:

select e.Name,
	min(ei.Sets) as minimumSets,
	max(ei.Sets) as maximumSets,
	avg(ei.Sets) as averageSets
from Exercise e
inner join ExerciseInstance ei
on ei.ExerciseId = e.ExerciseId
group by e.Name
order by e.Name asc


-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------

-- activity 10:

select w.Name,
	min(c.BirthDate) as minBirthdate,
	max(c.BirthDate) as maxBirthdate
from Workout w
inner join WorkoutGoal wg
on wg.WorkoutId = w.WorkoutId
inner join Goal g
on g.GoalId = wg.GoalId
inner join ClientGoal cg
on cg.GoalId = g.GoalId
inner join Client c
on c.ClientId = cg.ClientId
group by w.Name
order by w.Name asc

-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------

-- activity 11:

-- total clients with and without goals (500):

select c.ClientId, c.FirstName + ' ' + c.LastName as clientName, count(g.GoalId) as number_of_goals from Goal g
full join ClientGoal cg
on cg.GoalId = g.GoalId
full join Client c
on c.ClientId = cg.ClientId
group by c.ClientId, c.FirstName + ' ' + c.LastName
order by count(g.GoalId) desc, c.FirstName + ' ' + c.LastName asc


-- total clients with goals only (450):

select c.ClientId, c.FirstName + ' ' + c.LastName as clientName, count(g.GoalId) as number_of_goals from Goal g
inner join ClientGoal cg
on cg.GoalId = g.GoalId
inner join Client c
on c.ClientId = cg.ClientId
group by c.ClientId, c.FirstName + ' ' + c.LastName
order by count(g.GoalId) desc, c.FirstName + ' ' + c.LastName asc


-- total client with no goals only (50):

select c.ClientId, c.FirstName + ' ' + c.LastName as clientName, count(g.GoalId) as number_of_goals from Goal g
full join ClientGoal cg
on cg.GoalId = g.GoalId
full join Client c
on c.ClientId = cg.ClientId
where cg.ClientId is null
group by c.ClientId, c.FirstName + ' ' + c.LastName
order by count(g.GoalId) desc, c.FirstName + ' ' + c.LastName asc


-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------

-- activity 12 (77 rows returned, not 82...?):


select e.Name as exerciseName, u.Name as unitName, min(eiuv.Value) as minUnitValue, max(eiuv.Value) as maxUnitValue from Exercise e
inner join ExerciseInstance ei
on ei.ExerciseId = e.ExerciseId
inner join ExerciseInstanceUnitValue eiuv
on eiuv.ExerciseInstanceId = ei.ExerciseInstanceId
inner join Unit u
on u.UnitId = eiuv.UnitId
group by e.Name, u.Name
order by e.Name, u.Name


-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------

-- activity 13 (here: 82 rows returned...):

select ec.Name, e.Name as exerciseName, u.Name as unitName, min(eiuv.Value) as minUnitValue, max(eiuv.Value) as maxUnitValue from ExerciseCategory ec
inner join Exercise e
on e.ExerciseCategoryId = ec.ExerciseCategoryId
inner join ExerciseInstance ei
on ei.ExerciseId = e.ExerciseId
inner join ExerciseInstanceUnitValue eiuv
on eiuv.ExerciseInstanceId = ei.ExerciseInstanceId
inner join Unit u
on u.UnitId = eiuv.UnitId
group by ec.Name, e.Name, u.Name
order by ec.Name, e.Name, u.Name

-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------

-- activity 14:

-- experimenting with DATEDIFF() and GETDATE() functions:


select c.BirthDate as initial_birthdate,
	CONVERT(DATE,GETDATE()) as today_date,
	DATEDIFF(year, c.BirthDate, CONVERT(DATE,GETDATE())) as difference_in_years
from Client c
where c.BirthDate is not null



-- solution:


SELECT l.Name as LevelName,
	min(DATEDIFF(year, c.BirthDate, CONVERT(DATE,GETDATE()))) as MinAge,
	max(DATEDIFF(year, c.BirthDate, CONVERT(DATE,GETDATE()))) as MaxAge
from Client c
inner join ClientGoal cg
on cg.ClientId = c.ClientId
inner join Goal g
on g.GoalId = cg.GoalId
inner join WorkoutGoal wg
on wg.GoalId = g.GoalId
inner join Workout w
on w.WorkoutId = wg.WorkoutId
inner join Level l
on l.LevelId = w.LevelId
where c.BirthDate is not null
group by l.Name


-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------

-- activity 15


CREATE TABLE #tempTable (
    extension VARCHAR(5)
);

insert into #tempTable
select right(EmailAddress, charindex('.', reverse(EmailAddress)) - 1)
from Login

select extension, count(extension) as number_of_extension_occurrences
from #tempTable
group by extension
order by count(extension) desc


-------------------------------------
-------------------------------------
-------------------------------------
-------------------------------------

-- activity 16:

