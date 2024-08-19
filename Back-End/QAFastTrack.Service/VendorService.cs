using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using NLog;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.DAL;
using System;
namespace Restaurant.Service
{
    public class VendorService
    {
        #region Class Members/Class Variables

        private VendorDAL _VendorDAL;
        private CoreDAL _corDAL;
        private ItemDAL _itemDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public VendorService()
        {
            _itemDAL = new ItemDAL();
            _VendorDAL = new VendorDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region Vendor
        public bool ManagementVendor(VendorDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                RestaurantDataContext.StartTransaction(cmd);
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.vendor.ToString());
                _VendorDAL.ManageVendor(mod);
                if (retVal == true)
                {
                    mod.DBoperation = DBoperations.NA;
                    RestaurantDataContext.EndTransaction(cmd);
                }
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
        public List<VendorDE> SearchVendors(VendorDE mod)
        {
            List<VendorDE> Vendors = new List<VendorDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.Name != default)
                    whereClause += $" AND Name like ''" + mod.Name + "''";
                if (mod.Email != default)
                    whereClause += $" AND Email like ''" + mod.Email + "''";
                if (mod.Phone != default)
                    whereClause += $" AND Phone like ''" + mod.Phone + "''";
                if (mod.Address != default)
                    whereClause += $" AND Address like ''" + mod.Address + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Vendors = _VendorDAL.SearchVendors(whereClause);

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
            return Vendors;
        }
        #endregion
    }
}