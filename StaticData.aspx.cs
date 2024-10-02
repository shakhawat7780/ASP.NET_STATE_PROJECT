using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace MyStaticFormData
{
    public partial class StaticData : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("data source=DESKTOP-5DB165M\\SQLEXPRESS;initial catalog=DBStaticInsert;integrated security=true");
        protected void Page_Load(object sender, EventArgs e)
        {
            Show();
        }
        public void Show()
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from Users", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            con.Close();
            gvusers.DataSource = dt;
            gvusers.DataBind();
        }

        public void Clear()
        {
            txtname.Text = string.Empty;
            txtage.Text = "";
            rblgender.ClearSelection();
            ddldepartment.SelectedValue = "0";
            btninsert.Text = "Insert";
        }

        protected void btninsert_Click(object sender, EventArgs e)
        {
            if (btninsert.Text == "Insert")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into Users(name,age,gender,department)values('" + txtname.Text + "','" + txtage.Text + "','" + rblgender.SelectedValue + "','" + ddldepartment.SelectedValue + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Show();
                Clear();
            }
            else if (btninsert.Text == "Update")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("update Users set name='"+txtname.Text+"',age='"+txtage.Text+"',gender='"+rblgender.SelectedValue+"',department='"+ddldepartment.SelectedValue+"' where id='"+ ViewState["IDD"] + "'",con);
                cmd.ExecuteNonQuery();
                con.Close();
                Show();
                Clear();
            }
        }

        protected void gvusers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "A")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from Users where id='" + e.CommandArgument + "'", con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else if (e.CommandName == "B")
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("select * from Users where id='"+e.CommandArgument+"'",con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                con.Close();
                txtname.Text = dt.Rows[0]["name"].ToString();
                txtage.Text = dt.Rows[0]["age"].ToString();
                rblgender.SelectedValue = dt.Rows[0]["gender"].ToString();
                ddldepartment.SelectedValue = dt.Rows[0]["department"].ToString();
                btninsert.Text = "Update";
                ViewState["IDD"] = e.CommandArgument;
            }
        }
    }
}