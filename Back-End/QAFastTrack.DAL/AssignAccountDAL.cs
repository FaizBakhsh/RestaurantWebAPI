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
    public class AssignAccountDAL
    {
        #region Operations
        public bool ManageAssignAccount(AssignAccountDE assAcnt, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageAssignAccount";
                cmd.Parameters.AddWithValue("@id", assAcnt.Id);
                cmd.Parameters.AddWithValue("@branchId", assAcnt.BranchId);
                cmd.Parameters.AddWithValue("@accountId", assAcnt.AccountId);
                cmd.Parameters.AddWithValue("@accountTypeId", assAcnt.AccountTypeId);
                cmd.Parameters.AddWithValue("@createdOn", assAcnt.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", assAcnt.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", assAcnt.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", assAcnt.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", assAcnt.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", assAcnt.DBoperation.ToString());

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
        public List<AssignAccountDE> SearchAssignAccounts(string whereClause, MySqlCommand cmd = null)
        {
            List<AssignAccountDE> top = new List<AssignAccountDE>();
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
                top = cmd.Connection.Query<AssignAccountDE>("call Restaurant.SearchAssignAccount( '" + whereClause + "')").ToList();
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
