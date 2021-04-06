using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Cake_Project.MODEL;
using Cake_Project.BLL;

namespace Cake_Project.DAL
{
    public class CustomerOracleDAO
    {
        string tsn = "Data Source=(DESCRIPTION =" +
               "(ADDRESS = (PROTOCOL = TCP)(HOST = DESKTOP-NSRH9LB)(PORT = 1521))" +
               "(CONNECT_DATA =" +
               "(SERVER = DEDICATED)" +
               "(SERVICE_NAME = XE)));" +
               "User Id= ADMIN_HIDE;Password=123";

        public DataTable getViewCustomer()
        {
            OracleCommand command = new OracleCommand();
            OracleDataAdapter adapter = new OracleDataAdapter();
            DataTable ds = new DataTable();
            OracleConnection connection = new OracleConnection(tsn);
            connection.Open();
            command.Connection = connection;
            command.CommandText = "SPCUSTOMER_GET";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("rs", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            adapter = new OracleDataAdapter(command);
            adapter.Fill(ds);
            connection.Close();
            return ds;
        }
        public DataTable seachCustomer(Customer c)
        {
            OracleCommand command = new OracleCommand();
            OracleDataAdapter adapter = new OracleDataAdapter();
            DataTable ds = new DataTable();
            OracleConnection connection = new OracleConnection(tsn);
            connection.Open();
            command.Connection = connection;
            command.CommandText = "SPCUSTOMER_SEARCH";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("aid_customer_input", OracleDbType.Varchar2).Value = Convert.ToInt32(c.Id_customer);
            command.Parameters.Add("aNAME_CUSTOMER_input", OracleDbType.Varchar2).Value = c.Name_customer;
            command.Parameters.Add("rs", OracleDbType.RefCursor).Direction = ParameterDirection.Output;
            adapter = new OracleDataAdapter(command);
            adapter.Fill(ds);
            connection.Close();
            return ds;
        }

        public DataTable insertCustomer(Customer c)
        {
            OracleCommand command = new OracleCommand();
            OracleDataAdapter adapter = new OracleDataAdapter();
            DataTable ds = new DataTable();
            OracleConnection connection = new OracleConnection(tsn);
            connection.Open();
            command.Connection = connection;
            command.CommandText = "SPCUSTOMER_INSERT";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("aNAME_CUSTOMER", OracleDbType.Varchar2).Value = c.Name_customer;
            command.Parameters.Add("aEMAIL", OracleDbType.Varchar2).Value = c.Email;
            command.Parameters.Add("aADDRESS", OracleDbType.Varchar2).Value = c.Address;
            command.Parameters.Add("aNUMBER_PHONE", OracleDbType.Int32).Value = Convert.ToInt32(c.Number_phone);
            adapter = new OracleDataAdapter(command);
            adapter.Fill(ds);
            connection.Close();
            return ds;
        }
        public DataTable updateCustomer(Customer c)
        {
            OracleCommand command = new OracleCommand();
            OracleDataAdapter adapter = new OracleDataAdapter();
            DataTable ds = new DataTable();
            OracleConnection connection = new OracleConnection(tsn);
            connection.Open();
            command.Connection = connection;
            command.CommandText = "SPCUSTOMER_UPDATE";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("aid_customer_input", OracleDbType.Int32).Value = Convert.ToInt32(c.Id_customer);
            command.Parameters.Add("aNAME_CUSTOMER", OracleDbType.Varchar2).Value = c.Name_customer;
            command.Parameters.Add("aEMAIL", OracleDbType.Varchar2).Value = c.Email;
            command.Parameters.Add("aADDRESS", OracleDbType.Varchar2).Value = c.Address;
            command.Parameters.Add("aNUMBER_PHONE", OracleDbType.Int32).Value = Convert.ToInt32(c.Number_phone);
            adapter = new OracleDataAdapter(command);
            adapter.Fill(ds);
            connection.Close();
            return ds;
        }
        public DataTable deleteCustomer(int id)
        {
            OracleCommand command = new OracleCommand();
            OracleDataAdapter adapter = new OracleDataAdapter();
            DataTable ds = new DataTable();
            OracleConnection connection = new OracleConnection(tsn);
            connection.Open();
            command.Connection = connection;
            command.CommandText = "SPCUSTOMER_DELETE";
            command.CommandType = CommandType.StoredProcedure;
            command.Parameters.Add("aid_customer_input", OracleDbType.Int32).Value = id;
            command.ExecuteNonQuery();
            connection.Close();
            return ds;
        }
    }
}