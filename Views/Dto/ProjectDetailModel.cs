using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Jira.Views.Dto
{
    public class ProjectDetailModel
    {
        public string Subject { get; set; }
        public string Status { get; set; }
        public string Description { get; set; }
        public string ReleasedVersion { get; set; }
        public string RecentSprint { get; set; }
        public string SourceRespository { get; set; }
        public string StartTime { get; set; }
        public string EndTime { get; set; }
        public IEnumerable<ProjectMembersModel> Members { get; set; }
        public IEnumerable<TicketTableModel> Tickets { get; set; }
    }
}