using MySql.Data.MySqlClient;
using NLog;
using Restaurant.Core.Entities.Acc;
using Restaurant.Core.Enums;
using Restaurant.DAL;
using Restaurant.DAL.Acc;
using System;
using static Dapper.SqlMapper;
using Microsoft.AspNetCore.Components.Forms;
using Restaurant.Core.Constants;
using System.Data;

namespace Restaurant.Service.Acc
{
    public partial class AccService : BaseService, IAccService
    {
        public FiscalYearDE ManageFiscalYear(FiscalYearDE mod)
        {
            bool closeConnectionFlag = false;
            try
            {
                _entity = TableNames.Acc_FiscalYear.ToString();
                if (cmd == null || cmd.Connection.State != ConnectionState.Open)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _coreDAL.GetNextIdByClient(_entity, mod.ClientId, "ClientId") ;

                if (_accDAL.ACC_Manage_FiscalYear(mod, cmd))
                {
                    mod.AddSuccessMessage(string.Format(AppConstants.CRUD_DB_OPERATION, _entity, mod.DBoperation.ToString()));
                    _logger.Info($"Success: " + string.Format(AppConstants.CRUD_DB_OPERATION, _entity, mod.DBoperation.ToString()));
                }
                else
                {
                    mod.AddErrorMessage(string.Format(AppConstants.CRUD_ERROR, _entity));
                    _logger.Info($"Error: " + string.Format(AppConstants.CRUD_ERROR, _entity));
                }
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
            return mod;
        }
        public List<FiscalYearDE> SearchFiscalYear(FiscalYearDE mod)
        {
            List<FiscalYearDE> FiscalYear = new List<FiscalYearDE>();
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null || cmd.Connection.State != ConnectionState.Open)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                #region Search

                string WhereClause = " Where 1=1";


                if (mod.ClientId != default && mod.ClientId != 0)
                    WhereClause += $" AND ClientId={mod.ClientId}";
                if (mod.Id != default && mod.Id != 0)
                    WhereClause += $" AND Id={mod.Id}";
                if (mod.YearCode != default)
                    WhereClause += $" and YearCode like ''" + mod.YearCode + "''";
                if (mod.YearDesc != default)
                    WhereClause += $" and YearDesc like ''" + mod.YearDesc + "''";
                if (mod.YearDateFrom != default)
                    WhereClause += $" and YearDateFrom like ''" + mod.YearDateFrom + "''";
                if (mod.YearDateTo != default)
                    WhereClause += $" and YearDateTo like ''" + mod.YearDateTo + "''";
                if (mod.IsActiveYear != default && mod.IsActiveYear == true)
                    WhereClause += $" AND IsActiveYear=1";
                if (mod.IsActive != default && mod.IsActive == true)
                    WhereClause += $" AND IsActive=1";

                else
                    FiscalYear = _accDAL.ACC_Search_FiscalYear (WhereClause, cmd);

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
            return FiscalYear;
        }


    }
}
