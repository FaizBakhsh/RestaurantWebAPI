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
    public class PurchaseItemsService
    {
        #region Class Members/Class Variables

        private PurchaseItemsDAL _PurchaseItemsDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public PurchaseItemsService()
        {
            _PurchaseItemsDAL = new PurchaseItemsDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region PurchaseItems
        public PurchaseItemsDE ManagementPurchaseItems(PurchaseItemsDE mod)
        {
            bool retVal = false;
            int lineId = 0;
            MySqlCommand? cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                RestaurantDataContext.StartTransaction(cmd);
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.purchaseitems.ToString());
                retVal = _PurchaseItemsDAL.ManagePurchaseItems(mod, cmd);

                if (mod.DBoperation == DBoperations.Insert || mod.DBoperation == DBoperations.Update)
                    lineId = _corDAL.GetnextLineId(TableNames.purchaseitemsline.ToString(), mod.Id, "PIId");
                mod.DBoperation = DBoperations.NA;
                foreach (var line in mod.PILines)
                {
                    line.PIId = mod.Id;
                    if (line.DBoperation == DBoperations.Insert)
                    {
                        lineId += 1;
                        line.Id = lineId;
                    }
                    retVal = _PurchaseItemsDAL.ManagePurchaseItemsLine(line, cmd);
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
                mod.PILines = _PurchaseItemsDAL.SearchPurchaseItemsLine(whereClause += $" AND PIId={mod.Id} AND IsActive ={true}");
            }
            return mod;
        }
        public List<PurchaseItemsDE> SearchPurchaseItems(PurchaseItemsDE mod)
        {
            List<PurchaseItemsDE> PurchaseItems = new List<PurchaseItemsDE>();
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();

                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                PurchaseItems = _PurchaseItemsDAL.SearchPurchaseItems(whereClause);
                foreach (var line in PurchaseItems)
                {
                    whereClause = "where 1=1";
                    line.PILines = _PurchaseItemsDAL.SearchPurchaseItemsLine(whereClause += $" AND PIId={line.Id} AND IsActive ={true}");
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
            return PurchaseItems;
        }
        #endregion
    }
}
