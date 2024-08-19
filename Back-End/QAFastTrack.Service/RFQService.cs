using Microsoft.EntityFrameworkCore;
using MySql.Data.MySqlClient;
using NLog;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.DAL;
using static Dapper.SqlMapper;

namespace Restaurant.Service
{
    public class RFQService
    {
        #region Class Members/Class Variables

        private RFQDAL _RFQDAL;
        private CoreDAL _corDAL;
        private Logger _logger;
        private string _entity;

        #endregion
        #region Constructors
        public RFQService()
        {
            _RFQDAL = new RFQDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region RFQ
        public RFQDE ManagementRFQ(RFQDE mod)
        {
            bool retVal = false;
            int lineId = 0;
            MySqlCommand cmd = null;
            try
            {
                _entity = TableNames.INV_RFQ.ToString();
                cmd = RestaurantDataContext.OpenMySqlConnection();
                RestaurantDataContext.StartTransaction(cmd);

                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient(_entity, mod.ClientId, "ClientId");
                retVal = _RFQDAL.INV_Manage_RFQ(mod, cmd);

                if (mod.DBoperation == DBoperations.Insert || mod.DBoperation == DBoperations.Update)
                    lineId = _corDAL.GetnextLineId(TableNames.INV_RFQline.ToString(), mod.Id, "rFQId");
                foreach (var line in mod.RFQLines)
                {
                    line.RFQId = mod.Id;
                    line.ClientId = mod.ClientId;
                    if (line.DBoperation == DBoperations.Insert)
                    {
                        lineId += 1;
                        line.Id = lineId;
                    }
                    retVal = _RFQDAL.INV_Manage_RFQLine(line, cmd);
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
                mod.RFQLines = _RFQDAL.INV_Search_RFQLine(whereClause += $" AND line.RFQId={mod.Id}  AND line.ClientId = {mod.ClientId} AND line.IsActive ={true}");
            }
            return mod;
        }
        public List<RFQDE> SearchRFQs(RFQDE mod)
        {
            List<RFQDE> RFQs = new List<RFQDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();

                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND rfq.Id={mod.Id}";
                if (mod.ClientId != default)
                    whereClause += $" AND rfq.ClientId={mod.ClientId}";
                if (mod.IsActive != default)
                    whereClause += $" AND rfq.IsActive ={mod.IsActive}";
                RFQs = _RFQDAL.INV_Search_RFQ (whereClause);
                foreach (var rfq in RFQs)
                {
                    whereClause = "where 1=1";
                    rfq.RFQLines = _RFQDAL.INV_Search_RFQLine(whereClause += $" AND line.RFQId={rfq.Id}  AND line.ClientId = {mod.ClientId} AND line.IsActive ={true}");
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
            return RFQs;
        }
        #endregion
    }
}
