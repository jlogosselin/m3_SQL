

-- activity 1:

select ec.Name as Exercise_Category, e.Name as Exercise_Name
from ExerciseCategory ec
inner join Exercise e
on e.ExerciseCategoryId = ec.ExerciseCategoryId

------------------------------

-- activity 2:

select ec.Name as Exercise_Category, e.Name as Exercise_Name
from ExerciseCategory ec
inner join Exercise e
on e.ExerciseCategoryId = ec.ExerciseCategoryId
where ec.ParentCategoryId is null

------------------------------

-- activity 3:

select ec.Name as Exercise_Category, e.Name as Exercise_Name
from ExerciseCategory ec
inner join Exercise e
on e.ExerciseCategoryId = ec.ExerciseCategoryId
where ec.ParentCategoryId is null

------------------------------

-- activity 4:

select c.FirstName, c.LastName, c.BirthDate, l.EmailAddress from Client c
inner join Login l
on l.ClientId = c.ClientId
where c.BirthDate like '199%'

------------------------------

-- activity 5:

select w.Name, c.FirstName, c.LastName from Client c
inner join ClientWorkout cw
on cw.ClientId = c.ClientId
inner join Workout w
on w.WorkoutId = cw.WorkoutId
where c.LastName like 'C%'

------------------------------

-- activity 6:

select w.Name, g.Name from Workout w
inner join WorkoutGoal wg
on wg.WorkoutId = w.WorkoutId
inner join Goal g
on g.GoalId = wg.GoalId

------------------------------

-- activity 7:

-- STEP 1:

select c.FirstName + ' ' + c.LastName as Full_Client_Name, l.EmailAddress
from Client c
full join Login l
on l.ClientId = c.ClientId

-- STEP 2:

select c.FirstName + ' ' + c.LastName as Full_Client_Name_With_No_Login
from Client c
full join Login l
on l.ClientId = c.ClientId
where l.EmailAddress is null
order by c.LastName asc

------------------------------

-- activity 8:

-- 0 rows returned:

select c.FirstName, c.LastName, l.EmailAddress as Romeo_Email_Address
from Client c
inner join Login l
on l.ClientId = c.ClientId
where c.FirstName = 'Romeo'
and c.LastName = 'Seaward'

-- 1 row returned:

select c.FirstName, c.LastName, l.EmailAddress as Romeo_Email_Address
from Client c
full join Login l
on l.ClientId = c.ClientId
where c.FirstName = 'Romeo'
and c.LastName = 'Seaward'

------------------------------

-- activity 9:

-- not sure...?

------------------------------

-- activity 10:

-- note sure...?

------------------------------

-- activity 11:

SELECT c.FirstName + ' ' + c.LastName as Clients_With_No_Workout
FROM Client c
WHERE c.ClientId not IN
    (SELECT cw.ClientId
     FROM ClientWorkout cw)

------------------------------

-- activity 12:

select g.Name as Beginner_Level_Goals_of_Shell_Creane from Client c
inner join ClientGoal cg
on cg.ClientId = c.ClientId
inner join Goal g
on g.GoalId = cg.GoalId
inner join WorkoutGoal wg
on wg.GoalId = g.GoalId
inner join Workout w
on w.WorkoutId = wg.WorkoutId
where c.FirstName = 'Shell'
and c.LastName = 'Creane'
and w.LevelId = 1
group by g.Name

------------------------------

-- activity 13:

SELECT w.Name as Workouts_With_No_Goals
FROM Workout w
full join WorkoutGoal wg
on wg.WorkoutId = w.WorkoutId
WHERE wg.GoalId not in
    (SELECT GoalId
     FROM Goal
     where Name = 'Core Strength')
group by w.Name

------------------------------

-- activity 14:

select w.Name, e.Name from Workout w
inner join WorkoutDay wd
on wd.WorkoutId = w.WorkoutID
inner join WorkoutDayExerciseInstance wdei
on wdei.WorkoutDayId = wd.WorkoutDayId
inner join ExerciseInstance ei
on ei.ExerciseInstanceId = wdei.ExerciseInstanceId
inner join Exercise e
on e.ExerciseId = ei.ExerciseId

------------------------------

--activity 15:

select e.Name as Exercise_Name, eiuv.Value, u.Name as Unit_Value from Exercise e
inner join ExerciseInstance ei
on ei.ExerciseId = e.ExerciseId
inner join ExerciseInstanceUnitValue eiuv
on eiuv.ExerciseInstanceId = ei.ExerciseInstanceId
inner join Unit u
on u.UnitId = eiuv.UnitId
where e.Name = 'Plank'

