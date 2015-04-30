using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Jira.Views.Dto
{
    public class ProjectMembersModel
    {
        public string Id { get; set; }
        public string Role { get; set; }
        public string Name { get; set; }
        public string MobileNumber { get; set; }
    }
}