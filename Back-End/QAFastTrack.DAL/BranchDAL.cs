using Dapper;
using MySql.Data.MySqlClient;
using Restaurant.Core.Entities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.DAL
{
    public class BranchDAL
    {
        #region Operations

        public bool ManageBranch(BranchDE branch, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageBranch";
                cmd.Parameters.AddWithValue("@id", branch.Id);
                cmd.Parameters.AddWithValue ("@clientId", branch.ClientId);
                cmd.Parameters.AddWithValue("@branchEnumTypeId", branch.BranchEnumTypeId);
                cmd.Parameters.AddWithValue("@name", branch.Name);
                cmd.Parameters.AddWithValue("@branchCode", branch.BranchCode);
                cmd.Parameters.AddWithValue("@branchId", branch.BranchId);
                cmd.Parameters.AddWithValue("@chartAccountId", branch.ChartAccountId);
                cmd.Parameters.AddWithValue("@uploadStatus", branch.UploadStatus);
                cmd.Parameters.AddWithValue("@type", branch.Type);
                cmd.Parameters.AddWithValue("@location", branch.Location);
                cmd.Parameters.AddWithValue("@createdOn", branch.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", branch.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", branch.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", branch.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", branch.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", branch.DBoperation.ToString());

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
        public List<BranchDE> SearchBranchs(string whereClause, MySqlCommand cmd = null)
        {
            List<BranchDE> top = new List<BranchDE>();
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
                top = cmd.Connection.Query<BranchDE>("call Restaurant.SearchBranch( '" + whereClause + "')").ToList();
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
