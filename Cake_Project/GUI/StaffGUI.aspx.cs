using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cake_Project.MODEL;
using Cake_Project.BLL;
using System.Data;
using System.Windows.Forms;

namespace Cake_Project.GUI
{
    
    public partial class StaffGUI : System.Web.UI.Page
    {
        StaffManager sm = new StaffManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable table = sm.getViewStaff();
                ViewStaff.DataSource = table;
                ViewStaff.DataBind();
            }
        }
        public void ClearView_Data()
        {
            txtIdStaff.Text = "";
            txtName_Staff.Text = "";
            txtEmail.Text = "";
            txtAddress.Text = "";
            txtNumber_Phone.Text = "";
            ViewStaff.SelectedIndex = -1;
            DataTable table = sm.getViewStaff();
            ViewStaff.DataSource = table;
            ViewStaff.DataBind();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearView_Data();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtIdStaff.Text == "" && txtName_Staff.Text == "")
            {
                ClearView_Data();
            }
            else if (txtIdStaff.Text == "")
            {
                Staff s = new Staff(Convert.ToInt32(-1), txtName_Staff.Text);
                DataTable ds = sm.seachStaff(s);
                ViewStaff.DataSource = ds;
                ViewStaff.DataBind();
            }
            else
            {
                Staff s = new Staff(Convert.ToInt32(txtIdStaff.Text), txtName_Staff.Text);
                DataTable ds = sm.seachStaff(s);
                ViewStaff.DataSource = ds;
                ViewStaff.DataBind();
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtName_Staff.Text == "")
                {
                    MessageBox.Show(txtName_Staff.Text + " Not Empty");
                    return;
                }
                else
                {
                    Staff c = new Staff(txtName_Staff.Text, txtEmail.Text, txtAddress.Text, Convert.ToInt32(txtNumber_Phone.Text));
                    sm.insertStaff(c);
                    ClearView_Data();
                }
            }
            catch (Exception ex)
            {
                ex.Message.ToString();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txtName_Staff.Text == "")
            {
                MessageBox.Show(txtName_Staff.Text + " Not Empty");
                return;
            }
            else
            {
                Staff s = new Staff(Convert.ToInt32(txtIdStaff.Text), txtName_Staff.Text, txtEmail.Text, txtAddress.Text, Convert.ToInt32(txtNumber_Phone.Text));
                sm.updateStaff(s);
                ClearView_Data();
            }
        }

        protected void ViewCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtIdStaff.Text = ViewStaff.SelectedRow.Cells[0].Text;
            txtName_Staff.Text = ViewStaff.SelectedRow.Cells[1].Text;
            txtEmail.Text = ViewStaff.SelectedRow.Cells[2].Text;
            txtAddress.Text = ViewStaff.SelectedRow.Cells[3].Text;
            txtNumber_Phone.Text = ViewStaff.SelectedRow.Cells[4].Text;
        }

        protected void ViewStaff_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string item = e.Row.Cells[0].Text;
            foreach (LinkButton lb in e.Row.Cells[6].Controls.OfType<LinkButton>())
            {
                if (lb.CommandName == "Delete")
                {
                    lb.Attributes["Onclick"] = "if(!confirm('Do you want to detele " + item + " ?')){return false;};";
                }
            }
        }

        protected void ViewStaff_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id_delete = Convert.ToInt32(ViewStaff.DataKeys[e.RowIndex].Value);
            sm.deleteStaff(id_delete);
            ClearView_Data();
        }
    }
}