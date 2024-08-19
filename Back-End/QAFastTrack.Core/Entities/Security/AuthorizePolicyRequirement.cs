using Microsoft.AspNetCore.Authorization;
using System;
using System.Collections.Generic;
using System.Text;

namespace Restaurant.Core.Entities.Security
{
    public class AuthorizePolicyRequirement : IAuthorizationRequirement
    {
        public AuthorizePolicyRequirement(params IAuthorizePolicy[] requiredPolicies)
        {
            RequiredPolicies = requiredPolicies;
        }

        public IAuthorizePolicy[] RequiredPolicies { get; }
    }
}
