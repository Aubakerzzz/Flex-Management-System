using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp01
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        protected List<string[]> Data { get; set; }
        protected List<string[]> Presence { get; set; }

        protected string Ccode;
        protected int secID;
        protected string roll;
        protected int count = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            Ccode = Request.QueryString["param1"];
            secID = Convert.ToInt32(Request.QueryString["param2"]);
            roll = Request.QueryString["param3"];

            SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project5;Integrated Security=True");
            conn.Open();
            SqlCommand cm;
            string query = String.Format("SELECT studentSection.StuID, userr.FName, userr.SemYear " +
                                         "FROM studentSection " +
                                         "INNER JOIN userr on userr.userID = studentSection.StuID " +
                                         "WHERE studentSection.Ccode like '{0}' " +
                                         "AND studentSection.SemYear like userr.SemYear " +
                                         "AND studentSection.SecID = {1} ", Ccode, secID);

            cm = new SqlCommand(query, conn);
            SqlDataReader reader = cm.ExecuteReader();

            Data = new List<string[]>();

            // get column names and add as first row of data
            string[] columnNames = new string[reader.FieldCount];
            for (int i = 0; i < reader.FieldCount; i++)
            {
                columnNames[i] = reader.GetName(i);
            }
            Data.Add(columnNames);

            // get data rows and add them to the list
            while (reader.Read())
            {
                string[] row = new string[reader.FieldCount];
                for (int i = 0; i < reader.FieldCount; i++)
                {
                    row[i] = reader.GetValue(i).ToString();
                }
                Data.Add(row);
            }

            // Close the data reader
            reader.Close();
        }

        protected void submit_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project5;Integrated Security=True;MultipleActiveResultSets=true");
            conn.Open();
            SqlCommand cm;

            for (int i = 0; i < 15; i++)
            {
                string ij = Convert.ToString(i + 1);
                int numbers = Convert.ToInt32(Request.QueryString["Presence_" + ij]);
                string query = String.Format("INSERT INTO attendance (Ccode, StuID, SecID, Present, Date, Hours, SemYear) VALUES " +
                                             "('{0}', '{1}', {2}, {3}, CURRENT_TIMESTAMP, 3, '{4}')", Ccode, Data[i][0], secID, numbers, Data[i][2]);

                cm = new SqlCommand(query, conn);
                cm.ExecuteNonQuery();
                cm.Dispose();
            }

            conn.Close();
            Response.Redirect("Attendance Portal.aspx?param1=" + roll);

        }
    }
}