using MySql.Data.MySqlClient;
using NLog;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.DAL;
using Restaurant.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Service
{
    public class UserService
    {
        #region Class Members/Class Variables

        private UserDAL _userDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public UserService()
        {
            _userDAL = new UserDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region User    
        public List<UserVM> SearchUser(UserVM mod)
        {
            List<UserVM> Users = new List<UserVM>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id like ''" + mod.Id + "''";
                if (mod.EmployeeId != default && mod.EmployeeId!=0)
                    whereClause += $" AND EmployeeId={mod.EmployeeId}";
                if (mod.CLTId != default)
                    whereClause += $" AND CLTId like ''" + mod.CLTId + "''";
                if (mod.ClientId != default)
                    whereClause += $" AND ClientId ={mod.ClientId}";
                //if (mod.ModuleId != default)
                //    whereClause += $" AND ModuleId ={mod.ModuleId}";
                if (mod.Name != default)
                    whereClause += $" AND Name like ''" + mod.Name + "''";
                if (mod.Role != default)
                    whereClause += $" AND Role like ''" + mod.Role + "''";
                if (mod.RoleId != default)
                    whereClause += $" AND RoleId ={mod.RoleId}";
                if (mod.EmployeeName != default)
                    whereClause += $" AND EmployeeName like ''" + mod.EmployeeName + "''";
                if (mod.Email != default)
                    whereClause += $" AND Email like ''" + mod.Email + "''";
                if (mod.UserPassword != default)
                    whereClause += $" AND UserPassword like ''" + mod.UserPassword + "''";
                if (mod.UserName != default)
                    whereClause += $" AND UserName like ''" + mod.UserName + "''";

                Users = _userDAL.SearchUser(whereClause);

                #endregion
            }
            catch (Exception exp)
            {
                _logger.Error(exp);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
            return Users;
        }
        #endregion
    }
}
