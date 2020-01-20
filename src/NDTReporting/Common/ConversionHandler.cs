using System;

namespace NDTReporting.Common
{
    //[Obsolete("Do not use this class as its obsolete, Try using NullableConversionHandler instead",false)]
    public sealed class ConversionHandler
    {
        #region Private Members
        private static ConversionHandler instance;
        private ConversionHandler() { }
        #endregion
        #region Public Properties
        public static ConversionHandler Instance
        {
            get
            {
                if (instance == null)
                {
                    instance = new ConversionHandler();
                }
                return instance;
            }
        }
        #endregion

        #region Private Methods
        #endregion

        #region Public Methods
        public T ConvertTo<T>(object arg)
        {
            T result = default(T);
            object value = arg;
            try
            {
                if (DBNull.Value != value)
                {
                    result = (T)Convert.ChangeType(value, typeof(T));
                }
            }
            catch
            {
                //Could not convert.  Pass the default value...
                result = default(T);
            }
            return result;
        }
        public DateTime? ConvertNullDateTo<T>(object arg)
        {
            DateTime? result = null;//default(T);
            object value = arg;
            try
            {
                if (DBNull.Value != value)
                {
                    result = (DateTime?)Convert.ChangeType(value, typeof(T));
                }
            }
            catch
            {
                //Could not convert.  Pass the default value...
                result = default(DateTime?);
            }
            return result;
        }
        #endregion
    }
    
    public static class NullableConversionHandler
    {
        public static T? ConvertTo<T>(this string text) where T : struct
        {
            object o = null;
            try
            {
                var ttype = typeof(T);
                if (ttype.IsEnum)
                {
                    T n = default(T);
                    if (Enum.TryParse<T>(text, true, out n))
                        return n;
                }
                else
                    o = Convert.ChangeType(text, ttype);
            }
            catch { }

            if (o == null)
                return new Nullable<T>();

            return new Nullable<T>((T)o);
        }
    }

}