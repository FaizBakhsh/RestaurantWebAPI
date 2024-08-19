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
    public class TakeAwayService
    {
        #region Class Members/Class Variables

        private TakeAwayDAL _takeAwayDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public TakeAwayService()
        {
            _takeAwayDAL = new TakeAwayDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region TakeAway
        public bool ManagementTakeAway(TakeAwayDE mod)
        {
            bool check = false;
            MySqlCommand cmd = null;
            try
            {

                cmd = RestaurantDataContext.OpenMySqlConnection();
                RestaurantDataContext.StartTransaction(cmd);

                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.takeaway.ToString());
                    _takeAwayDAL.ManageTakeAway(mod);

                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _takeAwayDAL.ManageTakeAway(mod);

                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _takeAwayDAL.AlterTakeAway(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _takeAwayDAL.AlterTakeAway(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _takeAwayDAL.AlterTakeAway(mod, mod.Id);
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
        public List<TakeAwayDE> SearchTakeAway(TakeAwayDE mod)
        {
            List<TakeAwayDE> TakeAways = new List<TakeAwayDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();


                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.CustomerId != default)
                    whereClause += $" AND CustomerId={mod.CustomerId}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                TakeAways = _takeAwayDAL.SearchTakeAways(whereClause);

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
            return TakeAways;
        }

        #endregion
    }
}
