using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp01
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected List<string[]> Data { get; set; }
        protected string roll;

        protected void Page_Load(object sender, EventArgs e)
        {
            roll = Request.QueryString["param1"];

            SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project5;Integrated Security=True");
            conn.Open();
            SqlCommand cm;
            string query = String.Format("SELECT CGPA " +
                                         "FROM CGPA " +
                                         "WHERE StuID LIKE '{0}' " +
                                         "ORDER BY SemNum ASC", roll);
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

    }
}