﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Core.Entities
{
    public class TableDE : BaseDomain
    {
        #region Properties
        public int FloorId { get; set; }
        public String? Name { get; set; }
        #endregion
        #region Constructor
        public TableDE()
        {
            Name = null;
        }
        #endregion
    }
}