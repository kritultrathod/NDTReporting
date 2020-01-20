using System;
using NDTReporting.Domain;

namespace NDTReporting.Common
{
    public static class HandleError
    {
        //TODO: Make this class singleton
        //TODO: Discuss about Why to make it singleton? - & Take decision.
        private static string innerEx = string.Empty;
        /// <summary>
        /// Generic Handler for Try Catch.
        /// </summary>
        /// <param name="success">Method that executes under try block</param>
        /// <param name="failed">Method that executes under catch block, provided some execption was generated during the 'sucess' action</param>
        public static void HandleInternalError(Action success, Action<string, Exception> failed)
        {
            try
            {
                if (success != null)
                {
                    //TODO: User Log here for INFO IN - for Performance, Health, Audit Log
#if DEBUG
                    LogAppMessage(success.Method.Name);
#endif
                    success();
                    //TODO: User Log here for INFO OUT
                }
            }
            catch (Exception e)
            {
                innerEx = "";
                LogInternalError(e);
                failed(e.Message, e);
                //TODO: Use loger out here for ERROR
            }
            finally { }
        }

        /// <summary>
        /// Generic Handler for Try Catch Finally.
        /// </summary>
        /// <param name="success">Method that executes under try block</param>
        /// <param name="failed">Method that executes under catch block, provided some execption was generated during the 'sucess' action</param>
        /// <param name="cleanup">Method tha executes. Use for clean up purpose. e.g.: Db Activity, File Access, Memory, etc.</param>
        public static void HandleInternalError(Action success, Action<string, Exception> failed, Action cleanup)
        {
            try
            {
                if (success != null)
                {
                    //TODO: User Log here for INFO IN
                    success();
                    //TODO: User Log here for INFO OUT
                }
            }
            catch (Exception e)
            {
                innerEx = "";
                LogInternalError(e);
                failed(e.Message, e);
                //TODO: Use loger out here for ERROR
            }
            finally
            {
                if (cleanup != null)
                {
                    cleanup();
                }
            }
        }
        private static void LogInternalError(Exception e)
        {
            ExceptionLogger localLogger = new ExceptionLogger();
            getInnerException(e);
            localLogger.InsertException(e.StackTrace, e.Message, innerEx);
        }

        private static void getInnerException(Exception e)
        {
            if (e.InnerException != null)
            {
                innerEx += e.InnerException.Message + "   ";
                getInnerException(e.InnerException);
            }

        }

        public static void LogAppError(string sProps, Exception e)
        {
            ExceptionLogger localLogger = new ExceptionLogger();
            string _stackTrace = string.Empty;
            string _message = string.Empty;
            if (e != null)
            {
                _stackTrace = e.StackTrace ?? "StackTrace not available";
                _message = e.Message ?? "Message not avallable";
            }
            localLogger.InsertException(_stackTrace, _message, sProps);
        }

        public static void LogAppMessage(string message)
        {
            ExceptionLogger localLogger = new ExceptionLogger();
            localLogger.InsertException(string.Empty, message, string.Empty);
        }
    }
}