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
    public class CustomerAdvanceService
    {
        #region Class Members/Class Variables

        private CustomerAdvanceDAL _custAdvDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public CustomerAdvanceService ( )
        {
            _custAdvDAL = new CustomerAdvanceDAL ();
            _corDAL = new CoreDAL ();
            _logger = LogManager.GetLogger ("fileLogger");
        }
        #endregion
        #region CustomerAdvance
        public bool ManagementCustomerAdvance ( CustomerAdvanceDE mod )
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection ();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId (TableNames.customeradvance.ToString ());
                retVal = _custAdvDAL.ManageCustomerAdvance (mod);
                if (retVal == true)
                    mod.DBoperation = DBoperations.NA;
                return retVal;
            }
            catch (Exception ex)
            {
                _logger.Error (ex);
                throw;
            }
            finally
            {
                if (cmd != null)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
        }
        public List<CustomerAdvanceDE> SearchCustomerAdvances ( CustomerAdvanceDE mod )
        {
            List<CustomerAdvanceDE> CustomerAdvances = new List<CustomerAdvanceDE> ();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection ();
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                CustomerAdvances = _custAdvDAL.SearchCustomerAdvances (whereClause);

                #endregion
            }
            catch (Exception exp)
            {
                _logger.Error (exp);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
            return CustomerAdvances;
        }

        #endregion
    }
}
