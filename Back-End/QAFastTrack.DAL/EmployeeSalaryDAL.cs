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
    public class EmployeeSalaryDAL
    {
        #region Operations
        public bool ManageEmployeeSalary(EmployeeSalaryDE empSal, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageEmployeeSalary";
                cmd.Parameters.AddWithValue("@id", empSal.Id);
                cmd.Parameters.AddWithValue ("@clientId", empSal.ClientId);
                cmd.Parameters.AddWithValue("@employeeId", empSal.EmployeeId);
                cmd.Parameters.AddWithValue("@amount", empSal.Amount);
                cmd.Parameters.AddWithValue("@date", empSal.Date);
                cmd.Parameters.AddWithValue("@createdOn", empSal.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", empSal.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", empSal.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", empSal.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", empSal.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", empSal.DBoperation.ToString());

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
        public List<EmployeeSalaryDE> SearchEmployeeSalarys(string whereClause, MySqlCommand cmd = null)
        {
            List<EmployeeSalaryDE> top = new List<EmployeeSalaryDE>();
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
                top = cmd.Connection.Query<EmployeeSalaryDE>("call Restaurant.SearchEmployeeSalary( '" + whereClause + "')").ToList();
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
