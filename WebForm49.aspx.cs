using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp01
{
    public partial class WebForm49 : System.Web.UI.Page
    {
        protected List<string[]> Data { get; set; }
        protected List<string[]> Presence { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=DESKTOP-DKE8JJK\\SQLEXPRESS;Initial Catalog=new1Data;Integrated Security=True");
            conn.Open();
            SqlCommand cm;
            string query = "SELECT Fname from Userr WHERE Type = 'Student'";
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


        }
    }
}