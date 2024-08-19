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
    public class SubRecipeService
    {
        #region Class Members/Class Variables

        private SubRecipeDAL _subRecipeDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public SubRecipeService()
        {
            _subRecipeDAL = new SubRecipeDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region SubRecipe
        public bool ManagementSubRecipe(SubRecipeDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.subrecipe.ToString (), mod.ClientId, "ClientId");
                retVal = _subRecipeDAL.ManageSubRecipe(mod);
                if (retVal == true)
                    mod.DBoperation = DBoperations.NA;
                return retVal;
            }
            catch (Exception ex)
            {
                _logger.Error(ex);
                throw;
            }
            finally
            {
                if (cmd != null)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
        }
        public List<SubRecipeDE> SearchSubRecipe(SubRecipeDE mod)
        {
            List<SubRecipeDE> SubRecipes = new List<SubRecipeDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();

                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.ClientId != default)
                    whereClause += $" AND ClientId={mod.ClientId}";
                if (mod.GroupId != default && mod.GroupId != 0)
                    whereClause += $" AND GroupId={mod.GroupId}";
                if (mod.ItemId != default && mod.ItemId != 0)
                    whereClause += $" AND ItemId={mod.ItemId}";
                if (mod.SizeId != default && mod.SizeId != 0)
                    whereClause += $" AND SizeId={mod.SizeId}";
                if (mod.SubItemId != default && mod.SubItemId != 0)
                    whereClause += $" AND SubItemId={mod.SubItemId}";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                SubRecipes = _subRecipeDAL.SearchSubRecipe(whereClause);

                #endregion

            }
            catch (Exception exp)
            {
                _logger.Error(exp);
                throw;
            }
            finally
            {
                if (closeConnectionFlag)
                    RestaurantDataContext.CloseMySqlConnection(cmd);
            }
            return SubRecipes;
        }
        #endregion
    }
}
