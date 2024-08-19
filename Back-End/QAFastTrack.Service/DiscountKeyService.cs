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
    public class DiscountKeyService
    {
        #region Class Members/Class Variables

        private DiscountKeyDAL _discountKeyDAL;
        private CoreDAL _corDAL;
        private ItemDAL _itemDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public DiscountKeyService()
        {
            _itemDAL = new ItemDAL();
            _discountKeyDAL = new DiscountKeyDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }


        #endregion
        #region DiscountKey
        public bool ManagementDiscountKey(DiscountKeyDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.discountkey.ToString (), mod.ClientId, "ClientId");
                retVal = _discountKeyDAL.ManageDiscountKey(mod);
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
        public List<DiscountKeyDE> SearchDiscountKeys(DiscountKeyDE mod)
        {
            List<DiscountKeyDE> DiscountKeys = new List<DiscountKeyDE>();
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
                if (mod.DiscountKey != default)
                    whereClause += $" AND DiscountKey like ''" + mod.DiscountKey + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                DiscountKeys = _discountKeyDAL.SearchDiscountKeys(whereClause);
              
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
            return DiscountKeys;
        }

        #endregion
    }
}
