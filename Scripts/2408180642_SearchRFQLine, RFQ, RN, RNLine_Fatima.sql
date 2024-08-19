/*
 Navicat Premium Data Transfer

 Source Server         : MySql
 Source Server Type    : MySQL
 Source Server Version : 80020 (8.0.20)
 Source Host           : localhost:3306
 Source Schema         : restaurant

 Target Server Type    : MySQL
 Target Server Version : 80020 (8.0.20)
 File Encoding         : 65001

 Date: 18/08/2024 18:43:32
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Procedure structure for INV_Search_RFQ
-- ----------------------------
DROP PROCEDURE IF EXISTS `INV_Search_RFQ`;
delimiter ;;
CREATE PROCEDURE `INV_Search_RFQ`(in prm_whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT 
          
           rfq.ClientId
		   ,rfq.Id
           ,rfq.IsReferece
           ,rfq.Title
           ,rfq.RFQValidity 
           ,rfq.RequestNoteNo
           ,rfq.DeliveryDate
           ,rfq.StatusId
           ,rfq.Description
           ,rfq.CreatedOn
           ,rfq.CreatedById
           ,rfq.ModifiedOn
           ,rfq.ModifiedById
           ,type.Name as Status
           ,rfq.IsActive 
             FROM `INV_RFQ` as rfq  
			 left join enumline as type on (type.Id= rfq.StatusId  )'
			;
    set @querystr= concat(@querystr,prm_whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for INV_Search_RFQLine
-- ----------------------------
DROP PROCEDURE IF EXISTS `INV_Search_RFQLine`;
delimiter ;;
CREATE PROCEDURE `INV_Search_RFQLine`(in whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT 
          
           line.ClientId
		       ,line.Id
           ,line.RFQId
           ,line.ItemId
					 ,item.ItemName as Item
					 ,`group`.Name as `Group`
					 ,category.Name as Category
					 ,subcategory.Name as Type
           ,line.CreatedOn
           ,line.CreatedById
           ,line.ModifiedOn
           ,line.ModifiedById
           ,line.IsActive 
             FROM INV_RFQLine as line 
						  left join item  on (item.Id= line.ItemId and  item.ClientId=line.ClientId)
							
							LEFT JOIN `enumline` `group` ON (`group`.`Id` = `item`.`GroupId` 
													AND  `group`.`ClientId` = `line`.`ClientId` )
							LEFT JOIN `enumline` `category` ON (`category`.`Id` = `item`.`CategoryId` 
													AND  `category`.`ClientId` = `line`.`ClientId` )
							LEFT JOIN `enumline` `subcategory` ON (`subcategory`.`Id` =    `item`.`SubCategoryId` AND `subcategory`.`ClientId` = `line`.`ClientId` )
           ';
    set @querystr= concat(@querystr,whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for INV_Search_RN
-- ----------------------------
DROP PROCEDURE IF EXISTS `INV_Search_RN`;
delimiter ;;
CREATE PROCEDURE `INV_Search_RN`(in prm_whereClause varchar(5000))
BEGIN
     set @querystr ='SELECT 
          
           rn.ClientId
		       ,rn.Id
           ,rn.Title
           ,rn.RequiredBefore
           ,rn.TypeId
           ,rn.CategoryId
           ,rn.ReasonId
           ,rn.RequesterTypeId
           ,rn.RequesterId
           ,rn.StatusId
           ,rn.Description
           ,rn.CreatedOn
           ,rn.CreatedById
           ,rn.ModifiedOn
           ,rn.ModifiedById
           ,cat.Name as Category
            ,reason.Name as Reason
           ,rType.Name as RequesterType
           ,st.Name as Status
            ,type.Name as Type
       
           ,rn.IsActive 
           FROM `INV_RN` as rn 
           	 left join enumline as type on (type.Id= rn.TypeId and type.ClientId=0)
			 
			       left join enumline as cat on (cat.Id= rn.CategoryId and cat.ClientId=0)
             
             left join enumline as reason on (reason.Id= rn.ReasonId and  reason.ClientId=rn.ClientId)
			 
			       left join enumline as rType on (rType.Id= rn.RequesterTypeId and rType.ClientId=0)
           
           	 left join enumline as st on (st.Id= rn.StatusId and st.ClientId=0)
                 
                 
           '
			;
    set @querystr= concat(@querystr,prm_whereClause);
	PREPARE stmt1 
	FROM
		@querystr;
	EXECUTE stmt1;
	DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for INV_Search_RNLine
-- ----------------------------
DROP PROCEDURE IF EXISTS `INV_Search_RNLine`;
delimiter ;;
CREATE PROCEDURE `INV_Search_RNLine`(IN whereClause VARCHAR(5000))
BEGIN
    SET @querystr = 'SELECT 
          
            line.ClientId
		       ,line.Id
           ,line.RNId
           ,line.ItemId
					 ,item.ItemName as item
					 ,unit.Name as UOM
           ,line.RequestedQty
           ,line.CreatedOn
           ,line.CreatedById
           ,line.ModifiedOn
           ,line.ModifiedById
           ,line.IsActive 
             FROM INV_RNLine as line
						  left join item  on (item.Id= line.ItemId and  item.ClientId=line.ClientId)
							LEFT JOIN `enumline` `unit` ON (`unit`.`Id` = `item`.`UOMId` 
							AND `unit`.`ClientId` = line.ClientId )
   ';

    SET @querystr = CONCAT(@querystr, whereClause);

    PREPARE stmt1 FROM @querystr;
    EXECUTE stmt1;
    DEALLOCATE PREPARE stmt1;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
