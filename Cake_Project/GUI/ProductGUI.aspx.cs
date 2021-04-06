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
    public partial class ProductManager : System.Web.UI.Page
    {
        BLL.ProductManager pm = new BLL.ProductManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable table = pm.getViewProduct();
                viewProduct.DataSource = table;
                viewProduct.DataBind();
                if (ddlfloor.SelectedItem.ToString() == "HSX")
                {
                    ddlLenh.Visible = true;
                    lbllenh.Visible = true;
                }
                else
                {
                    ddlLenh.Visible = false;
                    lbllenh.Visible = false;
                }
            }
        }

        public void ClearView_Data()
        {
            txtIdProduct.Text = "";
            txtNameProduct.Text = "";
            txtPrice.Text = "";
            txtDiscount.Text = "";
            txtDescride.Text = "";
            txtDateStart.Text = "";
            txtDateEnd.Text = "";
            viewProduct.SelectedIndex = -1;
            DataTable table = pm.getViewProduct();
            viewProduct.DataSource = table;
            viewProduct.DataBind();
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            ClearView_Data();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtIdProduct.Text == "" && txtNameProduct.Text == "" && txtPrice.Text == "")
            {
                MODEL.Product p = new MODEL.Product();
                DataTable ds = pm.searchProduct(p);
                viewProduct.DataSource = ds;
                viewProduct.DataBind();
            }
            else
            {
                MODEL.Product p = new MODEL.Product(Convert.ToInt32(txtIdProduct.Text), txtNameProduct.Text, Convert.ToInt32(txtPrice.Text));
                DataTable ds = pm.searchProduct(p);
                viewProduct.DataSource = ds;
                viewProduct.DataBind();
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (txtNameProduct.Text == "")
            {
                MessageBox.Show(txtNameProduct.Text + " Not Empty");
                return;
            }
            else
            {
                MODEL.Product p = new MODEL.Product(Convert.ToInt32(txtIdProduct.Text),txtNameProduct.Text, Convert.ToInt32(txtPrice.Text), txtDescride.Text, Convert.ToInt32(txtDiscount.Text), txtDateStart.Text, txtDateEnd.Text, fulImages.FileName);
                pm.updateProduct(p);
                ClearView_Data();
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtNameProduct.Text == "")
                {
                    MessageBox.Show(txtNameProduct.Text + " Not Empty");
                    return;
                }
                else
                {
                    MODEL.Product p = new MODEL.Product(txtNameProduct.Text, Convert.ToInt32(txtPrice.Text), txtDescride.Text, Convert.ToInt32(txtDiscount.Text), txtDateStart.Text, txtDateEnd.Text, fulImages.FileName);
                    pm.insertProduct(p);
                    ClearView_Data();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
        }

        protected void viewProduct_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtIdProduct.Text = viewProduct.SelectedRow.Cells[0].Text;
            txtNameProduct.Text = viewProduct.SelectedRow.Cells[1].Text;
            txtPrice.Text = viewProduct.SelectedRow.Cells[2].Text;
            txtDescride.Text = viewProduct.SelectedRow.Cells[3].Text;
            txtDiscount.Text = viewProduct.SelectedRow.Cells[4].Text;
            txtDateStart.Text = viewProduct.SelectedRow.Cells[5].Text;
            txtDateEnd.Text = viewProduct.SelectedRow.Cells[6].Text;
        }

        protected void viewProduct_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string item = e.Row.Cells[0].Text;
            foreach (LinkButton lb in e.Row.Cells[9].Controls.OfType<LinkButton>())
            {
                if (lb.CommandName == "Delete")
                {
                    lb.Attributes["Onclick"] = "if(!confirm('Do you want to detele " + item + " ?')){return false;};";
                }
            }
        }

        protected void viewProduct_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int id_delete = Convert.ToInt32(viewProduct.DataKeys[e.RowIndex].Value);
                pm.deleteProduct(id_delete);
                ClearView_Data();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }
            
        }

        protected void ddlfloor_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlfloor.SelectedItem.ToString() == "HSX")
            {
                ddlLenh.Visible = true;
                lbllenh.Visible = true;
            }
            else
            {
                ddlLenh.Visible = false;
                lbllenh.Visible = false;
            }
        }
    }
}

/* try
{
    if (txtNameProduct.Text == "")
    {
        MessageBox.Show(txtNameProduct.Text + " Not Empty");
        return;
    }
    else
    {
        MODEL.Product p = new MODEL.Product(txtNameProduct.Text, Convert.ToInt32(txtPrice.Text), txtDescride.Text, Convert.ToInt32(txtDiscount.Text), txtDateStart.Text, txtDateEnd.Text, fulImages.FileName);
        pm.insertProduct(p);
        ClearView_Data();
    }
}
catch (Exception ex)
{
    ex.Message.ToString();
} */