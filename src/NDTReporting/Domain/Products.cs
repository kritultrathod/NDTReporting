using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Products
/// </summary>
/// 
public class DbProducts
{
    SqlConnection _con = new SqlConnection(ConfigurationManager.ConnectionStrings[1].ConnectionString);

    public List<Product> GetProductDetails()
    {
        try
        {
            List<Product> _lstProducts = new List<Product>();
            Product _Product = null;
            if (_con.State != System.Data.ConnectionState.Open)
                _con.Open();
            SqlCommand _cmd = _con.CreateCommand();
            _cmd.CommandText = "Select * From Products";
            SqlDataReader _Reader = _cmd.ExecuteReader();

            while (_Reader.Read())
            {

                _Product = new Product();
                _Product.ProductID = Convert.ToInt32(_Reader["ProductID"]);
                _Product.Name = _Reader["Name"].ToString();
                _Product.Unit = _Reader["Unit"].ToString();
                _Product.Qty = Convert.ToDecimal(_Reader["Qty"]);
                _lstProducts.Add(_Product);

            }
            return _lstProducts;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            if (_con.State != System.Data.ConnectionState.Closed)
                _con.Close();
        }
    }

    public string InsertProduct(Product _P)
    {
        try
        {

            if (_con.State != System.Data.ConnectionState.Open)
                _con.Open();
            SqlCommand _cmd = _con.CreateCommand();
            _cmd.CommandText = "Insert Into Products(Name,Unit,Qty)Values(@Name,@Unit,@Qty)";
            _cmd.Parameters.Add(new SqlParameter("@Name", _P.Name));
            _cmd.Parameters.Add(new SqlParameter("@Qty", _P.Qty));
            _cmd.Parameters.Add(new SqlParameter("@Unit", _P.Unit));
            if (_cmd.ExecuteNonQuery() > 0)
                return "Record Sucessfully Saved";
            else
                return "Record not Afftected to DataBase";
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            if (_con.State != System.Data.ConnectionState.Closed)
                _con.Close();
        }
    }

    public string UpdateProduct(Product _P)
    {
        try
        {

            if (_con.State != System.Data.ConnectionState.Open)
                _con.Open();
            SqlCommand _cmd = _con.CreateCommand();
            _cmd.CommandText = "Update Products set Name=@Name,Unit=@Unit,Qty=@Qty Where ProductID=@ProductID";
            _cmd.Parameters.Add(new SqlParameter("@ProductID", _P.ProductID));
            _cmd.Parameters.Add(new SqlParameter("@Name", _P.Name));
            _cmd.Parameters.Add(new SqlParameter("@Qty", _P.Qty));
            _cmd.Parameters.Add(new SqlParameter("@Unit", _P.Unit));
            if (_cmd.ExecuteNonQuery() > 0)
                return "Record Sucessfully Updated";
            else
                return "Record not Afftected to DataBase";
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            if (_con.State != System.Data.ConnectionState.Closed)
                _con.Close();
        }
    }

    public string DeleteProduct(int ProductID)
    {
        try
        {

            if (_con.State != System.Data.ConnectionState.Open)
                _con.Open();
            SqlCommand _cmd = _con.CreateCommand();
            _cmd.CommandText = "Delete From Products Where ProductID=@ProductID";
            _cmd.Parameters.Add(new SqlParameter("@ProductID", ProductID));
            if (_cmd.ExecuteNonQuery() > 0)
                return "Records Sucessfully Delete";
            else
                return "Records not Afftected to DataBase";
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            if (_con.State != System.Data.ConnectionState.Closed)
                _con.Close();
        }
    }

    public Product GetProductById(int ProductID)
    {
        try
        {

            if (_con.State != System.Data.ConnectionState.Open)
                _con.Open();
            SqlCommand _cmd = _con.CreateCommand();
            _cmd.CommandText = "Select * From Products Where ProductID=@ProductID";
            _cmd.Parameters.Add(new SqlParameter("@ProductID", ProductID));
            SqlDataReader _Reader = _cmd.ExecuteReader();
            Product _Product = null;
            while (_Reader.Read())
            {
                _Product = new Product();
                _Product.ProductID = Convert.ToInt32(_Reader["ProductID"]);
                _Product.Name = _Reader["Name"].ToString();
                _Product.Qty = Convert.ToDecimal(_Reader["Qty"]);
                _Product.Unit = _Reader["Unit"].ToString();
            }
            return _Product;
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            if (_con.State != System.Data.ConnectionState.Closed)
                _con.Close();
        }
    }
}

public class Product
{
    private int _ProductID = 0;

    public int ProductID
    {
        get { return _ProductID; }
        set { _ProductID = value; }
    }

    private string _Name = string.Empty;

    public string Name
    {
        get { return _Name; }
        set { _Name = value; }
    }

    private string _Unit = string.Empty;

    public string Unit
    {
        get { return _Unit; }
        set { _Unit = value; }
    }

    private decimal _Qty = 0;

    public decimal Qty
    {
        get { return _Qty; }
        set { _Qty = value; }
    }
}
