using System.Collections.Generic;
using System.Data.SqlClient;
using System;

namespace WebApp01
{
    public partial class WebForm11 : System.Web.UI.Page
    {
        protected List<string[]> Data { get; set; }
        protected int PCount { get; set; }
        protected int ACount { get; set; }
        protected int TotalRows { get; set; }
        protected double Percentage { get; set; }

        protected string roll;
        protected string subject;

        protected void Page_Load(object sender, EventArgs e)
        {
            subject = Request.QueryString["param2"];
            roll = Request.QueryString["param1"];

            SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project5;Integrated Security=True");
            conn.Open();
            SqlCommand cm;

            string query = String.Format("SELECT [attendance].[Date], [attendance].[Present] " +
                                         "FROM [dbo].[attendance] " +
                                         "INNER JOIN [dbo].[courses] ON [courses].[CCode] = [attendance].[CCode] " +
                                         "WHERE [courses].[CName] LIKE '{0}' " +
                                         "AND [attendance].[StuID] = '{1}'", subject, roll);

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

            PCount = 0;
            ACount = 0;

            while (reader.Read())
            {
                string[] row = new string[reader.FieldCount];
                for (int i = 0; i < reader.FieldCount; i++)
                {
                    // convert 0 to A and 1 to P
                    if (reader[i].ToString() == "0")
                    {
                        row[i] = "A";
                        ACount++;
                    }
                    else if (reader[i].ToString() == "1")
                    {
                        row[i] = "P";
                        PCount++;
                    }
                    else // preserve other values
                    {
                        row[i] = reader[i].ToString();
                    }
                }
                Data.Add(row);
            }



            TotalRows = Data.Count - 1; // exclude header row
            Percentage = (double)PCount / TotalRows * 100;

            // Close the first data reader
            reader.Close();

            Page.DataBind();

        }
    }
}
