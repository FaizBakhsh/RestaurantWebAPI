using System;
using System.Collections.Generic;
using System.Text;

namespace Restaurant.Core.Entities.Security
{
    public interface IAuthorizePolicy
    {
        RequiredPermission[] Permissions { get; }

        string Key { get; }
    }
}
