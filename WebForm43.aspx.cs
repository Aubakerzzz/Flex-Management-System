using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp01
{
    public partial class WebForm43 : System.Web.UI.Page
    {
        protected string roll;
        protected string year;
        protected int sem;

        protected List<string[]> Data { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            roll = Request.QueryString["param1"];

            SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project5;Integrated Security=True");
            conn.Open();
            SqlCommand cm;
            string query = String.Format("SELECT *" +
                                         "FROM Courses " +
                                         "WHERE Courses.Ccode not in ( SELECT studentSection.Ccode AS Ccode " +
                                                                      "FROM studentSection " +
                                                                      "INNER JOIN courses on courses.CCode = studentSection.Ccode " +
                                                                      "WHERE studentSection.stuID LIKE '{0}' " +
                                                                      "AND studentSection.Status = 1 ) " +
                                         "AND " +
                                         "Courses.PreReqCode in ( SELECT studentSection.Ccode AS Ccode " +
                                                                      "FROM studentSection " +
                                                                      "INNER JOIN courses on courses.CCode = studentSection.Ccode " +
                                                                      "WHERE studentSection.stuID LIKE '{0}' " +
                                                                      "AND studentSection.Status = 1 ) ", roll);


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


            reader.Close();
            cm.Dispose();


            query = String.Format("SELECT Semester, SemYear FROM userr WHERE UserID LIKE '{0}' ", roll);
            cm = new SqlCommand(query, conn);

            reader = cm.ExecuteReader();
            reader.Read();
            sem = Convert.ToInt32(reader["Semester"].ToString());
            year = reader["SemYear"].ToString();

            cm.Dispose();
            conn.Close();
        }
    }
}