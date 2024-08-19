using Restaurant.Core.Enums;
using Restaurant.DAL;
using MySql.Data.MySqlClient;
using NLog;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Restaurant.Core.Entities.Acc;
using Restaurant.DAL.Acc;
using Restaurant.Core.Constants;
using static Dapper.SqlMapper;
using Microsoft.AspNetCore.Components.Forms;

namespace Restaurant.Service.Acc
{
    public partial class AccService : BaseService, IAccService
    {
        #region Voucher
        public VoucherDE ManageVoucher(VoucherDE mod, int? Id = null)
        {
            MySqlCommand cmd = null;
            try
            {
                bool retVal = false;
                cmd = RestaurantDataContext.OpenMySqlConnection();
                RestaurantDataContext.StartTransaction(cmd);
                _entity = TableNames.Acc_Voucher.ToString ();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _coreDAL.GetNextIdByClient(_entity, mod.ClientId, "ClientId");

                if (_accDAL.ManageVoucher (mod, cmd))
                {
                    mod.AddSuccessMessage (string.Format (AppConstants.CRUD_DB_OPERATION, _entity, mod.DBoperation.ToString ()));
                    _logger.Info ($"Success: " + string.Format (AppConstants.CRUD_DB_OPERATION, _entity, mod.DBoperation.ToString ()));

                    if (mod.DBoperation == DBoperations.Insert || mod.DBoperation == DBoperations.Update)
                        foreach (var vchDet in mod.VoucherDetails)
                        {
                           _entity = TableNames.Acc_VoucherDetail.ToString ();
                            vchDet.VchId = mod.Id;
                            vchDet.ClientId = mod.ClientId;
                            if (vchDet.DBoperation == DBoperations.Insert)
                            {
                                vchDet.Id = _coreDAL.GetNextLineIdByClt (_entity, "VchId", mod.Id, mod.ClientId);
                                vchDet.Id += 1;
                            }
                            if (_accDAL.ManageVoucherDetail (vchDet, cmd))
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
                }
                else
                {
                    mod.AddErrorMessage (string.Format (AppConstants.CRUD_ERROR, _entity));
                    _logger.Info ($"Error: " + string.Format (AppConstants.CRUD_ERROR, _entity));
                }
                RestaurantDataContext.EndTransaction(cmd);
            }
            catch (Exception exp)
            {
                _logger.Error(exp);
                RestaurantDataContext.CancelTransaction(cmd);
                throw;
            }
            finally
            {
                if (cmd != null)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
                string whereClause = " Where 1=1";
                mod.VoucherDetails = _accDAL.SearchVoucherDetail(whereClause += $" AND vchDetail.VchId={mod.Id} AND vchDetail.IsActive ={true} AND vchDetail.ClientId ={mod.ClientId}");
            }
            return mod;
        }
        public List<VoucherDE> SearchVouchers(VoucherDE mod)
        {
            List<VoucherDE> vch = new List<VoucherDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();

                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND vch.Id={mod.Id}";
                if (mod.VchYearId != default)
                    whereClause += $" AND vch.VchYearId={mod.VchYearId}";
                if (mod.ClientId != default)
                    whereClause += $" AND vch.ClientId={mod.ClientId}";
                if (mod.VchMonth != default)
                    whereClause += $" AND vch.VchMonth={mod.VchMonth}";
                if (mod.VchType != default)
                    whereClause += $" AND vchType.VchTypeCode like '" + mod.VchType + "'";
                if (mod.PageNo != default)
                    vch = _accDAL.SearchVouchers(whereClause,cmd, mod.PageNo, mod.PageSize);
                else
                    vch = _accDAL.SearchVouchers (whereClause);
                foreach (var line in vch)
                {
                    whereClause = "where 1=1 ";
                    line.VoucherDetails = _accDAL.SearchVoucherDetail(whereClause += $" AND vchDetail.VchId={line.Id} AND vchDetail.IsActive ={true} " +
                        $"AND vchDetail.ClientId ={line.ClientId}");
                }
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
            return vch;
        }
        public List<VoucherDetailDE> SearchVoucherLines(VoucherDetailDE mod)
        {
            List<VoucherDetailDE> vch = new List<VoucherDetailDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();

                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND vchDetail.Id={mod.Id}";
                if (mod.ClientId != default)
                    whereClause += $" AND vchDetail.ClientId={mod.ClientId}";
                if (mod.CoaId != default)
                    whereClause += $" AND vchDetail.CoaId={mod.CoaId}";
                vch = _accDAL.SearchVoucherDetail(whereClause);

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
            return vch;
        }
        public VoucherDE GetNextVchValues(VoucherDE vch)
        {
            string month = (DateTime.Now.Month).ToString("D2");
            string vchYear = String.Empty;
            DateTime openingDate = new DateTime (DateTime.Now.Year, AppConstants.DEFAULT_OPENING_BALANCE_MONTH, AppConstants.DEFAULT_OPENING_BALANCE_DATE);
            DateTime currentDate = DateTime.Now;
            if (currentDate < openingDate)
            {
                int currentYear = currentDate.Year % 100;
                int previousYear = (currentDate.Year - 1) % 100;

               // vchYear= $"{previousYear}{currentYear}";
            }
            else
            {
                int currentYear = currentDate.Year % 100;
                int futureYear = (currentDate.Year + 1) % 100;

                //vchYear= $"{currentYear}{futureYear}";
            }
            var fiscalYear = SearchFiscalYear (new FiscalYearDE
            {
                ClientId = vch.ClientId,
                Id = vch.VchYearId
            }).FirstOrDefault ();
            if (fiscalYear != null && fiscalYear.Id > 0)
                vch.VchYear = fiscalYear.YearCode;
            vch.VchMonth = month;
            var vouchers = SearchVouchers (new VoucherDE { VchMonth = month, VchType = vch.VchType, ClientId = vch.ClientId });
            if(vouchers!=null && vouchers.Count > 0) 
                vch.VchNo = (vouchers.Count + 1).ToString ("D4");
            else
                vch.VchNo ="0001";
            vch.VchKey = $"{vch.VchMonth}{vch.VchType}{vch.VchNo}";
            return vch;
        }
        #endregion
    }
}
