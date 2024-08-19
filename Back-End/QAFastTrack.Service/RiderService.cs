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
    public class RiderService
    {
        #region Class Members/Class Variables

        private RiderDAL _riderDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public RiderService()
        {
            _riderDAL = new RiderDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region Rider
        public bool ManagementRider(RiderDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.rider.ToString());
                retVal = _riderDAL.ManageRider(mod);
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
        public List<RiderDE> SearchRiders(RiderDE mod)
        {
            List<RiderDE> Riders = new List<RiderDE>();
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
                if (mod.Name != default)
                    whereClause += $" AND Name like ''" + mod.Name + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Riders = _riderDAL.SearchRiders(whereClause);

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
            return Riders;
        }

        #endregion
    }
}
