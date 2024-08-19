using MySql.Data.MySqlClient;
using NLog;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Core.ViewModel;
using Restaurant.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Service
{
    public class EmployeeSalaryService
    {
        #region Class Members/Class Variables

        private EmployeeSalaryDAL _empSalDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public EmployeeSalaryService()
        {
            _empSalDAL = new EmployeeSalaryDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region EmployeeSalary
        public bool ManagementEmployeeSalary(EmployeeSalaryDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.employeesalary.ToString (), mod.ClientId, "ClientId");
                retVal = _empSalDAL.ManageEmployeeSalary(mod);
                if (retVal == true)
                    mod.DBoperation = DBoperations.NA;
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
        public List<EmployeeSalaryDE> SearchEmployeeSalary(EmployeeSalaryDE mod)
        {
            List<EmployeeSalaryDE> EmployeeSalary = new List<EmployeeSalaryDE>();
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
                if (mod.EmployeeId != default && mod.EmployeeId != 0)
                    whereClause += $" AND EmployeeId={mod.EmployeeId}";
                if (mod.Amount != default)
                    whereClause += $" AND Amount like ''" + mod.Amount + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                EmployeeSalary = _empSalDAL.SearchEmployeeSalarys(whereClause);

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
            return EmployeeSalary;
        }

        #endregion
    }
}
