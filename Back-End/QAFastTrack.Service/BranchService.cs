﻿using MySql.Data.MySqlClient;
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
    public class BranchService
    {
        #region Class Members/Class Variables

        private BranchDAL _branchDAL;
        private CoreDAL _corDAL;
        private Logger _logger;

        #endregion
        #region Constructors
        public BranchService()
        {
            _branchDAL = new BranchDAL();
            _corDAL = new CoreDAL();
            _logger = LogManager.GetLogger("fileLogger");
        }
        #endregion
        #region Branch
        public bool ManagementBranch(BranchDE mod)
        {
            bool retVal = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                if (mod.DBoperation == DBoperations.Insert)
                    mod.Id = _corDAL.GetNextIdByClient (TableNames.branch.ToString (), mod.ClientId, "ClientId");
                retVal = _branchDAL.ManageBranch(mod);
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
        public List<BranchDE> SearchBranchs(BranchDE mod)
        {
            List<BranchDE> Branchs = new List<BranchDE>();
            bool closeConnectionFlag = false;
            MySqlCommand cmd = null;
            try
            {
                cmd = RestaurantDataContext.OpenMySqlConnection();
                closeConnectionFlag = true;

                #region Search

                string whereClause = " Where 1=1";
                if (mod.Id != default)
                    whereClause += $" AND Id={mod.Id}";
                if (mod.ClientId != default)
                    whereClause += $" AND ClientId={mod.ClientId}";
                if (mod.Name != default)
                    whereClause += $" AND Name like ''" + mod.Name + "''";
                if (mod.IsActive != default)
                    whereClause += $" AND IsActive ={mod.IsActive}";
                Branchs = _branchDAL.SearchBranchs(whereClause);

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
            return Branchs;
        }
        #endregion
    }
}