using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing.Printing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp01
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project5;Integrated Security=True");
            conn.Open();
            SqlCommand cm;
            string fn = txtUsername.Text;
            string ln = txtPassword.Text;
            string query = "Insert into login(username, password) values ('" + fn + "', '" + ln + "')";
            cm = new SqlCommand(query, conn);
            cm.ExecuteNonQuery();
            cm.Dispose();
            conn.Close();

        }

        protected void btnLogin_Click1(object sender, EventArgs e)
        {
            // Checking validation whether it exists in the table or not when it login
            SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project5;Integrated Security=True");
            conn.Open();
            SqlCommand cm;
            string fn = txtUsername.Text;
            string ln = txtPassword.Text;
            string query = "SELECT * " +
                           "FROM [dbo].[userr]";
            cm = new SqlCommand(query, conn);
            bool found = false;
            int kind = -1;
            SqlDataReader rdr = cm.ExecuteReader();

            while (rdr.Read())
            {
                if (rdr["UserID"].ToString() == fn && rdr["password"].ToString() == ln)
                {
                    if (rdr["Type"].ToString() == "Admin")
                    {
                        kind = 1;
                    }
                    else if (rdr["Type"].ToString() == "Faculty")
                    {
                        kind = 2;
                    }
                    else
                    {
                        kind = 3;
                    }

                    found = true;
                    break;
                }
            }

            rdr.Close();

            if (!found)
            {
                Response.Write("<script>alert('Invalid username or password');</script>");
                cm.Dispose();
                conn.Close();
                Response.Redirect("StudentLogin.aspx");
            }
            else
            {
                cm.Dispose();

                if (kind == 1) {
                    query = String.Format("INSERT INTO Audit(Record, Date) VALUES ('Logged into Flex Admin System by {0}', CURRENT_TIMESTAMP)", fn);
                    cm = new SqlCommand(query, conn);
                    rdr = cm.ExecuteReader();
                    rdr.Close();
                    cm.Dispose();
                    conn.Close();
                    Response.Redirect(String.Format("WebForm41.aspx?param1={0}", fn));
                
                }

                else if (kind == 2) {
                    query = String.Format("INSERT INTO Audit(Record, Date) VALUES ('Logged into Flex Faculty System by {0}', CURRENT_TIMESTAMP)", fn);
                    cm = new SqlCommand(query, conn);
                    rdr = cm.ExecuteReader();
                    rdr.Close();
                    cm.Dispose();
                    conn.Close();
                    Response.Redirect(String.Format("WebForm28.aspx?param1={0}", fn));
                }

                else {
                    query = String.Format("INSERT INTO Audit(Record, Date) VALUES ('Logged into Flex Student System by {0}', CURRENT_TIMESTAMP)", fn);
                    cm = new SqlCommand(query, conn);
                    rdr = cm.ExecuteReader();
                    rdr.Close();
                    cm.Dispose();
                    conn.Close();
                    Response.Redirect(String.Format("Student Main Page.aspx?param1={0}", fn));
                }
            }
        }
    }
}