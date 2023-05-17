using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp01
{
    public partial class WebForm17 : System.Web.UI.Page
    {
        protected string Ccode;
        protected int Section;
        protected string roll; 
        protected void Page_Load(object sender, EventArgs e)
        {
            roll = Request.QueryString["param3"];
            Ccode = Request.QueryString["param1"];
            Section = Convert.ToInt32(Request.QueryString["param2"]);
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project5;Integrated Security=True;MultipleActiveResultSets=true");
            conn.Open();
            SqlCommand cm;

            int assignment = Convert.ToInt32(Request.QueryString["assignment"]);
            int quiz = Convert.ToInt32(Request.QueryString["quiz"]);
            int sess1 = Convert.ToInt32(Request.QueryString["sessional1"]);
            int sess2 = Convert.ToInt32(Request.QueryString["sessional2"]);
            int final = Convert.ToInt32(Request.QueryString["final"]);

            string query = String.Format("UPDATE Distributions " +
                                         "SET Quiz = {0}, Assignments = {1}, Sessional1 = {2}, Sessional2 = {3}, Final = {4} " +
                                         "WHERE Ccode = '{5}' ", quiz, assignment, sess1, sess2, final, Ccode);

            cm = new SqlCommand(query, conn);
            cm.ExecuteNonQuery();
            cm.Dispose();
            conn.Close();
            Response.Redirect("WebForm15.aspx?param1=" + roll);
        }
    }
}