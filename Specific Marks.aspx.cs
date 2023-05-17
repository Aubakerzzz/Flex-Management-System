using iTextSharp.text.pdf;
using iTextSharp.text;
using iTextSharp.tool.xml;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

namespace WebApp01
{
    public partial class WebForm24 : System.Web.UI.Page
    {
        protected List<string[]> Data { get; set; }
        protected string roll;
        protected string subject;
        protected void Page_Load(object sender, EventArgs e)
        {
            string roll = Request.QueryString["param2"];
            string subject = Request.QueryString["param1"];

            if (!this.IsPostBack)
            {
                SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project5;Integrated Security=True");
                conn.Open();
                SqlCommand cm;
                string query = String.Format("SELECT [evaluations].[ObtainedMarks], [evaluations].[TotalMarks], [evaluations].[Type] " +
                                             "from [dbo].[evaluations] " +
                                             "inner join [dbo].[courses] on [courses].[Ccode] = [Evaluations].[CID] " +
                                             "where [Evaluations].[StuID] like '{0}' " +
                                             "and [courses].[Ccode] like '{1}' ", roll, subject);

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

        protected void submit_Click(object sender, EventArgs e)
        {


        }
    }
}