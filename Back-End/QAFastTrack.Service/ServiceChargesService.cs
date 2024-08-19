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
    public class ServiceChargesService
    {

        #region Class Members/Class Variables

        private ServiceChargesDAL _ServiceChargesDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public ServiceChargesService()
        {
            _ServiceChargesDAL = new ServiceChargesDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region ServiceCharges
        public bool ManagementServiceCharges(ServiceChargesDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.servicecharges.ToString (), mod.ClientId, "ClientId");
                retVal = _ServiceChargesDAL.ManageServiceCharges(mod);
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
        public List<ServiceChargesDE> SearchServiceChargess(ServiceChargesDE mod)
        {
            List<ServiceChargesDE> ServiceChargess = new List<ServiceChargesDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.ClientId != default)
                    whereClause += $" AND ClientId={mod.ClientId}";
                if (mod.OrderTypeId != default && mod.OrderTypeId!=0)
                    whereClause += $" AND OrderTypeId={mod.OrderTypeId}";
                if (mod.PaymentTypeId != default && mod.PaymentTypeId != 0)
                    whereClause += $" AND PaymentTypeId={mod.PaymentTypeId}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                ServiceChargess = _ServiceChargesDAL.SearchServiceChargess(whereClause);

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
            return ServiceChargess;
        }
        #endregion
    }
}
