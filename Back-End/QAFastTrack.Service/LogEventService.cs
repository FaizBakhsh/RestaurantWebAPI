using MySql.Data.MySqlClient;
using NLog;
using Restaurant.Core.Constants;
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
    public class LogEventService
    {
        #region Class Members/Class Variables

        private LogEventDAL _LogEventDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public LogEventService ( )
        {
            _LogEventDAL = new LogEventDAL ();
            _corDAL = new CoreDAL ();
            _logger = LogManager.GetLogger ("fileLogger");
        }
        #endregion
        #region LogEvent
        public bool ManagementLogEvent ( LogEventDE mod, MySqlCommand? cmd )
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection ();
                    closeConnectionFlag = true;
                }
                bool retVal = false;
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.logevent.ToString (), mod.ClientId, "ClientId");
                retVal = _LogEventDAL.ManageLogEvent (mod,cmd);
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
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
        }
        public List<LogEventDE> SearchLogEvents ( LogEventDE mod )
        {
            List<LogEventDE> LogEvents = new List<LogEventDE> ();
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
                if (mod.UserId != default && mod.UserId!="")
                    whereClause += $" AND UserId like ''" + mod.UserId + "''";
                if (mod.ActionId != default)
                    whereClause += $" AND ActionId={mod.ActionId}";
                if (mod.User != default)
                    whereClause += $" AND User like ''" + mod.User + "''";
                if (mod.From.HasValue && mod.From.Value > AppConstants.DEFAULT_DATE)
                    whereClause += $" AND Date >= ''{mod.From.Value:yyyy-MM-dd} 00:00:00''";
                if (mod.To.HasValue && mod.To.Value > AppConstants.DEFAULT_DATE)
                    whereClause += $" AND Date <= ''{mod.To.Value:yyyy-MM-dd} 23:59:59''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                LogEvents = _LogEventDAL.SearchLogEvents (whereClause);

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
            return LogEvents;
        }
        #endregion
    }
}
