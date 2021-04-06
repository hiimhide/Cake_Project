using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Cake_Project.MODEL;

namespace Cake_Project.DAL
{
    public class ProductOracleDAO
    {
        string tsn = "Data Source=(DESCRIPTION =" +
               "(ADDRESS = (PROTOCOL = TCP)(HOST = DESKTOP-NSRH9LB)(PORT = 1521))" +
               "(CONNECT_DATA =" +
               "(SERVER = DEDICATED)" +
               "(SERVICE_NAME = XE)));" +
               "User Id= ADMIN_HIDE;Password=123";

        public DataTable getViewProduct()
        {
            OracleCommand command = new OracleCommand();
            OracleDataAdapter adapter = new OracleDataAdapter();
            DataTable ds = new DataTable();
            OracleConnection connection = new OracleConnection(tsn);
            connection.Open();
            command.Connection = connection;
            command.CommandText = "SPPRODUCT_GET";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("rs", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            adapter = new OracleDataAdapter(command);
            adapter.Fill(ds);
            connection.Close();
            return ds;
        }

        public DataTable seachProduct(Product p)
        {
            OracleCommand command = new OracleCommand();
            OracleDataAdapter adapter = new OracleDataAdapter();
            DataTable ds = new DataTable();
            OracleConnection connection = new OracleConnection(tsn);
            connection.Open();
            command.Connection = connection;
            command.CommandText = "SPPRODUCT_SEARCH";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("pid_product_input", OracleDbType.Varchar2).Value = Convert.ToInt32(p.Id_product);
            command.Parameters.Add("pNAME_product_input", OracleDbType.Varchar2).Value = p.Name_product;
            command.Parameters.Add("pprice_input", OracleDbType.Int32).Value = Convert.ToInt32(p.Price);
            command.Parameters.Add("c_admin_hide_product", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            adapter = new OracleDataAdapter(command);
            adapter.Fill(ds);
            connection.Close();
            return ds;
        }
        public DataTable insertProduct(Product t)
        {
            OracleCommand command = new OracleCommand();
            OracleDataAdapter adapter = new OracleDataAdapter();
            DataTable ds = new DataTable();
            OracleConnection connection = new OracleConnection(tsn);
            connection.Open();
            command.Connection = connection;
            command.CommandText = "SPPRODUCT_INSERT";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("aname_product_input", OracleDbType.Varchar2).Value = t.Name_product;
            command.Parameters.Add("aprice_input", OracleDbType.Int32).Value = Convert.ToInt32(t.Price);
            command.Parameters.Add("adescride_input", OracleDbType.Varchar2).Value = t.Descride;
            command.Parameters.Add("adiscount_input", OracleDbType.Int32).Value = Convert.ToInt32(t.Discount);
            command.Parameters.Add("adate_start_input", OracleDbType.Date).Value = t.Date_start;
            command.Parameters.Add("adate_end_input", OracleDbType.Date).Value = t.Date_end;
            command.Parameters.Add("aimages_input", OracleDbType.Varchar2).Value = "../Images/" + t.Images;
            adapter = new OracleDataAdapter(command);
            adapter.Fill(ds);
            connection.Close();
            return ds;
        }

        public DataTable updateProduct(Product t)
        {
            OracleCommand command = new OracleCommand();
            OracleDataAdapter adapter = new OracleDataAdapter();
            DataTable ds = new DataTable();
            OracleConnection connection = new OracleConnection(tsn);
            connection.Open();
            command.Connection = connection;
            command.CommandText = "SPPRODUCT_UPDATE";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("aid_product_input", OracleDbType.Int32).Value = Convert.ToInt32(t.Id_product);
            command.Parameters.Add("aname_product_input", OracleDbType.Varchar2).Value = t.Name_product;
            command.Parameters.Add("aprice_input", OracleDbType.Int32).Value = Convert.ToInt32(t.Price);
            command.Parameters.Add("adescride_input", OracleDbType.Varchar2).Value = t.Descride;
            command.Parameters.Add("adiscount_input", OracleDbType.Int32).Value = Convert.ToInt32(t.Discount);
            command.Parameters.Add("adate_start_input", OracleDbType.Date).Value = t.Date_start;
            command.Parameters.Add("adate_end_input", OracleDbType.Date).Value = t.Date_end;
            command.Parameters.Add("aimages_input", OracleDbType.Varchar2).Value = "../Images/" + t.Images;
            adapter = new OracleDataAdapter(command);
            adapter.Fill(ds);
            connection.Close();
            return ds;
        }
        public DataTable deleteProduct(int id)
        {
            OracleCommand command = new OracleCommand();
            OracleDataAdapter adapter = new OracleDataAdapter();
            DataTable ds = new DataTable();
            OracleConnection connection = new OracleConnection(tsn);
            connection.Open();
            command.Connection = connection;
            command.CommandText = "SPPRODUCT_DELETE";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("aid_product_input", OracleDbType.Int32).Value = id;
            command.ExecuteNonQuery();
            connection.Close();
            return ds;
        }
    }
}