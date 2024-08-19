using Microsoft.AspNetCore.Identity;
using Restaurant.Core.Entities;

namespace Restaurant.WebAPI.Models
{
    public class UserVM 
    {
        public string? PasswordHash { get; set; }
        public string? Email { get; set; }     
        public string? UserPassword { get; set; }    
        public string? Name { get; set; }     
        public String? EmployeeName { get; set; }
        public String? Role { get; set; }
        public string? UserPhone { get; set; }
        public int? EmployeeId { get; set; }
        public string? Id { get; set; }
        public String? UserName { get; set; }
        public int RoleId { get; set; }
        public string? FatherName { get; set; }
        public string? CNIC { get; set; }
        public string? FirstName { get; set; }
        public string? Address { get; set; }
        public string? Designation { get; set; }
        public string? MSCardNo { get; set; }
        public int? DiscountLimit { get; set; }
        public int? BranchId { get; set; }
        public string? Branch { get; set; }
        public int ClientId { get; set; }
        public string? Client { get; set; }
        public string? ModuleIds { get; set; }
        public int? ModuleId { get; set; }
        public string? Module { get; set; }
        public int CLTId { get; set; }
        public string? CLTModuleIds { get; set; }
        public string? ReportToId { get; set; }
        public string? ReportTo { get; set; }

    }
}
