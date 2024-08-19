using Dapper;
using MySql.Data.MySqlClient;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.DAL
{
    public class ThemeDataDAL
    {
        #region Operations

        public bool ManageThemeData ( ThemeDataDE ThemeData, MySqlCommand? cmd = null )
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
                cmd.CommandText = "ManageThemeData";
                cmd.Parameters.AddWithValue ("@id", ThemeData.Id);
                cmd.Parameters.AddWithValue ("@clientId", ThemeData.ClientId);
                cmd.Parameters.AddWithValue ("@source", ThemeData.Source);
                cmd.Parameters.AddWithValue ("@DBoperation", ThemeData.DBoperation.ToString ());

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
        public List<ThemeDataDE> SearchThemeDatas ( string whereClause, MySqlCommand? cmd = null )
        {
            List<ThemeDataDE> top = new List<ThemeDataDE> ();
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
                top = cmd.Connection.Query<ThemeDataDE> ("call Restaurant.SearchThemeData( '" + whereClause + "')").ToList ();
                return top;
            }
            catch (Exception exp)
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
