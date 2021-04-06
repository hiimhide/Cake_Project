using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using Cake_Project.DAL;
using Cake_Project.MODEL;

namespace Cake_Project.BLL
{
    public class StaffManager
    {
        StaffOracleDAO sod = new StaffOracleDAO();
        public DataTable getViewStaff()
        {
            return sod.getViewStaff();
        }
        public DataTable seachStaff(Staff s)
        {
            return sod.seachStaff(s);
        }
        public DataTable insertStaff(Staff s)
        {
            return sod.insertStaff(s);
        }
        public DataTable updateStaff(Staff s)
        {
            return sod.updateStaff(s);
        }
        public DataTable deleteStaff(int id)
        {
            return sod.deleteStaff(id);
        }
    }
}