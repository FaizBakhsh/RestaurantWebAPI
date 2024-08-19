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
    public class DiscountVouchersDAL
    {
        #region Operations

        public bool ManageDiscountVouchers(DiscountVouchersDE discount, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageDiscountVouchers";
                cmd.Parameters.AddWithValue("@id", discount.Id);
                cmd.Parameters.AddWithValue ("@clientId", discount.ClientId);
                cmd.Parameters.AddWithValue("@keyValue", discount.KeyValue);
                cmd.Parameters.AddWithValue("@value", discount.Value);
                cmd.Parameters.AddWithValue("@createdOn", discount.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", discount.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", discount.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", discount.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", discount.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", discount.DBoperation.ToString());

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
        public bool AlterDiscountVouchers(DiscountVouchersDE discount, int? Id = null, MySqlCommand cmd = null)
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
                cmd.CommandText = "AlterDiscountVouchers";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@filter", discount.DBoperation.ToString());
                cmd.ExecuteNonQuery();
                return true;
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
        public List<DiscountVouchersDE> SearchDiscountVouchers(string whereClause, MySqlCommand cmd = null)
        {
            List<DiscountVouchersDE> top = new List<DiscountVouchersDE>();
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
                top = cmd.Connection.Query<DiscountVouchersDE>("call Restaurant.SearchDiscountVouchers( '" + whereClause + "')").ToList();
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
