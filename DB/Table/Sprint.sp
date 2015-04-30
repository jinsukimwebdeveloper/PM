DROP TABLE Sprint

CREATE TABLE Sprint
(
Id int IDENTITY(1,1) PRIMARY KEY,
Subject nvarchar(255),
Project int,
Description	nvarchar(1000),
StartTime dateTime2,
EndTime dateTime2,
Reporter int,
Status int,
CompletedTimeStamp dateTime2,
CreatedTimeStamp datetime2 NOT NULL CONSTRAINT DF_Sprint_CreateDate_GETDATE DEFAULT GETDATE(),
UpdatedTimeStamp datetime2
)

INSERT INTO Sprint (Subject, Project, Description, StartTime, EndTime, Reporter, Status)
VALUES ('Azure �� �ʱ� ���� �ø���', 1, '������Ʈ �� Ƽ�� ������ CRUD �Ҽ� �ֵ��� ���� �Ŀ� Azure�� �����Ѵ�.','2015-04-01', '2015-05-30', 1, 1)

