using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Cake_Project.DAL;
using Cake_Project.MODEL;

namespace Cake_Project.BLL
{
    public class CustomerManager
    {
        CustomerOracleDAO cod = new CustomerOracleDAO();
        public DataTable getViewCustomer()
        {
            return cod.getViewCustomer();
        }
        public DataTable searchCustomer(Customer c)
        {
            return cod.seachCustomer(c);
        }
        public DataTable insertCustomer(Customer c)
        {
            return cod.insertCustomer(c);
        }
        public DataTable updateCustomer(Customer c)
        {
            return cod.updateCustomer(c);
        }
        public DataTable deleteCustomer(int id)
        {
            return cod.deleteCustomer(id);
        }
    }
}