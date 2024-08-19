using Dapper;
using MySql.Data.MySqlClient;
using Restaurant.Core.Constants;
using Restaurant.Core.Entities.Acc;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.DAL.Acc
{
    public partial class AccountDAL : IAccDAL
    {
        #region Operations
        public bool ManageVoucherType(VoucherTypeDE VoucherType, MySqlCommand? cmd = null)
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
                cmd.CommandText = SPNames.ACC_Manage_VoucherType;
                cmd.Parameters.AddWithValue("@prm_id", VoucherType.Id);
                cmd.Parameters.AddWithValue("@prm_clientId", VoucherType.ClientId);
                cmd.Parameters.AddWithValue("@prm_vchTypeId", VoucherType.VchTypeId);
                cmd.Parameters.AddWithValue("@prm_vchTypeCode", VoucherType.VchTypeCode);
                cmd.Parameters.AddWithValue("@prm_vchTypeDesc", VoucherType.VchTypeDesc);
                cmd.Parameters.AddWithValue("@prm_vchTypeRemarks", VoucherType.VchTypeRemarks);
                cmd.Parameters.AddWithValue("@prm_vchChq", VoucherType.VchChq);
                cmd.Parameters.AddWithValue("@prm_isAutoPosted", VoucherType.IsAutoPosted);
                cmd.Parameters.AddWithValue("@prm_vchPostStage", VoucherType.VchPostStage);
                cmd.Parameters.AddWithValue("@prm_createdOn", VoucherType.CreatedOn);
                cmd.Parameters.AddWithValue("@prm_createdById", VoucherType.CreatedById);
                cmd.Parameters.AddWithValue("@prm_modifiedOn", VoucherType.ModifiedOn);
                cmd.Parameters.AddWithValue("@prm_modifiedById", VoucherType.ModifiedById);
                cmd.Parameters.AddWithValue("@prm_isActive", VoucherType.IsActive);
                cmd.Parameters.AddWithValue("@prm_DBoperation", VoucherType.DBoperation.ToString());

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception ex)
            {
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<VoucherTypeDE> SearchVoucherTypes(string whereClause, MySqlCommand? cmd = null)
        {
            List<VoucherTypeDE> top = new List<VoucherTypeDE>();
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
                top = cmd.Connection.Query<VoucherTypeDE>("call "+SPNames.ACC_Search_VoucherType+"( '" + whereClause + "')").ToList();
                return top;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
        }

        #endregion
    }
}
