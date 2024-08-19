using MySql.Data.MySqlClient;
using NLog;
using Restaurant.Core.Entities;
using Restaurant.Core.Enums;
using Restaurant.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Restaurant.Service
{
    public class CategoryService
    {

        #region Class Members/Class Variables

        private CategoryDAL _categoryDAL;
        private SubCategoryDAL _subCategoryDAL;
        private CoreDAL _corDAL;
        private ItemDAL _itemDAL;
        private Logger _logger; 

        #endregion
        #region Constructors
        public CategoryService()
        {
            _itemDAL = new ItemDAL();
            _categoryDAL = new CategoryDAL();
            _subCategoryDAL = new SubCategoryDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }


        #endregion
        #region Category
        public bool ManagementCategory(CategoryDE mod)
        {
            bool check = false;
            MySqlCommand cmd = null;
            try
            {
              
                cmd = RestaurantDataContext.OpenMySqlConnection();
                RestaurantDataContext.StartTransaction(cmd);

                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.category.ToString());
                    _categoryDAL.ManageCategory(mod);
                    foreach (var value in mod.SubCategories)
                    {
                        value.Id = _corDAL.GetnextId(TableNames.subcategory.ToString());
                        value.CategoryId = mod.Id;
                        if(value.DBoperation==0)
                        value.DBoperation = mod.DBoperation;
                        check = _subCategoryDAL.ManageSubCategory(value);
                    }
                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _categoryDAL.ManageCategory(mod);
                    foreach (var value in mod.SubCategories)
                    {

                        switch (value.DBoperation)
                        {
                            case DBoperations.Insert:
                                {
                                    value.Id = _corDAL.GetnextId(TableNames.subcategory.ToString());
                                    value.CategoryId = mod.Id;
                                    if (value.DBoperation == 0)
                                        value.DBoperation = mod.DBoperation;
                                    check = _subCategoryDAL.ManageSubCategory(value);
                                }
                                break;
                            case DBoperations.Delete:
                                check = _subCategoryDAL.AlterSubCategory(value, value.Id);
                                break;
                            case DBoperations.DeActivate:
                                check = _subCategoryDAL.AlterSubCategory(value, value.Id);
                                break;
                        }
                    }
                }             
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _categoryDAL.AlterCategory(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _categoryDAL.AlterCategory(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _categoryDAL.AlterCategory(mod, mod.Id);
                }
                if (check == true) {
                    mod.DBoperation = DBoperations.NA;
                    RestaurantDataContext.EndTransaction(cmd);                  
                }
                return check;
            }
            catch(Exception ex) 
            {
               
                _logger.Error(ex);
                RestaurantDataContext.CancelTransaction(cmd);
                throw;   
            }
            finally
            {
                if (cmd != null)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
      
              
        }
        public List<CategoryDE> SearchCategorys(CategoryDE mod)
        {
            List<CategoryDE> Category = new List<CategoryDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();


                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.CategoryName != default)
                    whereClause += $" AND CategoryName like ''" + mod.CategoryName + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Category = _categoryDAL.SearchCategorys(whereClause);
                foreach (var line in Category)
                {
                    whereClause = "where 1=1";
                    line.SubCategories = _subCategoryDAL.SearchSubCategorys(whereClause += $" AND CategoryId={line.Id} AND IsActive ={true}");
                    foreach (var subCategory in line.SubCategories)
                    {
                        whereClause = "where 1=1";
                        subCategory.Items = _itemDAL.SearchItems(whereClause += $" AND SubCategoryId={subCategory.Id} AND IsActive ={true}");
                    }
                }
                #endregion


            }
            catch (Exception exp)
            {
                _logger.Error(exp);
                throw ;

            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
            return Category;
        }

        #endregion
    }
}
