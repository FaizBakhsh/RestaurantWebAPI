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
    public class CustomerService
    {
        #region Class Members/Class Variables

        private CustomerDAL _customerDAL;
        private CoreDAL _corDAL;
        private ItemDAL _itemDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public CustomerService()
        {
            _itemDAL = new ItemDAL();
            _customerDAL = new CustomerDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }


        #endregion
        #region Customer
        public bool ManagementCustomer(CustomerDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.customer.ToString (), mod.ClientId, "ClientId");
                retVal = _customerDAL.ManageCustomer(mod);
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
        public List<CustomerDE> SearchCustomers(CustomerDE mod)
        {
            List<CustomerDE> Customers = new List<CustomerDE>();
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
                if (mod.BranchId != default && mod.BranchId!=0)
                    whereClause += $" AND BranchId={mod.BranchId}";
                if (mod.Name != default)
                    whereClause += $" AND Name like ''" + mod.Name + "''";
                if (mod.Email != default)
                    whereClause += $" AND Email like ''" + mod.Email + "''";
                if (mod.Phone != default)
                    whereClause += $" AND Phone like ''" + mod.Phone + "''";
                if (mod.BranchName != default)
                    whereClause += $" AND BranchName like ''" + mod.BranchName + "''";
                if (mod.Address != default)
                    whereClause += $" AND Address like ''" + mod.Address + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Customers = _customerDAL.SearchCustomers(whereClause);

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
            return Customers;
        }

        #endregion
    }
}
