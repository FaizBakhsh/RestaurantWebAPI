using MySql.Data.MySqlClient;
using NLog;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Service
{
    public class EmployeeService
    {
        #region Class Members/Class Variables

        private EmployeeDAL _employeeDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public EmployeeService()
        {
            _employeeDAL = new EmployeeDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }


        #endregion
        #region Employee
        public bool ManagementEmployee(EmployeeDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.employee.ToString (), mod.ClientId, "ClientId");
                _employeeDAL.ManageEmployee(mod);
                if (retVal == true)
                {
                    mod.DBoperation = DBoperations.NA;
                }
                return retVal;
            }
            catch (Exception ex)
            {
                _logger.Error(ex);
                throw;
            }
            finally
            {
                if (cmd != null)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<EmployeeDE> SearchEmployees(EmployeeDE mod)
        {
            List<EmployeeDE> Employees = new List<EmployeeDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.ClientId != default)
                    whereClause += $" AND ClientId={mod.ClientId}";
                if (mod.BranchId != default)
                    whereClause += $" AND BranchId={mod.BranchId}";
                if (mod.BranchName != default)
                    whereClause += $" AND BranchName like ''" + mod.BranchName + "''";
                if (mod.Gender != default)
                    whereClause += $" AND Gender like ''" + mod.Gender + "''";
                if (mod.Name != default)
                    whereClause += $" AND Name like ''" + mod.Name + "''";
                if (mod.Phone != default)
                    whereClause += $" AND Phone like ''" + mod.Phone + "''";
                if (mod.Designation != default)
                    whereClause += $" AND Designation like ''" + mod.Designation + "''";
               
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Employees = _employeeDAL.SearchEmployees(whereClause);

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
            return Employees;
        }

        #endregion
    }
}
