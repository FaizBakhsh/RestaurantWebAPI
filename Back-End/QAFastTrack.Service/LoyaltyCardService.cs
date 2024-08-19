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
    public class LoyaltyCardService
    {
        #region Class Members/Class Variables

        private LoyaltyCardDAL _loyaltyCardDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public LoyaltyCardService()
        {
            _loyaltyCardDAL = new LoyaltyCardDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region LoyaltyCard
        public bool ManagementLoyaltyCard(LoyaltyCardDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.loyaltycard.ToString (), mod.ClientId, "ClientId");
                retVal = _loyaltyCardDAL.ManageLoyaltyCard(mod);              
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
        public List<LoyaltyCardDE> SearchLoyaltyCards(LoyaltyCardDE mod)
        {
            List<LoyaltyCardDE> LoyaltyCards = new List<LoyaltyCardDE>();
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
                if (mod.Name != default)
                    whereClause += $" AND Name like ''" + mod.Name + "''";
                if (mod.CardNo != default)
                    whereClause += $" AND CardNo like ''" + mod.CardNo + "''";
                if (mod.DiscountPercentage != default)
                    whereClause += $" AND DiscountPercentage like ''" + mod.DiscountPercentage + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                LoyaltyCards = _loyaltyCardDAL.SearchLoyaltyCards(whereClause);

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
            return LoyaltyCards;
        }
        #endregion
    }
}
