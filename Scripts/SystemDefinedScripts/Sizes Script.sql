insert into restaurant.enums (Id,KeyCode,Name,IsSystemDefined, CreatedOn,CreatedById,IsActive )
values
(1010,"Sizes","Sizes",1, now(),0,1);
insert into restaurant.enumline (Id,EnumTypeId,Name,KeyCode,IsSystemDefined,CreatedOn,CreatedById,IsActive) 
value
(1010001,1010,"Small","Small",1,now(),0,1);
insert into restaurant.enumline (Id,EnumTypeId,Name,KeyCode,IsSystemDefined,CreatedOn,CreatedById,IsActive) 
value
(1010002,1010,"Medium","Medium",1,now(),0,1);
insert into restaurant.enumline (Id,EnumTypeId,Name,KeyCode,IsSystemDefined,CreatedOn,CreatedById,IsActive) 
value
(1010003,1010,"Large","Large",1,now(),0,1);