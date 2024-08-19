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
    public class SubCategoryDAL
    {
        #region Operations

        public bool ManageSubCategory(SubCategoryDE subCategory, MySqlCommand? cmd = null)
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
                cmd.CommandText = "ManageSubCategory";
                cmd.Parameters.AddWithValue("@id", subCategory.Id);
                cmd.Parameters.AddWithValue("@subCategoryName", subCategory.SubCategoryName);
                cmd.Parameters.AddWithValue("@categoryId", subCategory.CategoryId);
                cmd.Parameters.AddWithValue("@createdOn", subCategory.CreatedOn);
                cmd.Parameters.AddWithValue("@createdById", subCategory.CreatedById);
                cmd.Parameters.AddWithValue("@modifiedOn", subCategory.ModifiedOn);
                cmd.Parameters.AddWithValue("@modifiedById", subCategory.ModifiedById);
                cmd.Parameters.AddWithValue("@isActive", subCategory.IsActive);
                cmd.Parameters.AddWithValue("@DBoperation", subCategory.DBoperation.ToString());

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
        public bool AlterSubCategory(SubCategoryDE subCategory, int? Id = null, MySqlCommand? cmd = null)
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
                cmd.CommandText = "AlterSubCategory";
                cmd.Parameters.AddWithValue("@id", Id);
                cmd.Parameters.AddWithValue("@filter", subCategory.DBoperation.ToString());
                cmd.ExecuteNonQuery();
                return true;
            }
            catch (Exception exp)
            {
               throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<SubCategoryDE> SearchSubCategorys(string whereClause, MySqlCommand? cmd = null)
        {
            List<SubCategoryDE> top = new List<SubCategoryDE>();
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
                top = cmd.Connection.Query<SubCategoryDE>("call Restaurant.SearchSubCategory( '" + whereClause + "')").ToList();
                return top;
            }
            catch (Exception exp)
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
