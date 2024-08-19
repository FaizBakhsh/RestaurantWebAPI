using System;
using System.Collections.Generic;
using System.Text;
using Restaurant.Core.Enums;

namespace Restaurant.Core.Entities.Security
{
    public class RequiredPermission
    {
        public RequiredPermission(string resourceId, PermissionActions action)
        {
            ResourceId = resourceId;
            Action = action;
        }

        public string ResourceId { get; }

        public PermissionActions Action { get; }
    }
}
