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
    public class StaffDAL
    {
        #region Operations

        public bool ManageStaff(StaffDE staff, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageStaff";
                cmd.Parameters.AddWithValue("@id", staff.Id);
                cmd.Parameters.AddWithValue ("@clientId", staff.ClientId);
                cmd.Parameters.AddWithValue("@name", staff.Name);
                cmd.Parameters.AddWithValue("@fatherName", staff.FatherName);
                cmd.Parameters.AddWithValue("@typeId", staff.TypeId);
                cmd.Parameters.AddWithValue("@createdOn", staff.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", staff.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", staff.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", staff.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", staff.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", staff.DBoperation.ToString());

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
        public List<StaffDE> SearchStaffs(string whereClause, MySqlCommand cmd = null)
        {
            List<StaffDE> top = new List<StaffDE>();
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
                top = cmd.Connection.Query<StaffDE>("call Restaurant.SearchStaff( '" + whereClause + "')").ToList();
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
