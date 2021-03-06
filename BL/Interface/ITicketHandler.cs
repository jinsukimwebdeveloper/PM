﻿using Jira.DL.Interfaces.Dto;
using Jira.Views.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Jira.BL.Interface
{
    public interface ITicketHandler
    {
        IEnumerable<TicketTableModel> GetTicketTableModel(DateTime startTime, DateTime endTime, int pageNumber, int pageRows);
    }
}