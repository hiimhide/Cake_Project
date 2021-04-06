using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using Cake_Project.BLL;
using Cake_Project.MODEL;

namespace Cake_Project.GUI
{
    public partial class CustomerGUI : System.Web.UI.Page
    {
        CustomerManager cm = new CustomerManager();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                DataTable table = cm.getViewCustomer();
                ViewCustomer.DataSource = table;
                ViewCustomer.DataBind();
            }
        }
        public void ClearView_Data()
        {
            txtIdCustomer.Text = "";
            txtName_Customer.Text = "";
            txtEmail.Text = "";
            txtAddress.Text = "";
            txtNumber_Phone.Text = "";
            ViewCustomer.SelectedIndex = -1;
            DataTable table = cm.getViewCustomer();
            ViewCustomer.DataSource = table;
            ViewCustomer.DataBind();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearView_Data();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtIdCustomer.Text == "" && txtName_Customer.Text == "")
            {
                ClearView_Data();
            }
            else if (txtIdCustomer.Text == "")
            {
                Customer c = new Customer(Convert.ToInt32(-1),txtName_Customer.Text);
                DataTable ds = cm.searchCustomer(c);
                ViewCustomer.DataSource = ds;
                ViewCustomer.DataBind();
            }
            else
            {
                Customer c = new Customer(Convert.ToInt32(txtIdCustomer.Text), txtName_Customer.Text);
                DataTable ds = cm.searchCustomer(c);
                ViewCustomer.DataSource = ds;
                ViewCustomer.DataBind();
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtName_Customer.Text == "")
                {
                    MessageBox.Show(txtName_Customer.Text + " Not Empty");
                    return;
                }
                else
                {
                    Customer c = new Customer(txtName_Customer.Text,txtEmail.Text,txtAddress.Text, Convert.ToInt32(txtNumber_Phone.Text));
                    cm.insertCustomer(c);
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
            if (txtName_Customer.Text == "")
            {
                MessageBox.Show(lblName.Text + " Not Empty");
                return;
            }
            else
            {
                Customer c = new Customer(Convert.ToInt32(txtIdCustomer.Text),txtName_Customer.Text,txtEmail.Text,txtAddress.Text, Convert.ToInt32(txtNumber_Phone.Text));
                cm.updateCustomer(c);
                ClearView_Data();
            }
        }

        protected void ViewCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtIdCustomer.Text = ViewCustomer.SelectedRow.Cells[0].Text;
            txtName_Customer.Text = ViewCustomer.SelectedRow.Cells[1].Text;
            txtEmail.Text = ViewCustomer.SelectedRow.Cells[2].Text;
            txtAddress.Text = ViewCustomer.SelectedRow.Cells[3].Text;
            txtNumber_Phone.Text = ViewCustomer.SelectedRow.Cells[4].Text;
        }

        protected void ViewCustomer_RowDataBound(object sender, GridViewRowEventArgs e)
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

        protected void ViewCustomer_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id_delete = Convert.ToInt32(ViewCustomer.DataKeys[e.RowIndex].Value);
            cm.deleteCustomer(id_delete);
            ClearView_Data();
        }
    }
}