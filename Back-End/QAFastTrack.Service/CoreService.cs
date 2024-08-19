using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.DAL;
using Restaurant.Service;

namespace Restaurant.Services
{
    public class CoreService
    {
        #region Class Variables
        private SettingsService _stngSvc;
        private CompanyInfoService _companyInfoSvc;
        #endregion
        #region Constructors
        public CoreService()
        {
            _stngSvc = new SettingsService(null);
            _companyInfoSvc = new CompanyInfoService ();
        }
        #endregion
        #region Enums
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
        #endregion
        #region Company Profile
        public CompanyInfoDE GetCompanyInfoByClient(int ClientId )
        {
            return _companyInfoSvc.SearchCompanyInfos (new CompanyInfoDE { ClientId = ClientId }).FirstOrDefault ();
        }
        #endregion
    }
}
