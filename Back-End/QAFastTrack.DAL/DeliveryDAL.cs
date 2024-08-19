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
    public class DeliveryDAL
    {
        #region Operations

        public bool ManageDelivery(DeliveryDE delivery, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageDelivery";
                cmd.Parameters.AddWithValue("@id", delivery.Id);
                cmd.Parameters.AddWithValue("@sourceId", delivery.SourceId);
                cmd.Parameters.AddWithValue("@phoneNo", delivery.PhoneNo);
                cmd.Parameters.AddWithValue("@address", delivery.Address);
                cmd.Parameters.AddWithValue("@name", delivery.Name);
                cmd.Parameters.AddWithValue("@note", delivery.Note);
                cmd.Parameters.AddWithValue("@createdOn", delivery.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", delivery.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", delivery.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", delivery.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", delivery.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", delivery.DBoperation.ToString());

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
        public bool AlterDelivery(DeliveryDE delivery, int? Id = null, MySqlCommand cmd = null)
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
                cmd.CommandText = "AlterDelivery";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@filter", delivery.DBoperation.ToString());
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
        public List<DeliveryDE> SearchDelivery(string whereClause, MySqlCommand cmd = null)
        {
            List<DeliveryDE> top = new List<DeliveryDE>();
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
                top = cmd.Connection.Query<DeliveryDE>("call Restaurant.SearchDelivery( '" + whereClause + "')").ToList();
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
