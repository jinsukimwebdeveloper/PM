ALTER PROCEDURE [dbo].[FindProject] 
(
	--Input Parameter
	@Id int
)
AS
BEGIN
	SET NOCOUNT ON;  
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;  
	SET LOCK_TIMEOUT 20000;  

	BEGIN TRY  
		select P.Subject, P.Description, S.Name AS Status, P.ReleasedVersion, P.RecentSprint, P.SourceRespository, P.StartTime, P.EndTime
		from Project P
		JOIN [Jira].[dbo].[Status] S 
		ON P.Status = S.Id
		where P.Id = @Id
	END TRY

	BEGIN CATCH
	END CATCH
END
