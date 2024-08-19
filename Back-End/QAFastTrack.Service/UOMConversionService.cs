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
    public class UOMConversionService
    {
        #region Class Members/Class Variables

        private UOMConversionDAL _uomCnvrsnDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public UOMConversionService()
        {
            _uomCnvrsnDAL = new UOMConversionDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region UOMConversion
        public bool ManagementUOMConversion(UOMConversionDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.uomconversion.ToString (), mod.ClientId, "ClientId");
                retVal = _uomCnvrsnDAL.ManageUOMConversion(mod);
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
        public List<UOMConversionDE> SearchUOMConversions(UOMConversionDE mod)
        {
            List<UOMConversionDE> UOMConversions = new List<UOMConversionDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.ClientId != default)
                    whereClause += $" AND ClientId={mod.ClientId}";
                if (mod.UOMId != default && mod.UOMId!=0)
                    whereClause += $" AND UOMId={mod.UOMId}";
                if (mod.ConvertedUOMId != default && mod.ConvertedUOMId != 0)
                    whereClause += $" AND ConvertedUOMId={mod.ConvertedUOMId}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                UOMConversions = _uomCnvrsnDAL.SearchUOMConversions(whereClause);

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
            return UOMConversions;
        }
        #endregion
    }
}
