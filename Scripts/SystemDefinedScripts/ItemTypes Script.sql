insert into restaurant.enums (Id,KeyCode,Name,IsSystemDefined,CreatedOn,CreatedById,IsActive )
values
(1012,"ItemTypes","Item_Types",1, now(),0,1);
insert into restaurant.enumline (Id,EnumTypeId,Name,KeyCode,IsSystemDefined,CreatedOn,CreatedById,IsActive) 
value
(1012001,1012,"Raw Item","Raw_Item",1,now(),0,1);
insert into restaurant.enumline (Id,EnumTypeId,Name,KeyCode,IsSystemDefined,CreatedOn,CreatedById,IsActive) 
value
(1012002,1012,"Menu Item","Menu_Item",1,now(),0,1);