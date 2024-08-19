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
    public class ShiftDAL
    {
        #region Operations

        public bool ManageShift(ShiftDE shift, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageShift";
                cmd.Parameters.AddWithValue("@id", shift.Id);
                cmd.Parameters.AddWithValue ("@clientId", shift.ClientId);
                cmd.Parameters.AddWithValue ("@shiftTypeId", shift.ShiftTypeId);
                cmd.Parameters.AddWithValue("@shiftStatusId", shift.ShiftStatusId);
                cmd.Parameters.AddWithValue("@shiftEndUserId", shift.ShiftEndUserId);
                cmd.Parameters.AddWithValue ("@shiftStartUserId", shift.ShiftStartUserId);
                cmd.Parameters.AddWithValue ("@terminalId", shift.TerminalId);
                cmd.Parameters.AddWithValue ("@dayId", shift.DayId);
                cmd.Parameters.AddWithValue ("@floatingCash", shift.FloatingCash);
                cmd.Parameters.AddWithValue("@shiftEndCash", shift.ShiftEndCash);
                cmd.Parameters.AddWithValue("@startTime", shift.StartTime);
                cmd.Parameters.AddWithValue("@endTime", shift.EndTime);
                cmd.Parameters.AddWithValue("@createdOn", shift.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", shift.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", shift.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", shift.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", shift.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", shift.DBoperation.ToString());

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
        public bool AlterShift(ShiftDE shift, int? Id = null, MySqlCommand cmd = null)
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
                cmd.CommandText = "AlterShift";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@filter", shift.DBoperation.ToString());
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
        public List<ShiftDE> SearchShifts(string whereClause, MySqlCommand cmd = null)
        {
            List<ShiftDE> top = new List<ShiftDE>();
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
                top = cmd.Connection.Query<ShiftDE>("call Restaurant.SearchShift( '" + whereClause + "')").ToList();
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
