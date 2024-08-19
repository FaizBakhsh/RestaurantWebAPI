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
    public class SaleDayService
    {
        #region Class Members/Class Variables

        private SaleDayDAL _SaleDayDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public SaleDayService ( )
        {
            _SaleDayDAL = new SaleDayDAL ();
            _corDAL = new CoreDAL ();
            _logger = LogManager.GetLogger ("fileLogger");
        }
        #endregion
        #region SaleDay
        public SaleDayDE ManagementSaleDay ( SaleDayDE mod )
        {
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection ();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.saleday.ToString (), mod.ClientId, "ClientId");
                _SaleDayDAL.ManageSaleDay (mod);
               var  retVal=SearchSaleDays(new SaleDayDE { Id=mod.Id }).FirstOrDefault();
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
        public List<SaleDayDE> SearchSaleDays ( SaleDayDE mod )
        {
            List<SaleDayDE> SaleDays = new List<SaleDayDE> ();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection ();
                closeConnectionFlag = true;
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.ClientId != default)
                    whereClause += $" AND ClientId={mod.ClientId}";
                if (mod.TerminalId != default)
                    whereClause += $" AND TerminalId={mod.TerminalId}";
                if (mod.DayStatusId != default)
                    whereClause += $" AND DayStatusId={mod.DayStatusId}";
                if (mod.Terminal != default)
                    whereClause += $" AND Terminal like ''" + mod.Terminal + "''";
                if (mod.Date != default)
                    whereClause += $" and Date(Date) like ''" + mod.Date.ToString ("yyyy-MM-dd") + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                SaleDays = _SaleDayDAL.SearchSaleDays (whereClause);

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
            return SaleDays;
        }

        #endregion
    }
}
