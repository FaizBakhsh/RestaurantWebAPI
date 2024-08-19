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
    public class DineInDAL
    {
        #region Operations

        public bool ManageDineIn(DineInDE dine, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageDineIn";
                cmd.Parameters.AddWithValue("@id", dine.Id);
                cmd.Parameters.AddWithValue("@guest", dine.Guest);
                cmd.Parameters.AddWithValue("@resId", dine.ResId);
                cmd.Parameters.AddWithValue("@waiterId", dine.WaiterId);
                cmd.Parameters.AddWithValue("@tableNo", dine.TableNo);
                cmd.Parameters.AddWithValue("@createdOn", dine.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", dine.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", dine.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", dine.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", dine.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", dine.DBoperation.ToString());

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
        public bool AlterDineIn(DineInDE dine, int? Id = null, MySqlCommand cmd = null)
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
                cmd.CommandText = "AlterDineIn";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@filter", dine.DBoperation.ToString());
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
        public List<DineInDE> SearchDineIns(string whereClause, MySqlCommand cmd = null)
        {
            List<DineInDE> top = new List<DineInDE>();
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
                top = cmd.Connection.Query<DineInDE>("call Restaurant.SearchDineIn( '" + whereClause + "')").ToList();
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
