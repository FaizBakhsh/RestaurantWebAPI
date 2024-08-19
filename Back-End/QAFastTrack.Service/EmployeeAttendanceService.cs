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
    public class EmployeeAttendanceService
    {
        #region Class Members/Class Variables

        private EmployeeAttendanceDAL _atndDAL;
        private CoreDAL _corDAL;
        private ItemDAL _itemDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public EmployeeAttendanceService()
        {
            _itemDAL = new ItemDAL();
            _atndDAL = new EmployeeAttendanceDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region EmployeeAttendance
        public bool ManagementEmployeeAttendance(EmployeeAttendanceDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.employeeattendance.ToString (), mod.ClientId, "ClientId");
                retVal = _atndDAL.ManageEmployeeAttendance(mod);
                if (retVal == true)
                    mod.DBoperation = DBoperations.NA;
                return retVal;
            }
            catch (Exception ex)
            {
                _logger.Error(ex);
                RestaurantDataContext.CancelTransaction(cmd);
                throw;
            }
            finally
            {
                if (cmd != null)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<EmployeeAttendanceDE> SearchEmployeeAttendances(EmployeeAttendanceDE mod)
        {
            List<EmployeeAttendanceDE> EmployeeAttendances = new List<EmployeeAttendanceDE>();
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
                if (mod.EmployeeId != default && mod.EmployeeId!=0)
                    whereClause += $" AND EmployeeId={mod.EmployeeId}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                EmployeeAttendances = _atndDAL.SearchEmployeeAttendance(whereClause);

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
            return EmployeeAttendances;
        }

        #endregion
    }
}
