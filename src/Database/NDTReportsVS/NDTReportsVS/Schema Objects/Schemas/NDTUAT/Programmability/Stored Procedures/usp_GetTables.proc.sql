CREATE PROCEDURE NDTUAT.usp_GetTables    
 @SchemaName varchar(max) = NULL,  
 @Name varchar(max) = NULL  
AS    
BEGIN    
 IF (@Name is null OR @Name='')    
 BEGIN     
  IF (@SchemaName is null OR @SchemaName='')    
  BEGIN     
   SELECT S.name 'Schema',T.name 'Table',* FROM sys.Tables T inner join sys.schemas S     
   ON T.schema_id = S.schema_id    
   ORDER BY 1,2    
  END    
  ELSE    
  BEGIN    
   SELECT S.name 'Schema',T.name 'Table',* FROM sys.Tables T inner join sys.schemas S     
   ON T.schema_id = S.schema_id    
   WHERE S.name in (@SchemaName)    
   ORDER BY 1,2    
  END   
 END   
ELSE  
BEGIN    
  SELECT S.name 'Schema',T.name 'Table',* FROM sys.Tables T inner join sys.schemas S     
  ON T.schema_id = S.schema_id    
  WHERE T.name like '%'+ @Name +'%'  
  ORDER BY 1,2    
 END    
END 