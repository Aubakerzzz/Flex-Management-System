using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp01
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


        }
        protected void btnLogin_Click1(object sender, EventArgs e)
        {

            // Checking validation whether it exists in the table or not when it login
            SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project3;Integrated Security=True");
            conn.Open();
            SqlCommand cm;
            string fn = txtUsername.Text;
            string ln = txtPassword.Text;
            string query = "SELECT * FROM login";
            cm = new SqlCommand(query, conn);
            bool found = false;

            SqlDataReader rdr = cm.ExecuteReader();

            while (rdr.Read())
            {
                if (rdr["username"].ToString() == fn && rdr["password"].ToString() == ln)
                {
                    found = true;
                    break;
                }
            }

            rdr.Close();

            if (!found)
            {
                Response.Write("<script>alert('Invalid username or password');</script>");
            }
            else
            {
                Response.Redirect("WebForm41.aspx");
            }

            cm.Dispose();
            conn.Close();


        }
    }
}