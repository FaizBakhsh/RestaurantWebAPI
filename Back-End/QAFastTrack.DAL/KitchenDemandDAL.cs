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
    public class KitchenDemandDAL
    {
        #region Operations

        public bool ManageKitchenDemand(KitchenDemandDE kitDemand, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageKitchenDemand";
                cmd.Parameters.AddWithValue("@id", kitDemand.Id);
                cmd.Parameters.AddWithValue("@categoryId", kitDemand.CategoryId);
                cmd.Parameters.AddWithValue("@kitchenId", kitDemand.KitchenId);
                cmd.Parameters.AddWithValue("@demandNo", kitDemand.DemandNo);
                cmd.Parameters.AddWithValue("@date", kitDemand.Date);
                cmd.Parameters.AddWithValue("@item", kitDemand.Item);
                cmd.Parameters.AddWithValue("@createdOn", kitDemand.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", kitDemand.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", kitDemand.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", kitDemand.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", kitDemand.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", kitDemand.DBoperation.ToString());

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
        public List<KitchenDemandDE> SearchKitchenDemands(string whereClause, MySqlCommand cmd = null)
        {
            List<KitchenDemandDE> top = new List<KitchenDemandDE>();
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
                top = cmd.Connection.Query<KitchenDemandDE>("call Restaurant.SearchKitchenDemand( '" + whereClause + "')").ToList();
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
