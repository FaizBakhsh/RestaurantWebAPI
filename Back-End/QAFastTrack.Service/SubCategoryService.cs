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
    public class SubCategoryService
    {

        #region Class Members/Class Variables

        private SubCategoryDAL _subCategoryDAL;
        private ItemDAL _itemDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public SubCategoryService()
        {
            _itemDAL = new ItemDAL();
            _subCategoryDAL = new SubCategoryDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }


        #endregion
        #region SubCategory
        public bool ManagementSubCategory(SubCategoryDE mod)
        {
            bool check = false;
            MySqlCommand cmd = null;
            try
            {
               
                cmd = RestaurantDataContext.OpenMySqlConnection();
                RestaurantDataContext.StartTransaction(cmd);

                if (mod.DBoperation == DBoperations.Insert)
                {
                    mod.Id = _corDAL.GetnextId(TableNames.subcategory.ToString());
                    check = _subCategoryDAL.ManageSubCategory(mod);
                    foreach (var value in mod.Items)
                    {
                        value.Id = _corDAL.GetnextId(TableNames.item.ToString());
                        value.CategoryId = mod.CategoryId;
                        value.SubCategoryId = mod.Id;
                        if (value.DBoperation == 0)
                            value.DBoperation = mod.DBoperation;
                        check = _itemDAL.ManageItem(value);
                    }
                }
                else if (mod.DBoperation == DBoperations.Update)
                {
                    check = _subCategoryDAL.ManageSubCategory(mod);
                    foreach (var value in mod.Items)
                    {

                        switch (value.DBoperation)
                        {
                            case DBoperations.Insert:
                                {                                  
                                        value.Id = _corDAL.GetnextId(TableNames.item.ToString());
                                        value.CategoryId = mod.CategoryId;
                                        value.SubCategoryId = mod.Id;
                                        check = _itemDAL.ManageItem(value);                           
                                }
                                break;
                        }
                    }
                }
                else if (mod.DBoperation == DBoperations.Delete)
                {
                    check = _subCategoryDAL.AlterSubCategory(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.Activate)
                {
                    check = _subCategoryDAL.AlterSubCategory(mod, mod.Id);
                }
                else if (mod.DBoperation == DBoperations.DeActivate)
                {
                    check = _subCategoryDAL.AlterSubCategory(mod, mod.Id);
                }
                if (check == true)
                    mod.DBoperation = DBoperations.NA;
                RestaurantDataContext.EndTransaction(cmd);
               
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
            return check;
        }
        public List<SubCategoryDE> SearchSubCategorys(SubCategoryDE mod)
        {
            List<SubCategoryDE> SubCategory = new List<SubCategoryDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();


                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.CategoryId != default)
                    whereClause += $" AND CategoryId={mod.CategoryId}";
                if (mod.SubCategoryName != default)
                    whereClause += $" AND SubCategoryName like ''" + mod.SubCategoryName + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                SubCategory = _subCategoryDAL.SearchSubCategorys(whereClause);
                foreach (var line in SubCategory)
                {
                    whereClause = "where 1=1";
                    line.Items = _itemDAL.SearchItems(whereClause += $" AND SubCategoryId={line.Id} AND CategoryId={line.CategoryId}  AND IsActive ={true}");
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
            return SubCategory;
        }

        #endregion
    }
}
