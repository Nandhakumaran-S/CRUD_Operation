using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace WebApplication4
{
    public partial class CRUDStoredProcedure : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        CRUD obj = new CRUD();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayID();
                BindGridView();
            }
        }
        void DisplayID()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "Select * from student";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataTable data = new DataTable();
            sda.Fill(data);
            if (data.Rows.Count < 1)
            {
                IDText.Text = "1";
            }
            else
            {
                string query1 = "Select Max(studentId) from student";
                SqlCommand cmd = new SqlCommand(query1, con);
                try
                {
                    con.Open();
                    int max = (int)cmd.ExecuteScalar();
                    max++;
                    IDText.Text = max.ToString();
                }
                finally
                {
                    con.Close();
                }
            }
        }
        void BindGridView()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "Select * from student";
            SqlDataAdapter sda = new SqlDataAdapter(query,con);
            DataSet data = new DataSet();
            sda.Fill(data);
            GridView1.DataSource = data;
            GridView1.DataBind();
        }

        void BackToPosition()
        {
            NameText.Text = string.Empty;
            DropDownList1.SelectedItem.Text = "Select Class";
        }

        string RadioButtonSelected()
        {
            string gender = string.Empty;
            if (MaleRB.Checked)
            {
                gender = MaleRB.Text;
            }
            else if (FemaleRB.Checked)
            {
                gender = FemaleRB.Text;
            }
            return gender;
        }
        protected void InsertBtn_Click(object sender, EventArgs e)
        {
            string gender = RadioButtonSelected();

            string result = obj.ConnectToDB("Insert", IDText.Text, NameText.Text,gender, DropDownList1.SelectedItem.Text);
            if(result.Equals("Ok"))
            {
                Response.Write("<script>alert('Inserted Successfully!')</script>");
                DisplayID();
                BindGridView();
                BackToPosition();
            }
            else
            {
                Response.Write("<script>alert('Not Inserted!')</script>");
            }
        }

        protected void UpdateBtn_Click(object sender, EventArgs e)
        {
            string gender = RadioButtonSelected();
            string result = obj.ConnectToDB("Update", IDText.Text, NameText.Text, gender, DropDownList1.SelectedItem.Text);
            if (result.Equals("Ok"))
            {
                Response.Write("<script>alert('Updated Successfully!')</script>");
                DisplayID();
                BindGridView();
                BackToPosition();
            }
            else
            {
                Response.Write("<script>alert('Not Updated!')</script>");
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            Label IDlabl = (Label)row.FindControl("IDLabel");
            Label Namelabl = (Label)row.FindControl("NameLabel");
            Label Genderlabl = (Label)row.FindControl("GenderLabel");
            Label Classlbl = (Label)row.FindControl("ClassLabel");
            IDText.Text = IDlabl.Text;
            NameText.Text = Namelabl.Text;
            DropDownList1.SelectedItem.Text = Classlbl.Text;
        }

        protected void DeleteBtn_Click(object sender, EventArgs e)
        {
            string gender = RadioButtonSelected();
            string result = obj.ConnectToDB("Delete", IDText.Text, NameText.Text, gender, DropDownList1.SelectedItem.Text);
            if (result.Equals("Ok"))
            {
                Response.Write("<script>alert('Deleted Successfully!')</script>");
                DisplayID();
                BindGridView();
                BackToPosition();
            }
            else
            {
                Response.Write("<script>alert('Not Deleted!')</script>");
            }
        }

        protected void GenderValidate_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if(MaleRB.Checked || FemaleRB.Checked)
            {
                args.IsValid = true;
            }
            else
                {
                args.IsValid = false;
            }
        }

        protected void ResetBtn_Click(object sender, EventArgs e)
        {
            RF1.Visible = false;
            RF3.Visible = false;
            DisplayID();
            BindGridView();
            BackToPosition();
        }
    }
}