﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class EmployeeDE:BaseDomain
    {
        #region properties
        public int BranchId { get; set; }
        public String? BranchName { get; set; }
        public String? Gender { get; set; }
        public String? Name { get; set; }
        public String? Phone { get; set; }
        public String? Designation { get; set; }
        public DateTime? JoiningDate { get; set; }
        #endregion
        #region constructor     
        public EmployeeDE() 
        {
            BranchName = null;
            Gender = null;  
            Name = null;    
            Phone = null;
            Designation = null;
            JoiningDate= null;
        }
        #endregion
    }
}