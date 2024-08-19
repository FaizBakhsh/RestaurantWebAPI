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
    public class ExtraFieldDataService
    {
        #region Class Members/Class Variables

        private ExtraFieldDataDAL _ExtraFieldDataDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public ExtraFieldDataService()
        {
            _ExtraFieldDataDAL = new ExtraFieldDataDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region ExtraFieldData
        public bool ManagementExtraFieldData(ExtraFieldDataDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.extrafielddata.ToString());
                retVal = _ExtraFieldDataDAL.ManageExtraFieldData(mod);
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
        public List<ExtraFieldDataDE> SearchExtraFieldData(ExtraFieldDataDE mod)
        {
            List<ExtraFieldDataDE> ExtraFieldDatas = new List<ExtraFieldDataDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();

                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.EnumLineId != default)
                    whereClause += $" AND EnumLineId={mod.EnumLineId}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                ExtraFieldDatas = _ExtraFieldDataDAL.SearchExtraFieldData(whereClause);

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
            return ExtraFieldDatas;
        }
        #endregion
    }
}
