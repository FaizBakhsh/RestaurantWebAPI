using Microsoft.Extensions.Logging;
using MySql.Data.MySqlClient;
using NLog;
using Restaurant.Core.Constants;
using Restaurant.Core.Entities;
using Restaurant.Core.Entities.Enums;
using Restaurant.Core.Entities.Reports;
using Restaurant.Core.Enums;
using Restaurant.DAL;
using Restaurant.Services;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Service
{
    public class ShiftService
    {
        #region Class Members/Class Variables

        private SaleDetailRefundService _saleRefundSvc;
        private ExpensesService _expSvc;
        private SaleOrderService _sOrderSvc;
        private ShiftDAL _shiftDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public ShiftService ( )
        {
            _shiftDAL = new ShiftDAL ();
            _corDAL = new CoreDAL ();
            _expSvc = new ExpensesService ();
            _sOrderSvc = new SaleOrderService ();
            _saleRefundSvc = new SaleDetailRefundService ();
            _logger = LogManager.GetLogger ("fileLogger");
        }
        #endregion
        #region Shift
        public ShiftDE ManagementShift ( ShiftDE mod )
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection ();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.shift.ToString (), mod.ClientId, "ClientId");
                retVal = _shiftDAL.ManageShift (mod);
                if (retVal == true)
                    mod.DBoperation = DBoperations.NA;
                return mod;
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
        public List<ShiftDE> SearchShifts ( ShiftDE mod )
        {
            List<ShiftDE> Shifts = new List<ShiftDE> ();
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
                if (mod.ShiftTypeId != default)
                    whereClause += $" AND ShiftTypeId={mod.ShiftTypeId}";
                if (mod.ClientId != default)
                    whereClause += $" AND ClientId={mod.ClientId}";
                if (mod.DayId != default)
                    whereClause += $" AND DayId={mod.DayId}";
                if (mod.SaleDate != default)
                    whereClause += $" AND Date(SaleDate) like ''" + mod.SaleDate.ToString ("yyyy-MM-dd") + "''";
                if (mod.TerminalId != default)
                    whereClause += $" AND TerminalId={mod.TerminalId}";
                if (mod.Terminal != default)
                    whereClause += $" AND Terminal like ''" + mod.Terminal + "''";
                if (mod.ShiftStatusId != default)
                    whereClause += $" AND ShiftStatusId={mod.ShiftStatusId}";
                if (mod.ShiftStatus != default)
                    whereClause += $" AND ShiftStatus like ''" + mod.ShiftStatus + "''";
                if (mod.FloatingCash != default)
                    whereClause += $" AND FloatingCash like ''" + mod.FloatingCash + "''";
                if (mod.ShiftStartUserId != default)
                    whereClause += $" AND ShiftStartUserId like ''" + mod.ShiftStartUserId + "''";
                if (mod.ShiftEndUser != default)
                    whereClause += $" AND ShiftStartUser like ''" + mod.ShiftStartUser + "''";
                if (mod.ShiftEndUserId != default)
                    whereClause += $" AND ShiftEndUserId like ''" + mod.ShiftEndUserId + "''";
                if (mod.ShiftEndUser != default)
                    whereClause += $" AND ShiftEndUser like ''" + mod.ShiftEndUser + "''";
                if (mod.StartTime != default)
                    whereClause += $" AND StartTime like ''" + mod.StartTime + "''";
                if (mod.ShiftEndCash != default)
                    whereClause += $" AND ShiftEndCash like ''" + mod.ShiftEndCash + "''";
                if (mod.ShiftType != default)
                    whereClause += $" AND ShiftType like ''" + mod.ShiftType + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                if (mod.From.HasValue && mod.From.Value > AppConstants.DEFAULT_DATE)
                    whereClause += $" AND SaleDate >= ''{mod.From.Value:yyyy-MM-dd} 00:00:00''";
                if (mod.To.HasValue && mod.To.Value > AppConstants.DEFAULT_DATE)
                    whereClause += $" AND SaleDate <= ''{mod.To.Value:yyyy-MM-dd} 23:59:59''";
                if (mod.Date != default && mod.Date > AppConstants.DEFAULT_DATE)
                    whereClause += $" AND Date(SaleDate) = ''{mod.Date:yyyy-MM-dd} 00:00:00''";
                Shifts = _shiftDAL.SearchShifts (whereClause);

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
            return Shifts;
        }

        #endregion
    }
}
