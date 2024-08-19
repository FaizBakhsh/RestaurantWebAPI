using Dapper;
using MySql.Data.MySqlClient;
using Restaurant.Core.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.DAL
{
    public class EmployeeAttendanceDAL
    {
        #region Operations
        public bool ManageEmployeeAttendance(EmployeeAttendanceDE atnd, MySqlCommand cmd = null)
        {
            bool closeConnectionFlag = false;
            try
            {
                if (cmd == null)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                cmd.CommandText = "ManageEmployeeAttendance";
                cmd.Parameters.AddWithValue("@id", atnd.Id);
                cmd.Parameters.AddWithValue ("@clientId", atnd.ClientId);
                cmd.Parameters.AddWithValue("@employeeId", atnd.EmployeeId);
                cmd.Parameters.AddWithValue("@days", atnd.Days);
                cmd.Parameters.AddWithValue("@month", atnd.Month);
                cmd.Parameters.AddWithValue("@createdOn", atnd.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", atnd.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", atnd.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", atnd.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", atnd.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", atnd.DBoperation.ToString());
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
        public List<EmployeeAttendanceDE> SearchEmployeeAttendance(string whereCaluse, MySqlCommand cmd=null)
        {
            bool closeConnectionFlag = false;
            List<EmployeeAttendanceDE> atndList = new List<EmployeeAttendanceDE>();
            try
            {
                if (cmd == null)
                {
                    cmd = RestaurantDataContext.OpenMySqlConnection();
                    closeConnectionFlag = true;
                }
                atndList = cmd.Connection.Query<EmployeeAttendanceDE>("call Restaurant.SearchEmployeeAttendance('" + whereCaluse + "')").ToList();
                return atndList;
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
