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
    public class EmployeeSaleDAL
    {
        #region Operations

        public bool ManageEmployeeSale(EmployeeSaleDE employeeSale, MySqlCommand cmd = null)
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
                cmd.CommandText = "ManageEmployeeSale";
                cmd.Parameters.AddWithValue("@id", employeeSale.Id);
                cmd.Parameters.AddWithValue ("@clientId", employeeSale.ClientId);
                cmd.Parameters.AddWithValue("@employeeId", employeeSale.EmployeeId);
                cmd.Parameters.AddWithValue("@amount",employeeSale.Amount);
                cmd.Parameters.AddWithValue("@date", employeeSale.Date);
                cmd.Parameters.AddWithValue("@createdOn", employeeSale.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", employeeSale.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", employeeSale.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", employeeSale.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", employeeSale.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", employeeSale.DBoperation.ToString());

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
        public List<EmployeeSaleDE> SearchEmployeeSales(string whereClause, MySqlCommand cmd = null)
        {
            List<EmployeeSaleDE> top = new List<EmployeeSaleDE>();
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
                top = cmd.Connection.Query<EmployeeSaleDE>("call Restaurant.SearchEmployeeSale( '" + whereClause + "')").ToList();
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
