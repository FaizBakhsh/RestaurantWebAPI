using MySql.Data.MySqlClient;
using NLog;
using Restaurant.Core.Constants;
using Restaurant.Core.Entities.Acc;
using Restaurant.Core.Enums;
using Restaurant.DAL;
using Restaurant.DAL.Acc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Service.Acc
{
    public partial class AccService:BaseService, IAccService
    {
        #region VoucherType
        public VoucherTypeDE ManageVoucherType(VoucherTypeDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                _entity = TableNames.Acc_VoucherType.ToString ();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _coreDAL.GetNextIdByClient(_entity, mod.ClientId, "ClientId");

                if (_accDAL.ManageVoucherType (mod, cmd))
                {
                    mod.AddSuccessMessage (string.Format (AppConstants.CRUD_DB_OPERATION, _entity, mod.DBoperation.ToString ()));
                    _logger.Info ($"Success: " + string.Format (AppConstants.CRUD_DB_OPERATION, _entity, mod.DBoperation.ToString ()));
                }
                else
                {
                    mod.AddErrorMessage (string.Format (AppConstants.CRUD_ERROR, _entity));
                    _logger.Info ($"Error: " + string.Format (AppConstants.CRUD_ERROR, _entity));
                }
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
            return mod;
        }
        public List<VoucherTypeDE> SearchVoucherTypes(VoucherTypeDE mod)
        {
            List<VoucherTypeDE> VoucherTypes = new List<VoucherTypeDE>();
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
                if (mod.VchTypeCode != default)
                    whereClause += $" AND VchTypeCode like ''" + mod.VchTypeCode + "''";
                if (mod.VchTypeDesc != default)
                    whereClause += $" AND VchTypeDesc like ''" + mod.VchTypeDesc + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                VoucherTypes = _accDAL.SearchVoucherTypes(whereClause);

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
            return VoucherTypes;
        }
        #endregion
    }
}
