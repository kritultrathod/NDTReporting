﻿   
CREATE  PROCEDURE [NDTUAT].[tsu_Assert]   
 @ActualValue decimal(10,2),  
 @ExpectedValue decimal(10,2),  
 @SPName VARCHAR(255)  
-- GENERAL INFO:    This stored procedure is a part of the Artha's extension to tsqlunit  
--                  unit testing framework.   
--  
-- DESCRIPTION:     This procedure should be called by a unit test when a  
--                  need to test Assert on 2 values namely Expected value vs. Actual value.   
-- PARAMETERS:      @ActualValue     This value will be matached with Expected value to varify  
--     @ExpectedValue   This is the expected value to be validated against  
--     @SPName          SP name must be always be passed as OBJECT_NAME(@@PROCID)  
--  
-- RETURNS:         Nothing  
--   
-- VERSION:         tsqlunit-0.91  
-- COPYRIGHT:  
--    Copyright (C) 2002-2009  Henrik Ekelund   
--    Email: <http://sourceforge.net/sendmessage.php?touser=618411>  
--  
--    This library is free software; you can redistribute it and/or  
--    modify it under the terms of the GNU Lesser General Public  
--    License as published by the Free Software Foundation; either  
--    version 2.1 of the License, or (at your option) any later version.  
--  
--    This library is distributed in the hope that it will be useful,  
--    but WITHOUT ANY WARRANTY; without even the implied warranty of  
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU  
--    Lesser General Public License for more details.  
--  
--    You should have received a copy of the GNU Lesser General Public  
--    License along with this library; if not, write to the Free Software  
--    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA              
AS  
BEGIN  

IF @ActualValue <> @ExpectedValue  
BEGIN
 SET NOCOUNT ON  
 UPDATE tsuActiveTest    
  SET   
   isFailure=1,   
   isError=0,  
   message= @SPName + ' was incorrect. Expected value was <' + convert(varchar,@ExpectedValue) + '>. But the actual value was <' +  convert(varchar,@ActualValue) +'>.'      
END
 
END  
   
  