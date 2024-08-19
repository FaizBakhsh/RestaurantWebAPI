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
    public class SaleDetailRefundService
    {
        #region Data Members

        private SaleDetailRefundDAL _sdrDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public SaleDetailRefundService ( )
        {
            _sdrDAL = new SaleDetailRefundDAL ();
            _corDAL = new CoreDAL ();
            _logger = LogManager.GetLogger ("fileLogger");
        }
        #endregion
        #region SaleDetailRefund
        public SaleDetailRefundDE ManagementSaleDetailRefund ( SaleDetailRefundDE mod, MySqlCommand? cmd )
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
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.saledetailrefund.ToString (), mod.ClientId, "ClientId");
                retVal = _sdrDAL.ManageSaleDetailRefund (mod,cmd);

                if (retVal == true)
                    mod.DBoperation = DBoperations.NA;
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
            return mod;
        }
        public List<SaleDetailRefundDE> SearchSaleDetailRefunds ( SaleDetailRefundDE mod )
        {
            List<SaleDetailRefundDE> so = new List<SaleDetailRefundDE> ();
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
                if (mod.TypeId != default)
                    whereClause += $" AND TypeId={mod.TypeId}";
                if (mod.SaleOrderId != default)
                    whereClause += $" AND SaleOrderId={mod.SaleOrderId}";
                if (mod.From.HasValue && mod.From.Value > AppConstants.DEFAULT_DATE)
                    whereClause += $" AND SaleDate >= ''{mod.From.Value:yyyy-MM-dd} 00:00:00''";
                if (mod.To.HasValue && mod.To.Value > AppConstants.DEFAULT_DATE)
                    whereClause += $" AND SaleDate <= ''{mod.To.Value:yyyy-MM-dd} 23:59:59''";
                if (mod.Date != default && mod.Date > AppConstants.DEFAULT_DATE)
                    whereClause += $" AND Date(SaleDate) = ''{mod.Date:yyyy-MM-dd} 00:00:00''";
                so = _sdrDAL.SearchSaleDetailRefunds (whereClause);
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
            return so;
        }
        #endregion
    }
}
