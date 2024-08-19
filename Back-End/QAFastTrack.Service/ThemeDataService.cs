
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
    public class ThemeDataService
    {
        #region Data Members

        private ThemeDataDAL _tdDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public ThemeDataService()
        {
            _tdDAL = new ThemeDataDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region ThemeData
        public bool AddThemeData(List<ThemeDataDE> mod, int? Id = null)
        {
            MySqlCommand? cmd = null;
            try
            {
                bool retVal = true;
                cmd = RestaurantDataContext.OpenMySqlConnection();
                #region Insert tdata
                foreach(var themeData in mod)
                {
                    themeData.DBoperation = DBoperations.Insert;
                        themeData.Id = _corDAL.GetNextIdByClient (TableNames.themedata.ToString (), themeData.ClientId, "ClientId");
                    retVal = _tdDAL.ManageThemeData(themeData);
                }
                #endregion              
                return retVal;
            }
            catch(Exception ex) 
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
        public bool DaleteThemeData(int cltId)
        {
            MySqlCommand? cmd = null;
            try
            {
                bool retVal = true;
                cmd = RestaurantDataContext.OpenMySqlConnection();
                #region Delete tdata
                ThemeDataDE tData = new ThemeDataDE();
                tData.ClientId=cltId;
                tData.DBoperation = DBoperations.Delete;
                    retVal = _tdDAL.ManageThemeData(tData);
                #endregion
                return retVal;
            }
            catch(Exception ex)
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
        public List<ThemeDataDE> SearchThemeDatas(ThemeDataDE mod)
        {
            List<ThemeDataDE> tdata = new List<ThemeDataDE>();
            bool closeConnectionFlag = false;
            MySqlCommand? cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.ClientId != default)
                    whereClause += $" AND ClientId={mod.ClientId}";

                tdata = _tdDAL.SearchThemeDatas(whereClause);
              
                #endregion
            }
            catch (Exception ex)
            {
                _logger.Error(ex);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
            return tdata;
        }
        #endregion
    }
}
