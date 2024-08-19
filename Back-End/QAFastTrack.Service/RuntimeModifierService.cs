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
    public class RuntimeModifierService
    {
        #region Class Members/Class Variables

        private RuntimeModifierDAL _RuntimeModifierDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public RuntimeModifierService()
        {
            _RuntimeModifierDAL = new RuntimeModifierDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region RuntimeModifier
        public bool ManagementRuntimeModifier(RuntimeModifierDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.runtimemodifier.ToString (), mod.ClientId, "ClientId");
                retVal = _RuntimeModifierDAL.ManageRuntimeModifier(mod);
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
        public List<RuntimeModifierDE> SearchRuntimeModifiers(RuntimeModifierDE mod)
        {
            List<RuntimeModifierDE> RuntimeModifiers = new List<RuntimeModifierDE>();
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
                if (mod.MenuItemId != default)
                    whereClause += $" AND MenuItemId={mod.MenuItemId}";
                if (mod.ModifierName != default)
                    whereClause += $" AND ModifierName like ''"+mod.ModifierName+"'' ";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                RuntimeModifiers = _RuntimeModifierDAL.SearchRuntimeModifiers(whereClause);

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
            return RuntimeModifiers;
        }
        #endregion
    }
}
