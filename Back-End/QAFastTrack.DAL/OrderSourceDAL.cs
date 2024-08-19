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
    public class OrderSourceDAL
    {
        #region Operations
        public bool ManageOrderSource(OrderSourceDE orderSource, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageOrderSource";
                cmd.Parameters.AddWithValue("@id", orderSource.Id);
                cmd.Parameters.AddWithValue ("@clientId", orderSource.ClientId);
                cmd.Parameters.AddWithValue("@name", orderSource.Name);
                cmd.Parameters.AddWithValue("@priceIncreament", orderSource.PriceIncreament);
                cmd.Parameters.AddWithValue("@printInvoice", orderSource.PrintInvoice);
                cmd.Parameters.AddWithValue("@createdOn", orderSource.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", orderSource.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", orderSource.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", orderSource.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", orderSource.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", orderSource.DBoperation.ToString());

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
        public List<OrderSourceDE> SearchOrderSources(string whereClause, MySqlCommand cmd = null)
        {
            List<OrderSourceDE> top = new List<OrderSourceDE>();
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
                top = cmd.Connection.Query<OrderSourceDE>("call Restaurant.SearchOrderSource( '" + whereClause + "')").ToList();
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
