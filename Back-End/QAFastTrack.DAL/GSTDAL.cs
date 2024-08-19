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
    public class GSTDAL
    {
        #region Operations
        public bool ManageGST(GSTDE gst, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageGST";
                cmd.Parameters.AddWithValue("@id", gst.Id);
                cmd.Parameters.AddWithValue ("@clientId", gst.ClientId);
                cmd.Parameters.AddWithValue("@gST", gst.GST);
                cmd.Parameters.AddWithValue("@receiptTitle", gst.ReceiptTitle);
                cmd.Parameters.AddWithValue("@paymentTypeId", gst.PaymentTypeId);
                cmd.Parameters.AddWithValue("@createdOn", gst.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", gst.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", gst.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", gst.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", gst.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", gst.DBoperation.ToString());

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
        public List<GSTDE> SearchGSTs(string whereClause, MySqlCommand cmd = null)
        {
            List<GSTDE> top = new List<GSTDE>();
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
                top = cmd.Connection.Query<GSTDE>("call Restaurant.SearchGST( '" + whereClause + "')").ToList();
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
