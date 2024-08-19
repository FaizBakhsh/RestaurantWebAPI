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
using static Dapper.SqlMapper;

namespace Restaurant.Service
{
    public class RNService
    {
        #region Class Members/Class Variables

        private RNDAL _RNDAL;
        private CoreDAL _corDAL;
        private Logger _logger;
        private string _entity;

        #endregion
        #region Constructors
        public RNService()
        {
            _RNDAL = new RNDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region RN
        public RNDE ManagementRN(RNDE mod)
        {
            bool retVal = false;
            int lineId = 0;
            MySqlCommand cmd = null;
            try
            {
                _entity = TableNames.INV_RN.ToString();
                cmd = RestaurantDataContext.OpenMySqlConnection();
                RestaurantDataContext.StartTransaction(cmd);

                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient(_entity, mod.ClientId, "ClientId");
                retVal = _RNDAL.INV_Manage_RN(mod, cmd);

                if (mod.DBoperation == DBoperations.Insert || mod.DBoperation == DBoperations.Update)
                    lineId = _corDAL.GetnextLineId(TableNames.INV_RNline.ToString(), mod.Id, "RNId");
                foreach (var line in mod.RNLines)
                {
                    line.RNId = mod.Id;
                    line.ClientId = mod.ClientId;
                    if (line.DBoperation == DBoperations.Insert)
                    {
                        lineId += 1;
                        line.Id = lineId;
                    }
                    retVal = _RNDAL.INV_Manage_RNLine(line, cmd);
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
                mod.RNLines = _RNDAL.INV_Search_RNLine(whereClause += $" AND line.RNId={mod.Id}  AND line.ClientId = {mod.ClientId} AND line.IsActive ={true}");
            }
            return mod;
        }
        public List<RNDE> SearchRNs(RNDE mod)
        {
            List<RNDE> RNs = new List<RNDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();

                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND rn.Id={mod.Id}";
                if (mod.ClientId != default)
                    whereClause += $" AND rn.ClientId={mod.ClientId}";
                if (mod.IsActive != default)
                    whereClause += $" AND rn.IsActive ={mod.IsActive}";
                RNs = _RNDAL.INV_Search_RN (whereClause);
                foreach (var rn in RNs)
                {
                    whereClause = "where 1=1";
                    rn.RNLines = _RNDAL.INV_Search_RNLine(whereClause += $" AND line.RNId={rn.Id}  AND line.ClientId = {mod.ClientId} AND line.IsActive ={true}");
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
            return RNs;
        }
        #endregion
    }
}
