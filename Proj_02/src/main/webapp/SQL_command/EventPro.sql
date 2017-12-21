Use Proj02
drop table event01
create table event01(
[EventID]  integer primary key,
[EventName]	Nvarchar(max),
[ShowGroupName]	Nvarchar(max),
[EventTypeID]	Nvarchar(max),
[DurationStart]	datetime,
[DurationEnd]	datetime,
[IsCharge]	Varchar(10),
[Fee]	Nvarchar(max),
[ShoppingUrl]	Nvarchar(max),
[ContactName]	Nvarchar(max),
[ContactTel]	nvarchar(max),
[ContactFax]	Nvarchar(max),
[BriefIntroduction]	Nvarchar(max),
[vContent]	Nvarchar(max),
[EventUrl]	Nvarchar(max),
[YouTubeUrl]	Nvarchar(max),
[ImageFile]	varchar(max),
[LogoImageFile]	varchar(max),
[InsertTime]	Datetime,
[dtStart]	Datetime,
[dtEnd]	Datetime,
[timeStart]	time,
[Location]	Nvarchar(max),
[CityID]	nVarchar(100),
[AreaID]	nVarchar(100), 
[Address]	Nvarchar(max),
[longitude]	Varchar(100),
[latitude]	Varchar(100),
[collectionCount] integer  DEFAULT '0',
[shareCount]  integer  DEFAULT '0',
[isBlock]     integer  DEFAULT '0' 


)



