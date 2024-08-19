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
    public class DeliveryService
    {
        #region Class Members/Class Variables

        private DeliveryDAL _deliveryDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public DeliveryService()
        {
            _deliveryDAL = new DeliveryDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region Delivery
        public bool ManagementDelivery(DeliveryDE mod)
        {
            bool check = false;
            MySqlCommand cmd = null;
            try
            {

                cmd = RestaurantDataContext.OpenMySqlConnection();
                RestaurantDataContext.StartTransaction(cmd);

                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.delivery.ToString());
                    _deliveryDAL.ManageDelivery(mod);

                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _deliveryDAL.ManageDelivery(mod);

                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _deliveryDAL.AlterDelivery(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _deliveryDAL.AlterDelivery(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _deliveryDAL.AlterDelivery(mod, mod.Id);
                }
                if (check == true)
                {
                    mod.DBoperation = DBoperations.NA;
                    RestaurantDataContext.EndTransaction(cmd);

                }
                return check;
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
            }


        }
        public List<DeliveryDE> SearchDelivery(DeliveryDE mod)
        {
            List<DeliveryDE> Deliverys = new List<DeliveryDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();


                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.Name != default)
                    whereClause += $" AND Name like ''" + mod.Name + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Deliverys = _deliveryDAL.SearchDelivery(whereClause);

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
            return Deliverys;
        }

        #endregion
    }
}
