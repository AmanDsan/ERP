using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
//using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;




namespace TESTdem
{
    public partial class Mastertest01 : System.Web.UI.Page
    {
        SqlConnection connec = new SqlConnection(ConfigurationManager.ConnectionStrings["ERPConnectionString"].ConnectionString);
        //SqlConnection connec = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DataSubmit(object sender, EventArgs e)
        {
            // SqlConnection connec = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString());
            connec.Open();
            using (SqlCommand cmd = new SqlCommand("InsertTestData", connec))
            {

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Company_Name", TextBox2.Text);
                cmd.Parameters.AddWithValue("@Mobile_No", TextBox6.Text);
                cmd.Parameters.AddWithValue("@Email", TextBox7.Text);
                cmd.Parameters.AddWithValue("@Contact_Person", TextBox5.Text);
                cmd.Parameters.AddWithValue("@Address", TextBox3.Text);
                cmd.Parameters.AddWithValue("@State", TextBox4.Text);
                cmd.Parameters.AddWithValue("@Country", DropDownList1.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@GST", TextBox8.Text);
                cmd.Parameters.AddWithValue("@PAN", TextBox9.Text);
                cmd.Parameters.AddWithValue("@Reg_Office", TextBox10.Text);
                cmd.Parameters.AddWithValue("@Rate_Contract", DropDownList2.SelectedItem.Text);



                cmd.ExecuteNonQuery();
            }
            GridDat();
        }


        protected void GridDat()
        {
            string query = "Select * From MasterCustomer";
            // SqlConnection connec = new SqlConnection(ConfigurationSettings.AppSettings["ConnectionString"].ToString());
            SqlCommand com = new SqlCommand(query, connec);
            SqlDataAdapter adapter = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridDat();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridDat();
        }
        protected void Gridpaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataSource = ViewState["Paging"];
            GridView1.DataBind();

            GridDat();
        }

        protected void SearchBox(object sender, EventArgs e)
        {
            string searchKeyword = TextBox11.Text.Trim();
            string query = "SELECT * FROM MasterCustomer WHERE Company_Name LIKE @searchKeyword";

            // using (SqlConnection connec = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]))
            //{
            using (SqlCommand cmd = new SqlCommand(query, connec))
            {
                cmd.Parameters.AddWithValue("@searchKeyword", "%" + searchKeyword + "%");

                connec.Open();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adapter.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }

            // }
        }

        protected void ResetClick(object sender, EventArgs e)
        {
            // TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            TextBox3.Text = string.Empty;
            TextBox7.Text = string.Empty;
            TextBox4.Text = string.Empty;
            TextBox5.Text = string.Empty;
            TextBox6.Text = string.Empty;
            TextBox7.Text = string.Empty;
            TextBox8.Text = string.Empty;
            TextBox9.Text = string.Empty;
            TextBox10.Text = string.Empty;

            DropDownList1.SelectedIndex = 0;
            DropDownList2.SelectedIndex = 0;
        }


        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string employeeID = GridView1.DataKeys[e.RowIndex].Values["PAN"].ToString();

            //SqlConnection connec = new SqlConnection(ConfigurationManager.AppSettings["ConnectionString"]);
            connec.Open();
            SqlCommand cmd = new SqlCommand("DELETE FROM MasterCustomer WHERE [PAN] = '" + employeeID + "'", connec);
            cmd.ExecuteNonQuery();
            connec.Close();
            GridDat();
        }



        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // Get the row
            GridViewRow row = GridView1.Rows[e.RowIndex];

            // Extract updated values from the TextBoxes/DropDownLists
            string companyName = ((TextBox)row.FindControl("txt_Name")).Text;
            string country = ((TextBox)row.FindControl("txt_Country")).Text;
            string address = ((TextBox)row.FindControl("txt_Address")).Text;
            string state = ((TextBox)row.FindControl("txt_State")).Text;
            string contactPerson = ((TextBox)row.FindControl("txt_CP")).Text;
            string mobile = ((TextBox)row.FindControl("txt_Mob")).Text;
            string email = ((TextBox)row.FindControl("txt_email")).Text;
            string rateContract = ((TextBox)row.FindControl("txt_RC")).Text;
            string gst = ((TextBox)row.FindControl("txt_GST")).Text;
            string pan = ((TextBox)row.FindControl("txt_PAN")).Text; 
            string regOffice = ((TextBox)row.FindControl("txt_RegOff")).Text;

            connec.Open();

            SqlCommand cmd = new SqlCommand("UpdateTestData", connec);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Company_Name", companyName);
            cmd.Parameters.AddWithValue("@Country", country);
            cmd.Parameters.AddWithValue("@Address", address);
            cmd.Parameters.AddWithValue("@State", state);
            cmd.Parameters.AddWithValue("@Contact_Person", contactPerson);
            cmd.Parameters.AddWithValue("@Mobile_No", mobile);
            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@Rate_Contract", rateContract);
            cmd.Parameters.AddWithValue("@GST", gst);
            cmd.Parameters.AddWithValue("@Reg_Office", regOffice);
            cmd.Parameters.AddWithValue("@PAN", pan); // where condition

            // Execute
            cmd.ExecuteNonQuery();
            connec.Close();

            // Reset edit index and refresh data
            GridView1.EditIndex = -1;
            GridDat();
        }



        protected void lbtn_export_Click(object sender, EventArgs e)
        {
            // try
            // {
            Response.Clear();
            Response.AddHeader("content-disposition", "attachment;filename=CustomerInfo.xls");
            Response.ContentType = "application/vnd.xls";
            StringBuilder sb = new StringBuilder();
            HtmlTextWriter htw = new HtmlTextWriter(new StringWriter(sb));

            GridDat();

            GridView1.AllowPaging = false;
            GridView1.DataBind();

            GridView gvExport = new GridView();
            gvExport.DataSource = GridView1.DataSource;
            gvExport.AllowPaging = false;


            gvExport.HeaderStyle.ForeColor = Color.Black;
            // gvExport.HeaderStyle.BackColor = Color.LightBlue;
            gvExport.DataBind();
            gvExport.RenderControl(htw);

            Response.Write(sb.ToString());
            Response.End();
            /*  }
                 catch (Exception ex)
                 {
                     Response.Write(ex.Message);
                 }*/
        }

    }
}