using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp01
{
    public partial class Attendance_Portal : System.Web.UI.Page
    {
        protected string roll;
        protected List<List<string>> Data { get; set; }
        protected List<string> array;
        protected void Page_Load(object sender, EventArgs e)
        {
            roll = Request.QueryString["param1"];

            SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project5;Integrated Security=True");
            conn.Open();

            string query = String.Format("SELECT [courseTaught].[Ccode], [courses].[Cname], [courseTaught].[SecID], [userr].[FName], [userr].[LName] " +
                                         "FROM [dbo].[courseTaught] " +
                                         "INNER JOIN [dbo].[courses] on [courses].[Ccode] = [courseTaught].[Ccode] " +
                                         "INNER JOIN [dbo].[userr] on [userr].[UserID] = [courseTaught].[FacID] " +
                                         "WHERE [courseTaught].[FacID] LIKE '{0}'", roll);

            SqlCommand cm = new SqlCommand(query, conn);

            SqlDataReader rdr = cm.ExecuteReader();

            Data = new List<List<string>>();
            while (rdr.Read())
            {
                array = new List<string>();

                array.Add(rdr["Ccode"].ToString());
                array.Add(rdr["Cname"].ToString());
                array.Add(rdr["SecID"].ToString());
                string name = rdr["FName"].ToString() + " " + rdr["LName"].ToString();
                array.Add(name);

                Data.Add(array);

            }

            rdr.Close();

            cm.Dispose();
            conn.Close();
        }
    }
}