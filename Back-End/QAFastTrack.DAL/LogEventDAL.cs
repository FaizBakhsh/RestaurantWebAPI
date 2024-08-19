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
    public class LogEventDAL
    {
        #region Operations

        public bool ManageLogEvent ( LogEventDE LogEvent, MySqlCommand? cmd  )
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
                cmd.CommandText = "ManageLogEvent";
                cmd.Parameters.AddWithValue ("@id", LogEvent.Id);
                cmd.Parameters.AddWithValue ("@clientId", LogEvent.ClientId);
                cmd.Parameters.AddWithValue ("@userId", LogEvent.UserId);
                cmd.Parameters.AddWithValue ("@actionId", LogEvent.ActionId);
                cmd.Parameters.AddWithValue ("@message", LogEvent.Message);
                cmd.Parameters.AddWithValue ("@date", LogEvent.Date);
                cmd.Parameters.AddWithValue ("@time", LogEvent.Time);
                cmd.Parameters.AddWithValue ("@createdOn", LogEvent.CreatedOn);
                cmd.Parameters.AddWithValue ("@createdById", LogEvent.CreatedById);
                cmd.Parameters.AddWithValue ("@modifiedOn", LogEvent.ModifiedOn);
                cmd.Parameters.AddWithValue ("@modifiedById", LogEvent.ModifiedById);
                cmd.Parameters.AddWithValue ("@isActive", LogEvent.IsActive);
                cmd.Parameters.AddWithValue ("@DBoperation", LogEvent.DBoperation.ToString ());

                cmd.ExecuteNonQuery ();
                return true;
            }
            catch (Exception )
            {
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection (cmd);
                cmd.Parameters.Clear ();
            }
        }
        public List<LogEventDE> SearchLogEvents ( string whereClause, MySqlCommand cmd = null )
        {
            List<LogEventDE> top = new List<LogEventDE> ();
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
                top = cmd.Connection.Query<LogEventDE> ("call Restaurant.SearchLogEvent( '" + whereClause + "')").ToList ();
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
