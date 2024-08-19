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
    public class KitchenIssuanceDAL
    {
        #region Operations
        public bool ManageKitchenIssuance(KitchenIssuanceDE kitInssuance, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageKitchenIssuance";
                cmd.Parameters.AddWithValue("@id", kitInssuance.Id);
                cmd.Parameters.AddWithValue("@branchId", kitInssuance.BranchId);
                cmd.Parameters.AddWithValue("@storeId", kitInssuance.StoreId);
                cmd.Parameters.AddWithValue("@kitchenId", kitInssuance.KitchenId);
                cmd.Parameters.AddWithValue("@date", kitInssuance.Date);
                cmd.Parameters.AddWithValue("@keyWord", kitInssuance.KeyWord);
                cmd.Parameters.AddWithValue("@createdOn", kitInssuance.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", kitInssuance.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", kitInssuance.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", kitInssuance.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", kitInssuance.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", kitInssuance.DBoperation.ToString());

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
        public List<KitchenIssuanceDE> SearchKitchenIssuance(string whereClause, MySqlCommand cmd = null)
        {
            List<KitchenIssuanceDE> top = new List<KitchenIssuanceDE>();
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
                top = cmd.Connection.Query<KitchenIssuanceDE>("call Restaurant.SearchKitchenIssuance( '" + whereClause + "')").ToList();
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
