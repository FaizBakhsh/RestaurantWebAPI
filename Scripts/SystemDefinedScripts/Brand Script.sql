insert into restaurant.enums (Id,KeyCode,Name,IsSystemDefined,CreatedOn,CreatedById,IsActive )
values
(1007,"Brands","Brands",1, now(),0,1);
insert into restaurant.enumline (Id,EnumTypeId,Name,KeyCode,IsSystemDefined,CreatedOn,CreatedById,IsActive) 
value
(1007001,1007,"N/A","N/A",1,now(),0,1);