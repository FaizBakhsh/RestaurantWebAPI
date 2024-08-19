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
    public class GSTService
    {
        #region Class Members/Class Variables

        private GSTDAL _gstDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public GSTService()
        {
            _gstDAL = new GSTDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region GST
        public bool ManagementGST(GSTDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.gst.ToString (), mod.ClientId, "ClientId");
                retVal = _gstDAL.ManageGST(mod);
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
        public List<GSTDE> SearchGSTs(GSTDE mod)
        {
            List<GSTDE> GSTs = new List<GSTDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.ClientId != default)
                    whereClause += $" AND ClientId={mod.ClientId}";
                if (mod.PaymentTypeId != default && mod.PaymentTypeId!=0)
                    whereClause += $" AND PaymentTypeId={mod.PaymentTypeId}";
                if (mod.PaymentType != default)
                    whereClause += $" AND PaymentType like ''" + mod.PaymentType + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                GSTs = _gstDAL.SearchGSTs(whereClause);

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
            return GSTs;
        }
        #endregion
    }
}
