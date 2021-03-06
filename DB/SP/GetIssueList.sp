﻿ALTER PROCEDURE [dbo].[GetIssueList] 
(
	--Input Parameter
	@StartDate datetime2,
	@EndDate datetime2,
	@PageNumber int,
	@PageRows int
)
AS
BEGIN
	SET NOCOUNT ON;  
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;  
	SET LOCK_TIMEOUT 20000;  

	BEGIN TRY  
		DECLARE @Tbl Table(
			SeqNo int IDENTITY(1,1) PRIMARY KEY,
			Id int, 
			Subject nvarchar(255), 
			Status nvarchar(255),
			Priority nvarchar(255),
			FixVersion nvarchar(255),
			Assignee nvarchar(255),
			Estimate nvarchar(255),
			CompletedTimeStamp datetime2,
			Repoter nvarchar(255),
			CreatedTimeStamp datetime2,
			Project  nvarchar(255)
		)

		INSERT INTO @Tbl
			SELECT I.Id, I.Subject, S.Name AS Status, P.Name AS Priority, I.FixVersion, U.Name AS Assignee, CONVERT(varchar(10),I.Estimate) + 'MD', 
				ISNULL(CompletedTimeStamp, '') AS CompletedTimeStamp, U1.Name AS Repoter, I.CreatedTimeStamp, P1.Subject
					FROM [Jira].[dbo].[Issues] I 
					JOIN [Jira].[dbo].[Status] S 
					ON I.Status = S.Id
					JOIN [Jira].[dbo].[Users] U
					ON I.Assignee = U.UserId
					JOIN [Jira].[dbo].[Users] U1
					ON I.Reporter = U1.UserId
					JOIN [Jira].[dbo].[Priority] P
					ON I.Priority = P.Id
					JOIN [Jira].[dbo].[Project] P1
					ON I.Project = P1.Id
				WHERE I.CreatedTimeStamp >= @StartDate AND  I.CreatedTimeStamp <= @EndDate

		SELECT * FROM @Tbl 
		WHERE SeqNo>=((@PageNumber-1)*@PageRows)+1 AND SeqNo<=@PageNumber*@PageRows  
		ORDER BY SeqNo;  

		SELECT (SELECT COUNT(*) FROM @TBL) AS TotalCount
	END TRY

	BEGIN CATCH
	END CATCH
END