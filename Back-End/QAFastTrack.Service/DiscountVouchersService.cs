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
    public class DiscountVouchersService
    {
        #region Class Members/Class Variables

        private DiscountVouchersDAL _discountVouchersDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public DiscountVouchersService()
        {
            _discountVouchersDAL = new DiscountVouchersDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }


        #endregion
        #region DiscountVouchers
        public bool ManagementDiscountVouchers(DiscountVouchersDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.discountvouchers.ToString (), mod.ClientId, "ClientId");
                retVal = _discountVouchersDAL.ManageDiscountVouchers(mod);
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
        public List<DiscountVouchersDE> SearchDiscountVoucherss(DiscountVouchersDE mod)
        {
            List<DiscountVouchersDE> DiscountVoucherss = new List<DiscountVouchersDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.ClientId != default)
                    whereClause += $" AND ClientId={mod.ClientId}";
                if (mod.Value != default)
                    whereClause += $" AND Value={mod.Value}";
                if (mod.KeyValue != default)
                    whereClause += $" AND KeyValue like ''" + mod.KeyValue + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                DiscountVoucherss = _discountVouchersDAL.SearchDiscountVouchers(whereClause);

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
            return DiscountVoucherss;
        }

        #endregion
    }
}
