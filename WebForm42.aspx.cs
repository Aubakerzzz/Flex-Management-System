using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp01
{
    public partial class WebForm42 : System.Web.UI.Page
    {
        protected List<List<string>> Data { get; set; }
        protected string roll;
        protected void Page_Load(object sender, EventArgs e)
        {
            roll = Request.QueryString["param1"];

            if (!this.IsPostBack)
            {
                SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project5;Integrated Security=True");
                conn.Open();
                SqlCommand cm;
                string query = String.Format("SELECT studentSection.Ccode, courses.Cname, studentSection.SecID, courses.Credits, studentSection.SemNum, studentSection.Grade " +
                                             "FROM studentSection " +
                                             "INNER JOIN courses on courses.Ccode = studentSection.Ccode " +
                                             "WHERE studentSection.StuID LIKE '{0}' " +
                                             "AND studentSection.Status = 1 ", roll);

                cm = new SqlCommand(query, conn);
                SqlDataReader reader = cm.ExecuteReader();

                Data = new List<List<string>>();

                // get column names and add as first row of data
                List<string> columnNames = new List<string>();
                for (int i = 0; i < reader.FieldCount; i++)
                {
                    columnNames.Add(reader.GetName(i));
                }
                Data.Add(columnNames);

                // get data rows and add them to the list
                while (reader.Read())
                {
                    List<string> row = new List<string>();
                    for (int i = 0; i < reader.FieldCount; i++)
                    {
                        row.Add(reader.GetValue(i).ToString());
                    }
                    row.Add("Core");
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