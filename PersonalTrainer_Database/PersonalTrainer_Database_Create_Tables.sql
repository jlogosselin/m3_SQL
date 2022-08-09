


USE PersonalTrainer;


IF OBJECT_ID('dbo.State', 'U') IS NOT NULL DROP TABLE dbo.State;
CREATE TABLE dbo.State (
StateAbbr VARCHAR(2) NOT NULL PRIMARY KEY,
Name VARCHAR(50) NOT NULL,
);


IF OBJECT_ID('dbo.Client', 'U') IS NOT NULL DROP TABLE dbo.Client;
CREATE TABLE dbo.Client (
    ClientId VARCHAR(36) PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    BirthDate DATE,
    Address VARCHAR(256),
    City VARCHAR(100),
    StateAbbr VARCHAR(2),
    PostalCode VARCHAR(10),
    CONSTRAINT FK_Client_State FOREIGN KEY(StateAbbr) REFERENCES dbo.State(StateAbbr)
);


IF OBJECT_ID('dbo.Login', 'U') IS NOT NULL DROP TABLE dbo.Login;
CREATE TABLE Login (
    ClientId VARCHAR(36) NOT NULL PRIMARY KEY,
    EmailAddress VARCHAR(256) NOT NULL,
    PasswordHash VARCHAR(1024) NOT NULL,
    FailedAttempts TINYINT NOT NULL DEFAULT 0,
    IsLocked BIT NOT NULL DEFAULT 0,
    CONSTRAINT FK_Login_Client FOREIGN KEY(ClientId) REFERENCES dbo.Client(ClientId)
);


IF OBJECT_ID('dbo.Invoice', 'U') IS NOT NULL DROP TABLE dbo.Invoice;
CREATE TABLE Invoice (
    InvoiceId INT PRIMARY KEY,
    ClientId VARCHAR(36) NOT NULL,
    InvoiceDate DATE NOT NULL,
    InvoiceStatus TINYINT NOT NULL DEFAULT 1,
    CONSTRAINT FK_Invoice_Client FOREIGN KEY(ClientId) REFERENCES dbo.Client(ClientId)
);


IF OBJECT_ID('dbo.InvoiceLineItem', 'U') IS NOT NULL DROP TABLE dbo.InvoiceLineItem;
CREATE TABLE InvoiceLineItem (
    InvoiceLineItemId INT IDENTITY(1,1) PRIMARY KEY,
    InvoiceId INT NOT NULL,
    Description VARCHAR(100) NOT NULL,
    Price DECIMAL(12, 4) NOT NULL,
    Quantity DECIMAL(12, 4) NOT NULL,
    ServiceDate DATE,
    CONSTRAINT FK_InvoiceLineItem_Invoice FOREIGN KEY(InvoiceId) REFERENCES dbo.Invoice(InvoiceId)
);


IF OBJECT_ID('dbo.Goal', 'U') IS NOT NULL DROP TABLE dbo.Goal;
CREATE TABLE Goal (
    GoalId INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);


IF OBJECT_ID('dbo.ClientGoal', 'U') IS NOT NULL DROP TABLE dbo.ClientGoal;
create table ClientGoal (
    ClientId VARCHAR(36) NOT NULL,
    GoalId INT NOT NULL,
    CONSTRAINT PK_ClientGoalKey PRIMARY KEY (ClientId, GoalId),
    CONSTRAINT FK_ClientGoal_Client FOREIGN KEY(ClientId) REFERENCES dbo.Client(ClientId),
    CONSTRAINT FK_ClientGoal_Goal FOREIGN KEY(GoalId) REFERENCES dbo.Goal(GoalId)
);


IF OBJECT_ID('dbo.Level', 'U') IS NOT NULL DROP TABLE dbo.Level;
CREATE TABLE Level (
    LevelId INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Notes VARCHAR(1024)
);


IF OBJECT_ID('dbo.Unit', 'U') IS NOT NULL DROP TABLE dbo.Unit;
CREATE TABLE Unit (
    UnitId INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Abbr VARCHAR(5) NOT NULL
);


IF OBJECT_ID('dbo.Workout', 'U') IS NOT NULL DROP TABLE dbo.Workout;
CREATE TABLE Workout (
    WorkoutId int primary key,
    Name varchar(100) not null,
    LevelId int not null,
    MinMinutes int not null,
    MaxMinutes int not null,
    Notes varchar(1024),
    CONSTRAINT FK_Workout_Level FOREIGN KEY(LevelId) REFERENCES dbo.Level(LevelId)
);


IF OBJECT_ID('dbo.WorkoutDay', 'U') IS NOT NULL DROP TABLE dbo.WorkoutDay;
create table WorkoutDay (
    WorkoutDayId int primary key,
    WorkoutId int not null,
    Sequence int not null,
    DayOfWeek tinyint not null,
    CONSTRAINT FK_WorkoutDay_Workout FOREIGN KEY(WorkoutId) REFERENCES Workout(WorkoutId)
);


IF OBJECT_ID('dbo.WorkoutGoal', 'U') IS NOT NULL DROP TABLE dbo.WorkoutGoal;
create table WorkoutGoal (
    WorkoutId int not null,
    GoalId int not null,
    CONSTRAINT PK_WorkoutGoalKey PRIMARY KEY (WorkoutId, GoalId),
    CONSTRAINT FK_WorkoutGoal_Workout FOREIGN KEY(WorkoutId) REFERENCES Workout(WorkoutId),
    CONSTRAINT FK_WorkoutGoal_Goal FOREIGN KEY(GoalId) REFERENCES Goal(GoalId)
);


IF OBJECT_ID('dbo.ClientWorkout', 'U') IS NOT NULL DROP TABLE dbo.ClientWorkout;
create table ClientWorkout (
    ClientId varchar(36) not null,
    WorkoutId int not null,
    CONSTRAINT PK_ClientWorkoutKey PRIMARY KEY (ClientId, WorkoutId),
    CONSTRAINT FK_ClientWorkout_Client FOREIGN KEY(ClientId) REFERENCES Client(ClientId),
    CONSTRAINT FK_ClientWorkout_Workout FOREIGN KEY(WorkoutId) REFERENCES Workout(WorkoutId)
);


IF OBJECT_ID('dbo.ExerciseCategory', 'U') IS NOT NULL DROP TABLE dbo.ExerciseCategory;
CREATE TABLE ExerciseCategory (
    ExerciseCategoryId int primary key,
    Name varchar(50) not null,
    ParentCategoryId int,
    CONSTRAINT FK_ExerciseCategory_ExerciseCategory FOREIGN KEY(ParentCategoryId) REFERENCES dbo.ExerciseCategory(ExerciseCategoryId)
);


IF OBJECT_ID('dbo.Exercise', 'U') IS NOT NULL DROP TABLE dbo.Exercise;
CREATE TABLE Exercise (
    ExerciseId int primary key,
    Name varchar(100) not null,
    ExerciseCategoryId int not null,
    CONSTRAINT FK_Exercise_ExerciseCategory FOREIGN KEY(ExerciseCategoryId) REFERENCES dbo.ExerciseCategory(ExerciseCategoryId)
);


IF OBJECT_ID('dbo.ExerciseInstance', 'U') IS NOT NULL DROP TABLE dbo.ExerciseInstance;
create table ExerciseInstance (
    ExerciseInstanceId int primary key,
    ExerciseId int not null,
    Sets int not null default 1,
    CONSTRAINT FK_ExerciseInstance_Exercise FOREIGN KEY(ExerciseId) REFERENCES dbo.Exercise(ExerciseId)
);



IF OBJECT_ID('dbo.ExerciseInstanceUnitValue', 'U') IS NOT NULL DROP TABLE dbo.ExerciseInstanceUnitValue;
create table ExerciseInstanceUnitValue (
    ExerciseInstanceId int not null,
    UnitId int not null,
    Value int not null,
    CONSTRAINT FK_ExerciseInstanceUnitValue_ExerciseInstance FOREIGN KEY(ExerciseInstanceId) REFERENCES dbo.ExerciseInstance(ExerciseInstanceId),
    CONSTRAINT FK_ExerciseInstanceUnitValue_Unit FOREIGN KEY(UnitId) REFERENCES dbo.Unit(UnitId)
);


IF OBJECT_ID('dbo.WorkoutDayExerciseInstance', 'U') IS NOT NULL DROP TABLE dbo.WorkoutDayExerciseInstance;
create table WorkoutDayExerciseInstance (
    WorkoutDayId int not null,
    ExerciseInstanceId int not null,
    Sequence int not null,
    CONSTRAINT PK_WorkoutDayExerciseInstanceKey primary key (WorkoutDayId, ExerciseInstanceId, Sequence),
    CONSTRAINT FK_WorkoutDayExercise_WorkoutDay FOREIGN KEY(WorkoutDayId) REFERENCES WorkoutDay(WorkoutDayId),
    CONSTRAINT fk_WorkoutDayExercise_ExerciseInstance FOREIGN KEY(ExerciseInstanceId) REFERENCES ExerciseInstance(ExerciseInstanceId)
);

