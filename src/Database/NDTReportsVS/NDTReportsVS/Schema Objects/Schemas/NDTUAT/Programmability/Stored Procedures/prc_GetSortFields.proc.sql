﻿CREATE PROCEDURE [NDTUAT].[prc_GetSortFields]  
--( )  NOTE: CREATED FOR FETCHING SORT FIELDS FOR SEARCH PANEL ORDER BY DROPDOWN. NOT USED CURRENTLY.
AS  
BEGIN -- BEGIN PROC  
   --<VALIDATE INPUT PARAMS> IF INVALID RETURN <CUSTOM_ERROR_CODE>  
   --<CHECK EXISTANCE IN DB>  
   BEGIN TRY  
      --BEGIN TRAN  
       --<YOUR CODE GOES HERE>  
		SELECT ParamKey 'SortFieldKey',ParamDesc1 'SortFieldValue' From NDTUAT.LookUpMaster 
		WHERE LookupCode='SortField'
			AND DeletedStatus=0
		ORDER BY SortOrder ASC       
      --COMMIT TRAN  
   END TRY  
   BEGIN CATCH  
      --ROLLBACK TRAN  
      --LOG ERROR IN DB  
      EXEC [NDTUAT].[usp_GetErrorInfo]  
      RETURN  
   END CATCH  
END -- END PROC  
  