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
    public class DeliveryPriceDAL
    {
        #region Operations
        public bool ManageDeliveryPrice(DeliveryPriceDE price, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageDeliveryPrice";
                cmd.Parameters.AddWithValue("@id", price.Id);
                cmd.Parameters.AddWithValue("@sizeId", price.SizeId);
                cmd.Parameters.AddWithValue("@itemId", price.ItemId);
                cmd.Parameters.AddWithValue("@price", price.Price);
                cmd.Parameters.AddWithValue("@createdOn", price.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", price.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", price.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", price.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", price.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", price.DBoperation.ToString());

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
        public List<DeliveryPriceDE> SearchDeliveryPrices(string whereClause, MySqlCommand cmd = null)
        {
            List<DeliveryPriceDE> top = new List<DeliveryPriceDE>();
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
                top = cmd.Connection.Query<DeliveryPriceDE>("call Restaurant.SearchDeliveryPrice( '" + whereClause + "')").ToList();
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
