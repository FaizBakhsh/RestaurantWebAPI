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
    public class FloorService
    {
        #region Class Members/Class Variables

        private FloorDAL _floorDAL;
        private TableDAL _tableDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public FloorService()
        {
            _floorDAL = new FloorDAL();
            _tableDAL = new TableDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region Floor
        public bool ManagementFloor(FloorDE mod)
        {
            bool check = false;
            MySqlCommand cmd = null;
            try
            {

                cmd = RestaurantDataContext.OpenMySqlConnection();
                RestaurantDataContext.StartTransaction(cmd);

                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.floor.ToString());
                    _floorDAL.ManageFloor(mod);
                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _floorDAL.ManageFloor(mod);
                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _floorDAL.AlterFloor(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _floorDAL.AlterFloor(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _floorDAL.AlterFloor(mod, mod.Id);
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
        public List<FloorDE> SearchFloors(FloorDE mod)
        {
            List<FloorDE> Floor = new List<FloorDE>();
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
                Floor = _floorDAL.SearchFloors(whereClause);
                foreach (var line in Floor)
                {
                    whereClause = "where 1=1";
                    line.Tables = _tableDAL.SearchTables(whereClause += $" AND FloorId={line.Id} AND IsActive ={true}");
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
            return Floor;
        }
        #endregion
    }
}
