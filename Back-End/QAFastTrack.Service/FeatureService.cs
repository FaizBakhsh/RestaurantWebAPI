using Restaurant.Core.Entities;
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

namespace Restaurant.Services
{
    public class FeatureService
    {
        #region Class Members/Class Variables

        private FeatureDAL _featDAL;
        private CoreDAL _corDAL;

        #endregion
        #region Constructors
        public FeatureService()
        {
            _featDAL = new FeatureDAL();
            _corDAL = new CoreDAL();
        }


        #endregion
        #region Feature
        public bool ManagementFeature(FeatureDE mod)
        {
            MySqlCommand cmd = null;
            try
            {
                bool retVal = true;
                cmd = RestaurantDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.feature.ToString());
                retVal = _featDAL.ManageFeature(mod);
                if (retVal == true)
                    mod.DBoperation = DBoperations.NA;
                return true;
            }
            catch
            {
                return false;
            }
            finally
            {
                if (cmd != null)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<FeatureDE> SearchFeatures(FeatureDE mod)
        {
            List<FeatureDE> Feature = new List<FeatureDE>();
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
                Feature = _featDAL.SearchFeatures(whereClause);

                #endregion
            }
            catch (Exception exp)
            {
                throw exp;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
            return Feature;
        }

        #endregion
    }
}
