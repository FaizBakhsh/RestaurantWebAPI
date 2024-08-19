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
    public class StoreDAL
    {
        #region Operations
        public bool ManageStore(StoreDE store, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageStore";
                cmd.Parameters.AddWithValue("@id", store.Id);
                cmd.Parameters.AddWithValue ("@clientId", store.ClientId);
                cmd.Parameters.AddWithValue("@storeCode", store.StoreCode);
                cmd.Parameters.AddWithValue("@storeName", store.StoreName);
                cmd.Parameters.AddWithValue("@branchId", store.BranchId);
                cmd.Parameters.AddWithValue("@uploadStatus", store.UploadStatus);
                cmd.Parameters.AddWithValue("@createdOn", store.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", store.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", store.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", store.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", store.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", store.DBoperation.ToString());

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
        public List<StoreDE> SearchStores(string whereClause, MySqlCommand cmd = null)
        {
            List<StoreDE> top = new List<StoreDE>();
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
                top = cmd.Connection.Query<StoreDE>("call Restaurant.SearchStore( '" + whereClause + "')").ToList();
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
