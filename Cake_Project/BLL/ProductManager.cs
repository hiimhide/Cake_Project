using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Cake_Project.DAL;
using Cake_Project.MODEL;

namespace Cake_Project.BLL
{
    public class ProductManager
    {
        ProductOracleDAO pod = new ProductOracleDAO();
        public DataTable getViewProduct()
        {
            return pod.getViewProduct();
        }

        public DataTable searchProduct(Product p)
        {
            return pod.seachProduct(p);
        }
        
        public DataTable insertProduct(Product t)
        {
            return pod.insertProduct(t);
        }

        public DataTable updateProduct(Product t)
        {
            return pod.updateProduct(t);
        }

        public DataTable deleteProduct(int id)
        {
            return pod.deleteProduct(id);
        }

    }
}