using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace WebApp01
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected string roll;
        protected string subject;
        protected List<List<string>> Data { get; set; }
        protected List<string> jeo { get; set; }

        protected int totalSubjects = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            roll = Request.QueryString["param1"];



            SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project5;Integrated Security=True");
            conn.Open();
            string query = String.Format("SELECT [courses].[CName], [courses].[CCode] " +
                                         "FROM [dbo].[studentSection] " +
                                         "INNER JOIN [dbo].[courses] on [courses].[CCode] = [studentSection].[CCode] " +
                                         "INNER JOIN [dbo].[userr] on [userr].[UserID] = [studentSection].[StuID] " +
                                         "WHERE [studentSection].[StuID] = '{0}'" +
                                         "AND [studentSection].[SemNum] = [userr].[Semester] " +
                                         "AND [studentSection].[Status] = 1 ", roll);

            SqlCommand cm = new SqlCommand(query, conn);

            SqlDataReader rdr = cm.ExecuteReader();

            Data = new List<List<string>>();


            while (rdr.Read())
            {
                jeo = new List<string>();

                jeo.Add(rdr[0].ToString());
                jeo.Add(rdr[1].ToString());

                Data.Add(jeo);
                totalSubjects++;
            }

            cm.Dispose();
            conn.Close();
        }
    }
}