using MySql.Data.MySqlClient;
using Nancy.Json;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using NLog;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.DAL;
using Restaurant.Service.IServices;
using Restaurant.Services;
using Restaurant.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Service
{
    public class SettingsService
    {
        #region Class Members/Class Variables

        private SettingsDAL _coaDAL;
        private CoreDAL _corDAL;
        private SettingsDE _searchStng;
        private Logger _logger;
        private ExtraFieldDataDAL _extraFieldDAL;
        private readonly IPermissionService _permSvc;

        #endregion
        #region Constructors
        public SettingsService ( IPermissionService permSvc = null )
        {
            _extraFieldDAL = new ExtraFieldDataDAL ();
            _searchStng = new SettingsDE ();
            _coaDAL = new SettingsDAL ();
            _permSvc= permSvc;
            _corDAL = new CoreDAL ();
            _logger = LogManager.GetLogger ("fileLogger");
        }
        #endregion
        #region Settings
        public bool ManagementSettings ( SettingsDE mod )
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection ();
                RestaurantDataContext.StartTransaction (cmd);
                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetNextLineIdByClt (TableNames.enumline.ToString (), "EnumTypeId", (int)mod.EnumTypeId, mod.ClientId); 
                    if (mod.Id == 1)
                        mod.Id = int.Parse (mod.EnumTypeId + "001");
                    //else
                    //    mod.Id += 1;
                }
                if (mod.DBoperation == DBoperations.Update)
                {
                    List<SettingsDE> List = _coaDAL.SearchSettingss ($"where Id={mod.Id} and EnumTypeId={mod.EnumTypeId} and ClientId={mod.ClientId}");
                    if (List.Count > 0)
                    {
                        _searchStng = List.First ();
                        if (mod.KeyCode != _searchStng.KeyCode)
                        {
                            List<SettingsDE> _list = _coaDAL.SearchSettingss ($"where  EnumTypeId={mod.EnumTypeId} and ClientId={mod.ClientId} AND AccountCode  like ''%" + _searchStng.AccountCode + "%''");
                            if (mod.LevelId == (int)AccountLevels.Level1)
                            {
                                List<SettingsDE> accountUseLevel1 = _list.FindAll (x => _searchStng.KeyCode ==
                                x.AccountCode?.Substring (0, 2));
                                foreach (var account in accountUseLevel1)
                                {
                                    account.DBoperation = DBoperations.Update;
                                    account.AccountCode = account.AccountCode?.Remove (0, 2).Insert (0, mod.KeyCode);
                                    _coaDAL.ManageSettings (account, cmd);
                                }
                            }
                            else if (mod.LevelId == (int)AccountLevels.Level2)
                            {
                                List<SettingsDE> accountUseLevel1 = _list.FindAll (x => _searchStng.KeyCode ==
                                x.AccountCode?.Substring (3, 2));
                                foreach (var account in accountUseLevel1)
                                {
                                    account.DBoperation = DBoperations.Update;
                                    account.AccountCode = account.AccountCode?.Remove (3, 2).Insert (3, mod.KeyCode);
                                    _coaDAL.ManageSettings (account, cmd);
                                }
                            }
                            else if (mod.LevelId == (int)AccountLevels.Level3)
                            {
                                List<SettingsDE> accountUseLevel1 = _list.FindAll (x => _searchStng.KeyCode ==
                                x.AccountCode?.Substring (6, 2));
                                foreach (var account in accountUseLevel1)
                                {
                                    account.DBoperation = DBoperations.Update;
                                    account.AccountCode = account.AccountCode?.Remove (6, 2).Insert (6, mod.KeyCode);
                                    _coaDAL.ManageSettings (account,cmd);
                                }
                            }
                            else if (mod.LevelId == (int)AccountLevels.Level4)
                            {
                                List<SettingsDE> accountUseLevel1 = _list.FindAll (x => _searchStng.KeyCode ==
                                x.AccountCode?.Substring (9, 3));
                                foreach (var account in accountUseLevel1)
                                {
                                    account.DBoperation = DBoperations.Update;
                                    account.AccountCode = account.AccountCode?.Remove (9, 3).Insert (9, mod.KeyCode);
                                    _coaDAL.ManageSettings (account, cmd);
                                }
                            }
                            else if (mod.LevelId == (int)AccountLevels.Level5)
                            {
                                List<SettingsDE> accountUseLevel1 = _list.FindAll (x => _searchStng.KeyCode ==
                                x.AccountCode?.Substring (13, 4));
                                foreach (var account in accountUseLevel1)
                                {
                                    account.DBoperation = DBoperations.Update;
                                    account.AccountCode = account.AccountCode?.Remove (13, 4).Insert (13, mod.KeyCode);
                                    _coaDAL.ManageSettings (account, cmd);
                                }
                            }
                        }
                    }
                }
                retVal = _coaDAL.ManageSettings (mod, cmd);
                if (mod.DBoperation == DBoperations.Insert || mod.DBoperation == DBoperations.Update)
                    foreach (var line in mod.eLFData)
                    {
                        line.EnumLineId = (int)mod.Id;
                        line.ClientId = mod.ClientId;
                        _extraFieldDAL.ManageExtraFieldData (line, cmd);
                    }
                if (retVal == true)
                    mod.DBoperation = DBoperations.NA;
                RestaurantDataContext.EndTransaction (cmd);
                return retVal;
            }
            catch (Exception ex)
            {
                _logger.Error (ex);
                RestaurantDataContext.CancelTransaction (cmd);
                throw;
            }
            finally
            {
                if (cmd != null)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
        }
        public List<SettingsDE> SearchSettingss ( SettingsDE mod )
        {
            List<SettingsDE> Settingss = new List<SettingsDE> ();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection ();
                closeConnectionFlag = true;
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default && mod.Id != 0)
                    whereClause += $" AND Id={mod.Id}";
                //if (mod.ClientId != default )
                whereClause += $" AND ClientId={mod.ClientId}";
                //if (mod.ModuleId != default && mod.ModuleId != 0)
                whereClause += $" AND ModuleId={mod.ModuleId}";
                if (mod.TypeModuleId != default && mod.TypeModuleId != 0)
                    whereClause += $" AND TypeModuleId={mod.TypeModuleId}";
                if (mod.TypeParentId != default && mod.TypeParentId != 0)
                    whereClause += $" AND TypeParentId={mod.TypeParentId}";
                if (mod.LevelId != default && mod.LevelId != 0)
                    whereClause += $" AND LevelId={mod.LevelId}";
                if (mod.Name != default && mod.Name != "")
                    whereClause += $" AND Name like ''" + mod.Name + "''";
                if (mod.Value != default && mod.Value != "")
                    whereClause += $" AND Value like ''" + mod.Value + "''";
                if (mod.Level != default && mod.Level != "")
                    whereClause += $" AND Level like ''" + mod.Level + "''";
                if (mod.ParentName != default && mod.ParentName != "")
                    whereClause += $" AND ParentName like ''" + mod.ParentName + "''";
                if (mod.AccountCode != default && mod.AccountCode != "")
                    whereClause += $" AND AccountCode  like ''" + mod.AccountCode + "''";
                if (mod.KeyCode != default && mod.KeyCode != "")
                    whereClause += $" AND KeyCode like ''" + mod.KeyCode + "''";
                if (mod.TypeKeyCode != default && mod.Name != "")
                    whereClause += $" AND TypeKeyCode like ''" + mod.TypeKeyCode + "''";
                if (mod.ParentId != default && mod.ParentId != 0)
                    whereClause += $" AND ParentId={mod.ParentId}";
                if (mod.EnumTypeId != default && mod.EnumTypeId != 0)
                    whereClause += $" AND EnumTypeId={mod.EnumTypeId}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Settingss = _coaDAL.SearchSettingss (whereClause);
                foreach (var line in Settingss)
                {
                    whereClause = "where 1=1";
                    line.eLFData = _extraFieldDAL.SearchExtraFieldData (whereClause += $" AND EnumLineId={line.Id} AND IsActive ={true}");
                    //    var pivotArray = line.eLFData.ToPivotArray(
                    // item => item.FieldName,
                    //item => item.FieldValue,
                    //items => items.Any() ? items.Sum(x => x.EnumLineId) : 0);
                    //    line.ExtraFieldsData = pivotArray;
                    //    Console.WriteLine(pivotArray);
                    //    String json = JsonConvert.SerializeObject(pivotArray, new KeyValuePairConverter());
                    //    Console.WriteLine(json);
                    if (line.eLFData.Count > 0)
                    {
                        foreach (var field in line.eLFData)
                        {
                            line.d.Add (new KeyValuePair<string, string> (field.FieldName, field.FieldValue));
                        }
                        var b = new Object ();

                        line.ExtraFieldsData = line.d;
                    }
                }
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
            return Settingss;
        }
        public List<SettingsDE> SearchEnumLine ( SettingsDE mod )
        {
            List<SettingsDE> Settingss = new List<SettingsDE> ();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection ();
                closeConnectionFlag = true;
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default && mod.Id != 0)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.ClientId != default)
                    whereClause += $" AND ClientId={mod.ClientId}";
                if (mod.ModuleId != default && mod.ModuleId != 0)
                    whereClause += $" AND ModuleId={mod.ModuleId}";
                if (mod.TypeModuleId != default && mod.TypeModuleId != 0)
                    whereClause += $" AND TypeModuleId={mod.TypeModuleId}";
                if (mod.Name != default && mod.Name != "")
                    whereClause += $" AND Name like ''" + mod.Name + "''";
                if (mod.Level != default && mod.Level != "")
                    whereClause += $" AND Level like ''" + mod.Level + "''";
                if (mod.ParentName != default && mod.ParentName != "")
                    whereClause += $" AND ParentName like ''" + mod.ParentName + "''";
                if (mod.AccountCode != default && mod.AccountCode != "")
                    whereClause += $" AND AccountCode  like ''" + mod.AccountCode + "''";
                if (mod.KeyCode != default && mod.KeyCode != "")
                    whereClause += $" AND KeyCode like ''" + mod.KeyCode + "''";
                if (mod.TypeKeyCode != default && mod.Name != "")
                    whereClause += $" AND TypeKeyCode like ''" + mod.TypeKeyCode + "''";
                if (mod.ParentId != default && mod.ParentId != 0)
                    whereClause += $" AND ParentId={mod.ParentId}";
                if (mod.LevelId != default && mod.LevelId != 0)
                    whereClause += $" AND LevelId={mod.LevelId}";
                if (mod.EnumTypeId != default && mod.EnumTypeId != 0)
                    whereClause += $" AND EnumTypeId={mod.EnumTypeId}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Settingss = _coaDAL.SearchSettingss (whereClause);

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
            return Settingss;
        }
        public List<SettingsDE> SearchAccounts ( SettingsDE mod )
        {
            List<SettingsDE> Settingss = new List<SettingsDE> ();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection ();
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default && mod.Id != 0)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.ClientId != default && mod.ClientId != 0)
                    whereClause += $" AND ClientId={mod.ClientId}";
                if (mod.TypeParentId != default && mod.TypeParentId != 0)
                    whereClause += $" AND TypeParentId={mod.TypeParentId}";
                if (mod.LevelId != default && mod.LevelId != 0)
                    whereClause += $" AND LevelId={mod.LevelId}";
                if (mod.Name != default && mod.Name != "")
                    whereClause += $" AND Name like ''%" + mod.Name + "%''";
                if (mod.Value != default && mod.Value != "")
                    whereClause += $" AND Value like ''%" + mod.Value + "%''";
                if (mod.Level != default && mod.Level != "")
                    whereClause += $" AND Level like ''%" + mod.Level + "%''";
                if (mod.ParentName != default && mod.ParentName != "")
                    whereClause += $" AND ParentName like ''%" + mod.ParentName + "%''";
                if (mod.AccountCode != default && mod.AccountCode != "")
                    whereClause += $" AND AccountCode  like ''%" + mod.AccountCode + "%''";
                if (mod.KeyCode != default && mod.KeyCode != "")
                    whereClause += $" AND KeyCode like ''%" + mod.KeyCode + "%''";
                if (mod.TypeKeyCode != default && mod.Name != "")
                    whereClause += $" AND TypeKeyCode like ''" + mod.TypeKeyCode + "''";
                if (mod.ParentId != default && mod.ParentId != 0)
                    whereClause += $" AND ParentId={mod.ParentId}";
                if (mod.EnumTypeId != default && mod.EnumTypeId != 0)
                    whereClause += $" AND EnumTypeId={mod.EnumTypeId}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Settingss = _coaDAL.SearchSettingss (whereClause);

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
            return Settingss;
        }
        public List<SettingsDE> SearchMenu ( )
        {
            List<SettingsDE> Settingss = new List<SettingsDE> ();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection ();
                closeConnectionFlag = true;
                #region Search

                string whereClause = " Where 1=1";

                whereClause += $" AND ClientId={0}";
                whereClause += $" AND ModuleId={0}";
                whereClause += $" AND (EnumTypeId={(int)EnumType.Modules} or EnumTypeId={(int)EnumType.SideMenu} or EnumTypeId={(int)EnumType.SideSubMenu})";
                whereClause += $" AND IsActive =1";
                Settingss = _coaDAL.SearchSettingss (whereClause);

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
            return Settingss;
        }
        public List<SettingsDE> SearchMenuByUser (UserVM  user)
        {
            List<SettingsDE> Settings = new List<SettingsDE> ();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection ();
                closeConnectionFlag = true;
                #region Search

                string whereClause = " Where 1=1";

                whereClause += $" AND ClientId={0}";
                whereClause += $" AND ModuleId={0}";
                whereClause += $" AND (EnumTypeId={(int)EnumType.Modules} or EnumTypeId={(int)EnumType.SideMenu} or EnumTypeId={(int)EnumType.SideSubMenu})";
                whereClause += $" AND IsActive =1";
                Settings = _coaDAL.SearchSettingss (whereClause);
                if (_permSvc != null && user.Id != null && user.RoleId > 0)
                {
                    var perm = _permSvc.GetPermsByUserOrRole (user.Id, user.RoleId);
                    foreach (var item in Settings)
                    {
                        item.ShouldDisplay = true;
                        var find = Settings.FindAll (x => x.ParentId == item.Id);
                        if (find.Count == 0)
                        {
                            var serach = perm.Find (x => x.RouteId == item.Id);
                            if (serach != null && serach.PermissionId > 0 && serach.PermissionId!!=(int)Permissions.Deny)
                            { }
                            else item.ShouldDisplay = false;
                        }
                    }
                    Settings = Settings.OrderByDescending (x => x.ParentId).ToList ();
                    foreach (var item in Settings)
                    {
                        var hasChildren = Settings.FindAll (x => x.ParentId == item.Id);
                        bool condition = hasChildren.Count > 0 && !hasChildren.Any (x => x.ShouldDisplay);
                        if (condition)
                            item.ShouldDisplay = false;
                    }
                    Settings = Settings.Where (x => x.ShouldDisplay == true).ToList ();
                }
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
            return Settings;
        }

        #endregion
    }
}
