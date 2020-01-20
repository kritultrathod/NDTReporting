CREATE PROCEDURE NDTUAT.usp_GetProcs    
 @SchemaName varchar(max) = NULL    
AS    
BEGIN    
 IF (@SchemaName is null OR @SchemaName='')    
 BEGIN     
  SELECT S.name 'Schema',P.name 'Proc',*   
  FROM sys.procedures P inner join sys.schemas S     
  ON P.schema_id = S.schema_id    
  ORDER BY 1,2    
 END    
 ELSE    
 BEGIN    
  SELECT S.name 'Schema',P.name 'Proc',*   
  FROM sys.procedures P inner join sys.schemas S     
  ON P.schema_id = S.schema_id    
  WHERE S.name in (@SchemaName)    
  ORDER BY 1,2    
 END    
END 