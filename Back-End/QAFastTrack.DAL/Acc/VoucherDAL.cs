using Dapper;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Restaurant.Core.Entities.Acc;
using System.Drawing.Printing;
using Restaurant.Core.Constants;

namespace Restaurant.DAL.Acc
{
    public partial class AccountDAL : IAccDAL
    {
        #region Header Operations
        public bool ManageVoucher(VoucherDE vch, MySqlCommand? cmd = null)
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                cmd.CommandText = SPNames.ACC_Manage_Voucher;
                cmd.Parameters.AddWithValue("@prm_id", vch.Id);
                cmd.Parameters.AddWithValue("@prm_clientId", vch.ClientId);
                cmd.Parameters.AddWithValue("@prm_statusId", vch.StatusId);
                cmd.Parameters.AddWithValue("@prm_approvalStatusId", vch.ApprovalStatusId);
                cmd.Parameters.AddWithValue("@prm_vchTypeId", vch.VchTypeId);
                cmd.Parameters.AddWithValue("@prm_vchKey", vch.VchKey);
                cmd.Parameters.AddWithValue("@prm_vchNo", vch.VchNo);
                cmd.Parameters.AddWithValue("@prm_vchDate", vch.VchDate);
                cmd.Parameters.AddWithValue("@prm_vchYearId", vch.VchYearId);
                cmd.Parameters.AddWithValue("@prm_vchMonth", vch.VchMonth);
                cmd.Parameters.AddWithValue("@prm_vchPaidTo", vch.VchPaidTo);
                cmd.Parameters.AddWithValue("@prm_vchNarration", vch.VchNarration);
                cmd.Parameters.AddWithValue("@prm_isPosted", vch.IsPosted);
                cmd.Parameters.AddWithValue("@prm_createdOn", vch.CreatedOn);
                cmd.Parameters.AddWithValue("@prm_createdById", vch.CreatedById);
                cmd.Parameters.AddWithValue("@prm_modifiedOn", vch.ModifiedOn);
                cmd.Parameters.AddWithValue("@prm_modifiedById", vch.ModifiedById);
                cmd.Parameters.AddWithValue("@prm_isActive", vch.IsActive);
                cmd.Parameters.AddWithValue("@prm_DBoperation", vch.DBoperation.ToString());

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception )
            {
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
                cmd.Parameters.Clear();
            }
        }
        public List<VoucherDE> SearchVouchers ( string whereClause, MySqlCommand? cmd = null, int PageNo = 1, int PageSize = AppConstants.GRID_MAX_PAGE_SIZE )
        {
            List<VoucherDE> top = new List<VoucherDE> ();
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection ();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine ("Connection  has been created");
                else
                    Console.WriteLine ("Connection error");
                var parameters = new
                {
                    prm_WhereClause = whereClause
                ,
                    prm_Start = PageNo
                ,
                    prm_Limit = PageSize
                ,
                };
                top = cmd.Connection.Query<VoucherDE> (SPNames.ACC_Search_Voucher.ToString (), parameters, commandType: CommandType.StoredProcedure).ToList ();
                return top;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
        }

        #endregion
        #region Line Operations
        public bool ManageVoucherDetail(VoucherDetailDE vDetail, MySqlCommand? cmd = null)
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine("Connection  has been created");
                else
                    Console.WriteLine("Connection error");
                cmd.CommandText = SPNames.ACC_Manage_VoucherDetail;
                cmd.Parameters.AddWithValue("@prm_id", vDetail.Id);
                cmd.Parameters.AddWithValue("@prm_clientId", vDetail.ClientId);
                cmd.Parameters.AddWithValue("@prm_vchId", vDetail.VchId);
                cmd.Parameters.AddWithValue("@prm_coaId", vDetail.CoaId);
                cmd.Parameters.AddWithValue("@prm_vchChqNo", vDetail.VchChqNo);
                cmd.Parameters.AddWithValue("@prm_vchChqDate", vDetail.VchChqDate);
                cmd.Parameters.AddWithValue("@prm_vchCreditAmt", vDetail.VchCreditAmt);
                cmd.Parameters.AddWithValue("@prm_vchDebitAmt", vDetail.VchDebitAmt);
                cmd.Parameters.AddWithValue("@prm_vchNarration", vDetail.VchNarration);
                cmd.Parameters.AddWithValue("@prm_createdOn", vDetail.CreatedOn);
                cmd.Parameters.AddWithValue("@prm_createdById", vDetail.CreatedById);
                cmd.Parameters.AddWithValue("@prm_modifiedOn", vDetail.ModifiedOn);
                cmd.Parameters.AddWithValue("@prm_modifiedById", vDetail.ModifiedById);
                cmd.Parameters.AddWithValue("@prm_isActive", vDetail.IsActive);
                cmd.Parameters.AddWithValue("@prm_DBoperation", vDetail.DBoperation.ToString());

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception )
            {
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
                cmd.Parameters.Clear();
            }
        }
        public List<VoucherDetailDE> SearchVoucherDetail ( string whereClause, MySqlCommand? cmd = null, int PageNo = 1, int PageSize = AppConstants.GRID_MAX_PAGE_SIZE )
        {
            List<VoucherDetailDE> top = new List<VoucherDetailDE> ();
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection ();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine ("Connection  has been created");
                else
                    Console.WriteLine ("Connection error");
                var parameters = new
                {
                    prm_WhereClause = whereClause
                ,
                    prm_Start = PageNo
                ,
                    prm_Limit = PageSize
                ,
                };
                top = cmd.Connection.Query<VoucherDetailDE> (SPNames.ACC_Search_VoucherDetail.ToString (), parameters, commandType: CommandType.StoredProcedure).ToList ();
                return top;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
        }

        #endregion
    }
}
