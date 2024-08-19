using MySql.Data.MySqlClient;
using NLog;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.Core.ViewModel;
using Restaurant.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Service
{
    public class AttributeValuesService
    {
        #region Class Members/Class Variables

        private AttributeValuesDAL _attValDAL;
        private CoreDAL _corDAL;
        private Logger _logger;
        #endregion
        #region Constructors
        public AttributeValuesService()
        {
            _attValDAL = new AttributeValuesDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }

        #endregion
        #region AttributeValues
        public bool ManagementAttributeValues(AttributeValuesDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();

                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetnextId(TableNames.attributevalues.ToString());
                retVal = _attValDAL.ManageAttributeValues(mod);
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
        public List<AttributeValuesDE> SearchAttributeValues(AttributeValuesDE mod)
        {
            List<AttributeValuesDE> AttributeValues = new List<AttributeValuesDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.AttributeId != default && mod.AttributeId != 0)
                    whereClause += $" AND AttributeId={mod.AttributeId}";
                if (mod.KeyCode != default )
                    whereClause += $" AND KeyCode like ''"+mod.KeyCode+"'' ";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";

                AttributeValues = _attValDAL.SearchAttributeValues(whereClause);
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
            return AttributeValues;
        }

        #endregion
    }
}
