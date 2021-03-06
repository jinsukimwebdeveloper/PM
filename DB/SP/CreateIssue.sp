﻿ALTER PROCEDURE [dbo].[CreateIssue] 
(
	--Input Parameter
	@Subject nvarchar(255),
	@FixVersion nvarchar(10),
	@Estimate int,
	@Description nvarchar(1000),
	@Priority int,
	@Owner int,
	@Repoter int,
	@Component int,
	@Project int,
	@Result int=0 OUTPUT
)
AS
BEGIN
	SET NOCOUNT ON;  
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;  
	SET LOCK_TIMEOUT 20000;  

	BEGIN TRY  
		BEGIN TRAN   
			INSERT INTO dbo.Issues (Subject, Status, Components, Priority, FixVersion, Description, Assignee, Reporter, Estimate, Project)
			VALUES(@Subject, 1, @Component, @Priority, @FixVersion, @Description, @Owner, @Repoter, @Estimate, @Project)
		COMMIT TRAN;     
		SET @Result = 1
	END TRY

	BEGIN CATCH
		SET @Result = 0
	END CATCH

	SELECT @Result as Result
END