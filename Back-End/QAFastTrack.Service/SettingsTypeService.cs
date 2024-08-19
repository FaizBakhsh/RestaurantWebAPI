using MySql.Data.MySqlClient;
using NLog;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Intrinsics.Arm;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Service
{
    public class SettingsTypeService
    {
        #region Class Members/Class Variables

        private SettingsTypeDAL _settingsTypeDAL;
        private SettingsDAL _settingsDAL;
        private CoreDAL _corDAL;
        private Logger _logger;
        private ExtraFieldDataDAL _extraFieldDAL = new ExtraFieldDataDAL();

        #endregion
        #region Constructors
        public SettingsTypeService()
        {
            _settingsDAL = new SettingsDAL();
            _settingsTypeDAL = new SettingsTypeDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region SettingsType
        public bool ManagementSettingsType(SettingsTypeDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.enums.ToString());
                if (mod.Id == 1)
                    mod.Id = 1001;
                retVal = _settingsTypeDAL.ManageSettingsType(mod);
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
        public List<SettingsTypeDE> SearchSettingsTypes(SettingsTypeDE mod)
        {
            List<SettingsTypeDE> SettingsTypes = new List<SettingsTypeDE>();
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
                if (mod.Name != default)
                    whereClause += $" AND Name like ''" + mod.Name + "''";
                if (mod.ParentId != default && mod.ParentId != 0)
                    whereClause += $" AND ParentId={mod.ParentId}";
                if (mod.PParentId != default && mod.PParentId != 0)
                    whereClause += $" AND PParentId={mod.PParentId}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                if (mod.IsAccountLevel != default)
                    whereClause += $" AND IsAccountLevel ={mod.IsAccountLevel}";
                SettingsTypes = _settingsTypeDAL.SearchSettingsTypes(whereClause);
                foreach (var line in SettingsTypes)
                {
                    whereClause = "where 1=1";
                    line.settings = _settingsDAL.SearchSettingss(whereClause += $" AND EnumTypeId={line.Id} AND ClientId={line.ClientId} AND IsActive ={true}");
                    foreach (var item in line.settings)
                    {
                        whereClause = "where 1=1";
                        List<ExtraFieldDataDE> list = new List<ExtraFieldDataDE>();
                        list = _extraFieldDAL.SearchExtraFieldData(whereClause += $" AND EnumLineId={item.Id} AND ClientId={line.ClientId} AND IsActive ={true}");
                        if (list.Count > 0)
                            line.eLFieldsData = _extraFieldDAL.GetExtraFieldData((int)line.Id);
                    }
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
            return SettingsTypes;
        }
        public List<SettingsTypeDE> SearchEnums ( SettingsTypeDE mod )
        {
            List<SettingsTypeDE> SettingsTypes = new List<SettingsTypeDE> ();
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
                //if (mod.ModuleId != default)
                whereClause += $" AND ModuleId={mod.ModuleId}";
                if (mod.Name != default)
                    whereClause += $" AND Name like ''" + mod.Name + "''";
                if (mod.ParentId != default && mod.ParentId != 0)
                    whereClause += $" AND ParentId={mod.ParentId}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                SettingsTypes = _settingsTypeDAL.SearchSettingsTypes (whereClause);

                #endregion
                foreach (var line in SettingsTypes)
                {
                    whereClause = " Where 1=1";
                    line.settings = _settingsDAL.SearchSettingss (whereClause += $" AND EnumTypeId={line.Id} AND IsActive ={true} and ClientId={line.ClientId} and ModuleId={line.ModuleId}");
                }
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
            return SettingsTypes;
        }
        #endregion
    }

}
