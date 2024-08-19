using Restaurant.Core.Entities.Security;
using Restaurant.Core.Enums;
using Restaurant.Core.SearchCriteria;
using Restaurant.DAL;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Restaurant.Core.Entities;
using Xamarin.Essentials;
using NLog;
using Restaurant.Service;
using Restaurant.Service.IServices;

namespace Restaurant.Services
{
    public class PermissionsService: IPermissionService
    {
        #region Class Members/Class Variables

        private SettingsService _stngSvc;
        private Logger _logger;
        private PermissionsDAL _permsDAL;
        private CoreDAL _corDAL;
        private CoreService _coreService;

        #endregion
        #region Constructors
        public PermissionsService()
        {
            _logger = LogManager.GetLogger ("fileLogger");
            _permsDAL = new PermissionsDAL();
            _corDAL = new CoreDAL();
            _stngSvc = new SettingsService();
            _coreService = new CoreService();
        }

        #endregion
        #region Permission
        public bool ManagementPermissions(List<PermissionDE> permissions)
        {
            bool retVal = false;
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection ();
                RestaurantDataContext.StartTransaction (cmd);

                closeConnectionFlag = true;
                var Id = _corDAL.GetMaxId (TableNames.permission.ToString ());
                foreach (var perm in permissions)
                {
                    if (perm.Id > 0)
                    {
                        perm.DBoperation = DBoperations.Update;
                        retVal = _permsDAL.ManagePermission (perm, cmd);
                    }
                    else
                    {
                        if (perm.PermissionId != 0)
                        {
                            perm.DBoperation = DBoperations.Insert;
                            Id += 1;
                            perm.Id = Id;
                            retVal = _permsDAL.ManagePermission (perm, cmd);
                        }
                    }
                }
                RestaurantDataContext.EndTransaction (cmd);
                return retVal;
            }
            catch (Exception ex)
            {
                RestaurantDataContext.CancelTransaction (cmd);
                _logger.Error (ex);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
        }
        public List<PermissionDE> SearchPermissions ( PermissionDE mod )
        {
            List<PermissionDE> retVal = new List<PermissionDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection ();
                closeConnectionFlag = true;
                string WhereClause = " Where 1=1";
                if (mod.Id != default)
                    WhereClause += $" AND Id={mod.Id}";
                if (mod.RouteId != default)
                    WhereClause += $" AND RouteId={mod.RouteId}";
                if (mod.RoleId != default)
                    WhereClause += $" AND RoleId={mod.RoleId}";
                if (mod.PermissionId != default)
                    WhereClause += $" AND PermissionId={mod.PermissionId}";
                if (mod.UserId != default)
                    WhereClause += $" and UserId like ''" + mod.UserId + "''";
                if (mod.IsActive != default && mod.IsActive == true)
                    WhereClause += $" AND IsActive=1";
                retVal = _permsDAL.SearchPermissions (WhereClause, cmd);
                return retVal;             
            }
            catch (Exception ex)
            {
                _logger.Error (ex);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<PermissionDE> SearchPerms ( PermissionDE mod )
        {
            List<PermissionDE> retVal = new List<PermissionDE> ();
            try
            {
                var Routes =_coreService.GetRoutes ();
                if (Routes != null && Routes.Count > 0)
                {
                    foreach (var feat in Routes)
                    {
                        var perm = new PermissionDE ();
                        perm.RouteId = feat.Id;
                        perm.Route = feat.Name;
                        perm.IsActive = true;
                        perm.UserId = mod.UserId;
                        perm.RoleId = mod.RoleId;
                        perm.IsReadOnly = null;
                        if (mod.UserId != default && mod.UserId != "")
                        {
                            var userPerms = SearchPermissions (new PermissionDE { UserId = mod.UserId, RouteId = feat.Id });
                            if (userPerms != null && userPerms.Count > 0)
                            {
                                perm.Id = userPerms[0].Id;
                                perm.PermissionId = userPerms[0].PermissionId;
                                perm.User = userPerms[0].User;
                            }
                        }
                        if (mod.RoleId > 0)
                        {
                            var userPerms = SearchPermissions (new PermissionDE { RoleId = mod.RoleId, RouteId = feat.Id });
                            if (userPerms != null && userPerms.Count > 0)
                            {
                                perm.Id = userPerms[0].Id;
                                perm.PermissionId = userPerms[0].PermissionId;
                                perm.Role = userPerms[0].Role;
                            }
                        }
                        retVal.Add (perm);
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {

            }
            return retVal;
        }
        public List<PermissionDE> GetPermsByUserOrRole ( string UserId, int RoleId )
        {
            List<PermissionDE> perms = new List<PermissionDE> ();
            try
            {
                var routes =_coreService.GetRoutes ();
                if (routes != null && routes.Count > 0)
                {
                    var userPerms = new List<PermissionDE> ();
                    var rolePerms = new List<PermissionDE> ();
                    var perm = new PermissionDE ();
                    foreach (var route in routes)
                    {
                        userPerms = SearchPermissions (new PermissionDE { UserId = UserId, RouteId = route.Id });
                        if (userPerms != null && userPerms.Count > 0 && userPerms[0].PermissionId > 0)
                                perm = userPerms[0];
                        else
                        {
                            rolePerms = SearchPermissions (new PermissionDE { RoleId = RoleId, RouteId = route.Id });
                            if (rolePerms != null && rolePerms.Count > 0)
                                if (rolePerms[0].PermissionId > 0)
                                    perm = rolePerms[0];
                        }
                        if (perm.Id == 0)
                        {
                            perm.RouteId = route.Id;
                            perm.Route = route.Name;
                            perm.IsActive = true;
                            perm.UserId = UserId;
                            perm.RoleId = RoleId;
                            perm.IsReadOnly = null;
                        }
                        perms.Add (perm);
                    }
                }
                if (perms != null && perms.Count > 0)
                    perms = Translate (perms);
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {

            }
            return perms;
        }
        public List<SettingsDE> GetRoutes ( )
        {
            List<SettingsDE> Routes = new List<SettingsDE> ();
            try
            {
                var menu = _stngSvc.SearchMenu ().OrderBy (x => x.ParentId).ToList ();
                if (menu != null && menu.Count > 0)
                    foreach (var item in menu)
                    {
                        var find = menu.FindAll (x => x.ParentId == item.Id);
                        if (find.Count == 0)
                            Routes.Add (item);
                    }
                return Routes;
            }
            catch (Exception) { throw; }
        }
        public List<PermissionDE> Translate ( List<PermissionDE> perms )
        {
            foreach (var perm in perms)
            {
                if (perm.PermissionId > 0 && perm.PermissionId != (int)Core.Enums.Permissions.Deny)
                    perm.IsReadOnly = perm.PermissionId == (int)Core.Enums.Permissions.ReadOnly ? true : false;
                else
                    perm.IsReadOnly = null;
            }
            return perms;
        }
        #endregion
    }
}
