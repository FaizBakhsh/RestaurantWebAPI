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
    public class PurchaseOrderService
    {
        #region Class Members/Class Variables

        private PurchaseOrderDAL _PurchaseOrderDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public PurchaseOrderService()
        {
            _PurchaseOrderDAL = new PurchaseOrderDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region PurchaseOrder
        public PurchaseOrderDE ManagementPurchaseOrder(PurchaseOrderDE mod)
        {
            bool retVal = false;
            int lineId = 0;
            MySqlCommand? cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                RestaurantDataContext.StartTransaction(cmd);
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.purchaseorder.ToString());
                retVal = _PurchaseOrderDAL.ManagePurchaseOrder(mod , cmd);

                if (mod.DBoperation == DBoperations.Insert || mod.DBoperation == DBoperations.Update)
                    lineId = _corDAL.GetnextLineId(TableNames.purchaseorderline.ToString(), mod.Id, "POId");
                mod.DBoperation = DBoperations.NA;
                foreach (var line in mod.POLines)
                {
                    line.POId = mod.Id;
                    if (line.DBoperation == DBoperations.Insert)
                    {
                        lineId += 1;
                        line.Id = lineId;
                    }
                    retVal = _PurchaseOrderDAL.ManagePurchaseOrderLine(line, cmd);
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
                mod.POLines = _PurchaseOrderDAL.SearchPurchaseOrderLines(whereClause += $" AND POId={mod.Id} AND IsActive ={true}");
            }
            return mod;
        }
        public List<PurchaseOrderDE> SearchPurchaseOrders(PurchaseOrderDE mod)
        {
            List<PurchaseOrderDE> PurchaseOrders = new List<PurchaseOrderDE>();
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
                PurchaseOrders = _PurchaseOrderDAL.SearchPurchaseOrders(whereClause);
                foreach (var line in PurchaseOrders)
                {
                    whereClause = "where 1=1";
                    line.POLines = _PurchaseOrderDAL.SearchPurchaseOrderLines(whereClause += $" AND POId={line.Id} AND IsActive ={true}");
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
            return PurchaseOrders;
        }
        #endregion
    }
}
