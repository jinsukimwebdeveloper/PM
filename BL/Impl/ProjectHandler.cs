using Jira.BL.Interface;
using Jira.DL.Interfaces;
using Jira.DL.Interfaces.Dto;
using Jira.Views.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Jira.BL.Impl
{
    public class ProjectHandler : IProjectHandler
    {
        private readonly IProjectDataAccess _projectDataAccess;

        public ProjectHandler(IProjectDataAccess projectDataAccess)
        {
            _projectDataAccess = projectDataAccess;
        }

        public IEnumerable<ProjectTableModel> GetProjectTableModel(DateTime startTime, DateTime endTime, int pageNumber, int pageRows)
        {
            List<ProjectTableModel> result = new List<ProjectTableModel>();
            IEnumerable<ProjectResult> projectResult = _projectDataAccess.GetSProjectList(startTime, endTime, pageNumber, pageRows);
            ProjectTableModel.TotalRows = ProjectResult.TotalCount;
            foreach (ProjectResult item in projectResult)
            {
                ProjectTableModel model = new ProjectTableModel();
                model.Id = item.Id;
                model.SeqNo = item.SeqNo;
                model.Subject = item.Subject;
                model.Status = item.Status;
                model.StartTime = item.StartTime.ToShortDateString();
                model.EndTime = item.EndTime.ToShortDateString();
                result.Add(model);
            }
            return result;
        }

        public ProjectDetailModel GetProjectDetail(int id)
        {
            ProjectDetailModel result = new ProjectDetailModel();
            ProjectResult projectResult = _projectDataAccess.FindProject(id);
            result.Subject = projectResult.Subject;
            result.Status = projectResult.Status;
            result.StartTime = projectResult.StartTime.ToShortDateString();
            result.EndTime = projectResult.EndTime.ToShortDateString();
            result.Description = projectResult.Description;
            result.RecentSprint = projectResult.RecentSprint;
            result.ReleasedVersion = projectResult.ReleasedVersion;
            result.SourceRespository = projectResult.SourceRespository;

            return result;
        }

        public int CreateProject(CreateProjectModel model)
        {
            CreateProjectResult result = new CreateProjectResult();
            result.Subject = model.Subject;
            result.Description = model.Description;
            result.StartTime = DateTime.Parse(model.StartTime);
            result.EndTime = DateTime.Parse(model.EndTime);
            return _projectDataAccess.CreateProject(result);
        }
    }
}