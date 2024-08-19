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
    public class PurchaseReturnService
    {
        #region Class Members/Class Variables

        private PurchaseReturnDAL _purchaseReturnDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public PurchaseReturnService()
        {
            _purchaseReturnDAL = new PurchaseReturnDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region PurchaseReturn
        public PurchaseReturnDE ManagementPurchaseReturn(PurchaseReturnDE mod)
        {
            bool retVal = false;
            int lineId = 0;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                RestaurantDataContext.StartTransaction(cmd);

                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.purchasereturn.ToString());
                retVal = _purchaseReturnDAL.ManagePurchaseReturn(mod, cmd);

                if (mod.DBoperation == DBoperations.Insert || mod.DBoperation == DBoperations.Update)
                    lineId = _corDAL.GetnextLineId(TableNames.purchasereturnline.ToString(), mod.Id, "PRId");
                foreach (var line in mod.PRLines)
                {
                    line.PRId = mod.Id;
                    if (line.DBoperation == DBoperations.Insert)
                    {
                        lineId += 1;
                        line.Id = lineId;
                    }
                    retVal = _purchaseReturnDAL.ManagePurchaseReturnLine(line, cmd);
                }
                if (retVal == true)

                    mod.DBoperation = DBoperations.NA;
                RestaurantDataContext.EndTransaction(cmd);
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
                string whereClause = " Where 1=1";
                mod.PRLines = _purchaseReturnDAL.SearchPurchaseReturnLines(whereClause += $" AND PRId={mod.Id} AND IsActive ={true}");
            }
            return mod;
        }
        public List<PurchaseReturnDE> SearchPurchaseReturns(PurchaseReturnDE mod)
        {
            List<PurchaseReturnDE> PurchaseReturns = new List<PurchaseReturnDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();

                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                PurchaseReturns = _purchaseReturnDAL.SearchPurchaseReturns(whereClause);
                foreach (var line in PurchaseReturns)
                {
                    whereClause = "where 1=1";
                    line.PRLines = _purchaseReturnDAL.SearchPurchaseReturnLines(whereClause += $" AND PRId={line.Id} AND IsActive ={true}");
                }
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
            return PurchaseReturns;
        }
        #endregion
    }
}
