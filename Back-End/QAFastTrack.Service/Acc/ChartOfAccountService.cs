using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.DAL;
using MySql.Data.MySqlClient;
using NLog;
using Restaurant.Core.Entities.Acc;
using Restaurant.DAL.Acc;
using System.Data;
using K4os.Hash.xxHash;
using Restaurant.Core.Constants;

namespace Restaurant.Service.Acc
{
    public partial class AccService
    {

        #region  ChartOfAccount

        public ChartOfAccountDE ManageChartOfAccount ( ChartOfAccountDE mod )
        {
            bool retVal = false;
            bool closeConnectionFlag = false;
            try
            {
                _entity = TableNames.Acc_ChartOfAccount.ToString ();
                if (cmd == null || cmd.Connection.State != ConnectionState.Open)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection ();
                    closeConnectionFlag = true;
                }
                if(mod.DBoperation==DBoperations.Insert)
                    mod.Id =_coreDAL.GetNextIdByClient (_entity, mod.ClientId, "ClientId");
                #region DuplicateEntry Validation
                var accounts = SearchChartOfAccount (new ChartOfAccountDE
                {
                    ClientId = mod.ClientId,
                    CoaCode = mod.CoaCode
                });
                if (mod.DBoperation == DBoperations.Update)
                    accounts = accounts.Where (x => x.Id != mod.Id).ToList ();
                if (accounts != null && accounts.Count > 0)
                {
                    mod.AddErrorMessage (" CoaCode ' "+mod.CoaCode +" ' already Defined");
                    return mod;
                }
                #endregion
                if (mod.DBoperation == DBoperations.Update)
                {
                    var searchedAccount = new ChartOfAccountDE ();
                    List<ChartOfAccountDE> List = _accDAL.SearchChartOfAccount ($"where acc.Id={mod.Id} and acc.ClientId={mod.ClientId}");
                    if (List.Count > 0)
                    {
                        searchedAccount = List.First ();
                        if (mod.CoaCode != searchedAccount.CoaCode)
                        {
                            List<ChartOfAccountDE> _list = _accDAL.SearchChartOfAccount ($"where  acc.ClientId={mod.ClientId} AND acc.CoaCode like '%" + searchedAccount.CoaCode + "%'");
                            if (mod.CoaLevelId == (int)AccountLevels.Level1)
                            {
                                List<ChartOfAccountDE> accountUseLevel1 = _list.FindAll (x => searchedAccount.CoaCode ==
                                x.CoaCode?.Substring (0, 2));
                                foreach (var account in accountUseLevel1)
                                {
                                    account.DBoperation = DBoperations.Update;
                                    account.CoaCode = account.CoaCode?.Remove (0, 2).Insert (0, mod.CoaCode);
                                    _accDAL.ManageChartOfAccount (account, cmd);
                                }
                            }
                            else if (mod.CoaLevelId == (int)AccountLevels.Level2)
                            {
                                List<ChartOfAccountDE> accountUseLevel1 = _list.FindAll (x => searchedAccount.CoaCode ==
                                x.CoaCode?.Substring (0,5));
                                foreach (var account in accountUseLevel1)
                                {
                                    account.DBoperation = DBoperations.Update;
                                    account.CoaCode = account.CoaCode?.Remove (0,5).Insert (0, mod.CoaCode);
                                    _accDAL.ManageChartOfAccount (account, cmd);
                                }
                            }
                            else if (mod.CoaLevelId == (int)AccountLevels.Level3)
                            {
                                List<ChartOfAccountDE> accountUseLevel1 = _list.FindAll (x => searchedAccount.CoaCode ==
                                x.CoaCode?.Substring (0,8));
                                foreach (var account in accountUseLevel1)
                                {
                                    account.DBoperation = DBoperations.Update;
                                    account.CoaCode = account.CoaCode?.Remove (0,8).Insert (0, mod.CoaCode);
                                    _accDAL.ManageChartOfAccount (account, cmd);
                                }
                            }
                            else if (mod.CoaLevelId == (int)AccountLevels.Level4)
                            {
                                List<ChartOfAccountDE> accountUseLevel1 = _list.FindAll (x => searchedAccount.CoaCode ==
                                x.CoaCode?.Substring (0,12));
                                foreach (var account in accountUseLevel1)
                                {
                                    account.DBoperation = DBoperations.Update;
                                    account.CoaCode = account.CoaCode?.Remove (0,12).Insert (0, mod.CoaCode);
                                    _accDAL.ManageChartOfAccount (account, cmd);
                                }
                            }
                            else if (mod.CoaLevelId == (int)AccountLevels.Level5)
                            {
                                List<ChartOfAccountDE> accountUseLevel1 = _list.FindAll (x => searchedAccount.CoaCode ==
                                x.CoaCode?.Substring (0,17));
                                foreach (var account in accountUseLevel1)
                                {
                                    account.DBoperation = DBoperations.Update;
                                    account.CoaCode = account.CoaCode?.Remove (0,17).Insert (0, mod.CoaCode);
                                    _accDAL.ManageChartOfAccount (account, cmd);
                                }
                            }
                        }
                    }
                }
                if (_accDAL.ManageChartOfAccount (mod, cmd))
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
                _logger.Error (ex);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
            return mod;
        }
        public List<ChartOfAccountDE> SearchChartOfAccount ( ChartOfAccountDE mod )
        {
            List<ChartOfAccountDE> accounts = new List<ChartOfAccountDE> ();
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null || cmd.Connection.State != ConnectionState.Open)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection ();
                    closeConnectionFlag = true;
                }
                #region Search

                string whereClause = " Where 1=1";

                if (mod.ClientId != default && mod.ClientId != 0)
                    whereClause += $" AND acc.ClientId={mod.ClientId}";
                if (mod.Id != default && mod.Id != 0)
                    whereClause += $" AND acc.Id={mod.Id}";
                if (mod.CoaLevelId != default && mod.CoaLevelId != 0)
                    whereClause += $" AND acc.CoaLevelId={mod.CoaLevelId}";
                if (mod.ParentCoaId != default && mod.ParentCoaId != 0)
                    whereClause += $" AND acc.ParentCoaId={mod.ParentCoaId}";
                if (mod.CoaLevel != default && mod.CoaLevel != "")
                    whereClause += $" AND level.Name like '" + mod.CoaLevel + "'";
                if (mod.CoaCode != default && mod.CoaCode != "")
                    whereClause += $" AND acc.CoaCode  like '" + mod.CoaCode + "'";
                if (mod.CoaDesc != default && mod.CoaDesc != "")
                    whereClause += $" AND acc.CoaDesc like '" + mod.CoaDesc + "'";
                if (mod.ParentCoaDesc != default && mod.ParentCoaDesc != "")
                    whereClause += $" AND parentAcc.CoaDesc like '" + mod.ParentCoaDesc + "'";
                if (mod.CoaTypeId != default && mod.CoaTypeId != 0)
                    whereClause += $" AND acc.CoaTypeId={mod.CoaTypeId}";
                if (mod.IsActive != default)
                    whereClause += $" AND acc.IsActive ={mod.IsActive}";
                accounts = _accDAL.SearchChartOfAccount (whereClause, cmd);

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
            return accounts;
        }
        public List<ChartOfAccountDE> GetAccounts ( ChartOfAccountDE mod )
        {
            List<ChartOfAccountDE> accounts = new List<ChartOfAccountDE> ();
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null || cmd.Connection.State != ConnectionState.Open)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection ();
                    closeConnectionFlag = true;
                }
                #region Search

                string whereClause = " Where 1=1";

                if (mod.ClientId != default && mod.ClientId != 0)
                    whereClause += $" AND acc.ClientId={mod.ClientId}";
                if (mod.Id != default && mod.Id != 0)
                    whereClause += $" AND acc.Id={mod.Id}";
                if (mod.CoaLevelId != default && mod.CoaLevelId != 0)
                    whereClause += $" AND acc.CoaLevelId={mod.CoaLevelId}";
                if (mod.ParentCoaId != default && mod.ParentCoaId != 0)
                    whereClause += $" AND acc.ParentCoaId={mod.ParentCoaId}";
                if (mod.CoaLevel != default && mod.CoaLevel != "")
                    whereClause += $" AND level.Name like '%" + mod.CoaLevel + "%'";
                if (mod.CoaCode != default && mod.CoaCode != "")
                    whereClause += $" AND acc.CoaCode  like '%" + mod.CoaCode + "%'";
                if (mod.CoaDesc != default && mod.CoaDesc != "")
                    whereClause += $" AND acc.CoaDesc like '%" + mod.CoaDesc + "%'";
                if (mod.ParentCoaDesc != default && mod.ParentCoaDesc != "")
                    whereClause += $" AND parentAcc.CoaDesc like '%" + mod.ParentCoaDesc + "%'";
                if (mod.CoaTypeId != default && mod.CoaTypeId != 0)
                    whereClause += $" AND acc.CoaTypeId={mod.CoaTypeId}";
                if (mod.IsActive != default)
                    whereClause += $" AND acc.IsActive ={mod.IsActive}";
                if (mod.PageNo != default)
                    accounts = _accDAL.SearchChartOfAccount (whereClause, cmd, mod.PageNo, mod.PageSize);
                else
                    accounts = _accDAL.SearchChartOfAccount (whereClause, cmd);

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
            return accounts;
        }

        #endregion
    }
}
