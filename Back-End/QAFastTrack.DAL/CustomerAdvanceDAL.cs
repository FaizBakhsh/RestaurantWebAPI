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
    public class CustomerAdvanceDAL
    {
        #region Operations

        public bool ManageCustomerAdvance ( CustomerAdvanceDE adv, MySqlCommand cmd = null )
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection ();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine ("Connection  has been created");
                else
                    Console.WriteLine ("Connection error");
                cmd.CommandText = "ManageCustomerAdvance";
                cmd.Parameters.AddWithValue ("@id", adv.Id);
                cmd.Parameters.AddWithValue ("@custId", adv.CustId);
                cmd.Parameters.AddWithValue ("@advAmount", adv.AdvAmount);
                cmd.Parameters.AddWithValue ("@advDate", adv.AdvDate);
                cmd.Parameters.AddWithValue ("@createdOn", adv.CreatedOn);
                cmd.Parameters.AddWithValue ("@createdById", adv.CreatedById);
                cmd.Parameters.AddWithValue ("@modifiedOn", adv.ModifiedOn);
                cmd.Parameters.AddWithValue ("@modifiedById", adv.ModifiedById);
                cmd.Parameters.AddWithValue ("@isActive", adv.IsActive);
                cmd.Parameters.AddWithValue ("@DBoperation", adv.DBoperation.ToString ());

                cmd.ExecuteNonQuery ();
                return true;
            }
            catch (Exception ex)
            {

                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
        }
        public bool AlterCustomerAdvance ( CustomerAdvanceDE CustomerAdvance, int? Id = null, MySqlCommand cmd = null )
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection ();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine ("Connection  has been created");
                else
                    Console.WriteLine ("Connection error");
                cmd.CommandText = "AlterCustomerAdvance";
                cmd.Parameters.AddWithValue ("@id", Id);
                cmd.Parameters.AddWithValue ("@filter", CustomerAdvance.DBoperation.ToString ());
                cmd.ExecuteNonQuery ();
                return true;
            }
            catch (Exception)
            {
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
        }
        public List<CustomerAdvanceDE> SearchCustomerAdvances ( string whereClause, MySqlCommand cmd = null )
        {
            List<CustomerAdvanceDE> top = new List<CustomerAdvanceDE> ();
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection ();
                    closeConnectionFlag = true;
                }
                if (cmd.Connection.State == ConnectionState.Open)
                    Console.WriteLine ("Connection  has been created");
                else
                    Console.WriteLine ("Connection error");
                top = cmd.Connection.Query<CustomerAdvanceDE> ("call Restaurant.SearchCustomerAdvance( '" + whereClause + "')").ToList ();
                return top;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
            }
        }

        #endregion
    }
}
