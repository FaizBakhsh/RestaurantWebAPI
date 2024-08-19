using Restaurant.Core.Entities;
using System;
using System.Collections.Generic;
using Dapper;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.DAL
{
    public class MenuGroupDAL
    {
        #region Operations

        public bool ManageMenuGroup ( MenuGroupDE group, MySqlCommand cmd = null )
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
                cmd.CommandText = "ManageMenuGroup";
                cmd.Parameters.AddWithValue ("@id", group.Id);
                cmd.Parameters.AddWithValue ("@clientId", group.ClientId);
                cmd.Parameters.AddWithValue ("@branchId", group.BranchId);
                cmd.Parameters.AddWithValue ("@name", group.Name);
                cmd.Parameters.AddWithValue ("@description", group.Description);
                cmd.Parameters.AddWithValue ("@isPrintKitchen", group.IsPrintKitchen);
                cmd.Parameters.AddWithValue ("@subGroup", group.SubGroup);
                cmd.Parameters.AddWithValue ("@createdOn", group.CreatedOn);
                cmd.Parameters.AddWithValue ("@createdById", group.CreatedById);
                cmd.Parameters.AddWithValue ("@modifiedOn", group.ModifiedOn);
                cmd.Parameters.AddWithValue ("@modifiedById", group.ModifiedById);
                cmd.Parameters.AddWithValue ("@isActive", group.IsActive);
                cmd.Parameters.AddWithValue ("@DBoperation", group.DBoperation.ToString ());

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
         public List<MenuGroupDE> SearchMenuGroups ( string whereClause, MySqlCommand cmd = null )
        {
            List<MenuGroupDE> top = new List<MenuGroupDE> ();
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
                top = cmd.Connection.Query<MenuGroupDE> ("call Restaurant.SearchMenuGroup( '" + whereClause + "')").ToList ();
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
