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
    public class EmployeeSaleService
    {
        #region Class Members/Class Variables

        private EmployeeSaleDAL _EmployeeSaleDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public EmployeeSaleService()
        {
            _EmployeeSaleDAL = new EmployeeSaleDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region EmployeeSale
        public bool ManagementEmployeeSale(EmployeeSaleDE mod)
        {
            bool retVal = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.employeesale.ToString (), mod.ClientId, "ClientId");
                retVal = _EmployeeSaleDAL.ManageEmployeeSale(mod);
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

        public List<EmployeeSaleDE> SearchEmployeeSales(EmployeeSaleDE mod)
        {
            List<EmployeeSaleDE> EmployeeSales = new List<EmployeeSaleDE>();
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
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                EmployeeSales = _EmployeeSaleDAL.SearchEmployeeSales(whereClause);

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
            return EmployeeSales;
        }
        #endregion
    }
}
