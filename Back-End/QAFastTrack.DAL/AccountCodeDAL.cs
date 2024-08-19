using Dapper;
using MySql.Data.MySqlClient;
using Restaurant.Core.Entities;
using Restaurant.Core.Entities.Security;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.DAL
{
    public class AccountCodeDAL
    {
        #region Operations
        public bool ManageAccountCode(AccountCodeDE code, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageAccountCode";
                cmd.Parameters.AddWithValue("@id", code.Id);
                cmd.Parameters.AddWithValue("@accountTypeId", code.AccountTypeId);
                cmd.Parameters.AddWithValue("@code", code.Code);
                cmd.Parameters.AddWithValue("@createdOn", code.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", code.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", code.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", code.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", code.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", code.DBoperation.ToString());

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
        public List<AccountCodeDE> SearchAccountCodes(string whereClause, MySqlCommand cmd = null)
        {
            List<AccountCodeDE> top = new List<AccountCodeDE>();
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
                top = cmd.Connection.Query<AccountCodeDE>("call Restaurant.SearchAccountCode( '" + whereClause + "')").ToList();
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
