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
    public class TableService
    {
        #region Class Members/Class Variables

        private TableDAL _tableDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public TableService()
        {
            _tableDAL = new TableDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region Table
        public bool ManagementTable(TableDE mod)
        {
            bool check = false;
            MySqlCommand cmd = null;
            try
            {

                cmd = RestaurantDataContext.OpenMySqlConnection();
                RestaurantDataContext.StartTransaction(cmd);

                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.restauranttable.ToString());
                    _tableDAL.ManageTable(mod);

                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _tableDAL.ManageTable(mod);

                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _tableDAL.AlterTable(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _tableDAL.AlterTable(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _tableDAL.AlterTable(mod, mod.Id);
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
        public List<TableDE> SearchTables(TableDE mod)
        {
            List<TableDE> Tables = new List<TableDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();


                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.FloorId != default)
                    whereClause += $" AND FloorId={mod.FloorId}";
                if (mod.Name != default)
                    whereClause += $" AND Name like ''" + mod.Name + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Tables = _tableDAL.SearchTables(whereClause);

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
            return Tables;
        }

        #endregion
    }
}
