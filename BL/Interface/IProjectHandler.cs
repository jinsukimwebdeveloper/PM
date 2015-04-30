using Jira.Views.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Jira.BL.Interface
{
    public interface IProjectHandler
    {
        IEnumerable<ProjectTableModel> GetProjectTableModel(DateTime startTime, DateTime endTime, int pageNumber, int pageRows);

        int CreateProject(CreateProjectModel model);

        ProjectDetailModel GetProjectDetail(int id);
    }
}