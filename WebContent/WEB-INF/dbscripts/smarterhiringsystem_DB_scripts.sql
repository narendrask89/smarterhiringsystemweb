CREATE DATABASE shsdb;

CREATE TABLE `shsdb`.`admin` (
  `UID` VARCHAR(10) NOT NULL,
  `PWD` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`UID`));
  
CREATE TABLE `shsdb`.`temp_data` (
  `StudentID` VARCHAR(10) NOT NULL,
  `QstNo` VARCHAR(45) NOT NULL,
  `qstn` VARCHAR(200) NULL,
  `ch1` VARCHAR(45) NULL,
  `ch2` VARCHAR(45) NULL,
  `ch3` VARCHAR(45) NULL,
  `ch4` VARCHAR(45) NULL,
  `ans` VARCHAR(45) NULL);

CREATE TABLE `shsdb`.`result` (
  `studentid` VARCHAR(10) NOT NULL,
  `examID` VARCHAR(45) NULL,
  `jobID` VARCHAR(45) NULL,
  `mark` VARCHAR(45) NULL,
  `maxques` VARCHAR(45) NULL);

CREATE TABLE `shsdb`.`login` (
  `Username` VARCHAR(10) NOT NULL,
  `Password` VARCHAR(15) NOT NULL,
  `Status` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Username`));
  
CREATE TABLE `shsdb`.`com` (
  `CUsername` VARCHAR(10) NOT NULL,
  `CName` VARCHAR(45) NOT NULL,
  `CAddress` VARCHAR(45) NULL,
  `CPost` VARCHAR(45) NULL,
  `CCriteria` VARCHAR(45) NULL,
  `CEmail` VARCHAR(45) NULL,
  `CContact` VARCHAR(45) NULL,
  `CCutoff` VARCHAR(45) NULL,
  PRIMARY KEY (`CUsername`));
  
CREATE TABLE `shsdb`.`exam` (
  `ExamID` VARCHAR(10) NOT NULL,
  `JobID` VARCHAR(45) NULL,
  `Post` VARCHAR(45) NULL,
  `ExamName` VARCHAR(45) NULL,
  `Cutoff` VARCHAR(45) NULL,
  PRIMARY KEY (`ExamID`));

CREATE TABLE `shsdb`.`jobdetails` (
  `JobId` VARCHAR(10) NOT NULL,
  `Comp_id` VARCHAR(45) NULL,
  `Post` VARCHAR(45) NULL,
  `Criteria` VARCHAR(45) NULL,
  `NoOfVacancies` VARCHAR(45) NULL,
  `Salary` VARCHAR(45) NULL,
  `LastDate` VARCHAR(45) NULL,
  PRIMARY KEY (`JobId`));
  
CREATE TABLE `shsdb`.`question` (
  `QuestionNo` VARCHAR(10) NOT NULL,
  `JobID` VARCHAR(45) NULL,
  `ExamID` VARCHAR(45) NULL,
  `Question` VARCHAR(200) NULL,
  `Option1` VARCHAR(45) NULL,
  `Option2` VARCHAR(45) NULL,
  `Option3` VARCHAR(45) NULL,
  `Option4` VARCHAR(45) NULL,
  `Answer` VARCHAR(45) NULL,
  PRIMARY KEY (`QuestionNo`));

CREATE TABLE `shsdb`.`details` (
  `Username` VARCHAR(10) NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Gender` VARCHAR(45) NULL,
  `DateOfBirth` VARCHAR(45) NULL,
  `CollegeName` VARCHAR(45) NULL,
  `CollegePhone` VARCHAR(45) NULL,
  `CollegeEmail` VARCHAR(45) NULL,
  `Branch` VARCHAR(45) NULL,
  `Mark` VARCHAR(45) NULL,
  `Degree` VARCHAR(45) NULL,
  `Email_id` VARCHAR(45) NULL,
  `Telephone` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `Pincode` VARCHAR(45) NULL,
  `Category` VARCHAR(45) NULL,
  PRIMARY KEY (`Username`));
  
CREATE TABLE `shsdb`.`experienced` (
  `Username` VARCHAR(10) NOT NULL,
  `expyears` VARCHAR(45) NULL,
  `company` VARCHAR(45) NULL,
  `designation` VARCHAR(45) NULL,
  `salary` VARCHAR(45) NULL,
  `comAddress` VARCHAR(45) NULL);
