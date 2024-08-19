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
    public class MenuGroupService
    {
        #region Class Members/Class Variables

        private MenuGroupDAL _MenuGroupDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public MenuGroupService ( )
        {
            _MenuGroupDAL = new MenuGroupDAL ();
            _corDAL = new CoreDAL ();
            _logger = LogManager.GetLogger ("fileLogger");
        }
        #endregion
        #region MenuGroup
        public bool ManageMenuGroup ( MenuGroupDE mod )
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection ();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.menugroup.ToString (), mod.ClientId, "ClientId");
                retVal = _MenuGroupDAL.ManageMenuGroup (mod);
                if (retVal == true)
                    mod.DBoperation = DBoperations.NA;
                return retVal;
            }
            catch (Exception ex)
            {
                _logger.Error (ex);
                throw;
            }
            finally
            {
                if (cmd != null)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
        }
        public List<MenuGroupDE> SearchMenuGroups ( MenuGroupDE mod )
        {
            List<MenuGroupDE> MenuGroups = new List<MenuGroupDE> ();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection ();
                closeConnectionFlag = true;

                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.ClientId != default)
                    whereClause += $" AND ClientId={mod.ClientId}";
                if (mod.Name != default)
                    whereClause += $" AND Name like ''" + mod.Name + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                MenuGroups = _MenuGroupDAL.SearchMenuGroups (whereClause);

                #endregion

            }
            catch (Exception exp)
            {
                _logger.Error (exp);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
            return MenuGroups;
        }
        #endregion
    }
}
