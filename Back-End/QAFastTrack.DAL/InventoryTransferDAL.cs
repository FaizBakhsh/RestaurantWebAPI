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
    public class InventoryTransferDAL
    {
        #region Operations
        public bool ManageInventoryTransfer(InventoryTransferDE invtTrans, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageInventoryTransfer";
                cmd.Parameters.AddWithValue("@id", invtTrans.Id);
                cmd.Parameters.AddWithValue("@branchId", invtTrans.BranchId);
                cmd.Parameters.AddWithValue("@keyWord", invtTrans.KeyWord);
                cmd.Parameters.AddWithValue("@date", invtTrans.Date);
                cmd.Parameters.AddWithValue("@createdOn", invtTrans.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", invtTrans.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", invtTrans.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", invtTrans.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", invtTrans.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", invtTrans.DBoperation.ToString());

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
        public List<InventoryTransferDE> SearchInventoryTransfers(string whereClause, MySqlCommand cmd = null)
        {
            List<InventoryTransferDE> top = new List<InventoryTransferDE>();
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
                top = cmd.Connection.Query<InventoryTransferDE>("call Restaurant.SearchInventoryTransfer( '" + whereClause + "')").ToList();
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
