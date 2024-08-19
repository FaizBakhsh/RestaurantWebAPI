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
    public class ServiceChargesDAL
    {
        #region Operations
        public bool ManageServiceCharges(ServiceChargesDE svcChrgs, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageServiceCharges";
                cmd.Parameters.AddWithValue("@id", svcChrgs.Id);
                cmd.Parameters.AddWithValue ("@clientId", svcChrgs.ClientId);
                cmd.Parameters.AddWithValue("@name", svcChrgs.Name);
                cmd.Parameters.AddWithValue("@description", svcChrgs.Description);
                cmd.Parameters.AddWithValue("@orderTypeId", svcChrgs.OrderTypeId);
                cmd.Parameters.AddWithValue ("@paymentTypeId", svcChrgs.PaymentTypeId);
                cmd.Parameters.AddWithValue("@percentage", svcChrgs.Percentage);
                cmd.Parameters.AddWithValue("@createdOn", svcChrgs.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", svcChrgs.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", svcChrgs.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", svcChrgs.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", svcChrgs.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", svcChrgs.DBoperation.ToString());

                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception )
            {
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<ServiceChargesDE> SearchServiceChargess(string whereClause, MySqlCommand cmd = null)
        {
            List<ServiceChargesDE> top = new List<ServiceChargesDE>();
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
                top = cmd.Connection.Query<ServiceChargesDE>("call Restaurant.SearchServiceCharges( '" + whereClause + "')").ToList();
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
