using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp01
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected List<string[]> Data { get; set; }
        protected List<string[]> Usernames { get; set; }
        protected List<string[]> Usernames1 { get; set; }
        protected List<string[]> Usernames2 { get; set; }
        protected List<string[]> Usernames3 { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=DESKTOP-DKE8JJK\\SQLEXPRESS;Initial Catalog=new1Data;Integrated Security=True");
            conn.Open();
            SqlCommand cm;
            string query = "SELECT total_marks, obtained_marks FROM Evaluations WHERE stu_id = 1234 AND type = 'Assignment'";
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

            while (reader.Read())
            {
                string[] row = new string[reader.FieldCount];
                for (int i = 0; i < reader.FieldCount; i++)
                {
                    row[i] = reader[i].ToString();
                }
                Data.Add(row);
            }

            // Close the first data reader
            reader.Close();

            string query1 = "SELECT total_marks, obtained_marks FROM Evaluations WHERE stu_id = 1234 AND type = 'Quiz'";
            cm = new SqlCommand(query1, conn);

            SqlDataReader reader1 = cm.ExecuteReader();

            Usernames = new List<string[]>();

            // get column names and add as first row of data
            string[] columnNames1 = new string[reader1.FieldCount];
            for (int i = 0; i < reader1.FieldCount; i++)
            {
                columnNames1[i] = reader1.GetName(i);
            }
            Usernames.Add(columnNames1);

            while (reader1.Read())
            {
                string[] row1 = new string[reader1.FieldCount];
                for (int i = 0; i < reader1.FieldCount; i++)
                {
                    row1[i] = reader1[i].ToString();
                }
                Usernames.Add(row1);
            }

            // Close the first data reader
            reader1.Close();


            string query2 = "SELECT total_marks, obtained_marks FROM Evaluations WHERE stu_id = 1234 AND type = 'Sessional 1'";
            cm = new SqlCommand(query2, conn);

            SqlDataReader reader2 = cm.ExecuteReader();

            Usernames1 = new List<string[]>();

            // get column names and add as first row of data
            string[] columnNames2 = new string[reader2.FieldCount];
            for (int i = 0; i < reader2.FieldCount; i++)
            {
                columnNames2[i] = reader2.GetName(i);
            }
            Usernames1.Add(columnNames2);

            while (reader2.Read())
            {
                string[] row2 = new string[reader2.FieldCount];
                for (int i = 0; i < reader2.FieldCount; i++)
                {
                    row2[i] = reader2[i].ToString();
                }
                Usernames1.Add(row2);
            }

            // Close the first data reader
            reader2.Close();

            string query3 = "SELECT total_marks, obtained_marks FROM Evaluations WHERE stu_id = 1234 AND type = 'Sessional 2'";
            cm = new SqlCommand(query3, conn);

            SqlDataReader reader3 = cm.ExecuteReader();

            Usernames2 = new List<string[]>();

            // get column names and add as first row of data
            string[] columnNames3 = new string[reader3.FieldCount];
            for (int i = 0; i < reader3.FieldCount; i++)
            {
                columnNames3[i] = reader3.GetName(i);
            }
            Usernames2.Add(columnNames3);

            while (reader3.Read())
            {
                string[] row3 = new string[reader3.FieldCount];
                for (int i = 0; i < reader3.FieldCount; i++)
                {
                    row3[i] = reader3[i].ToString();
                }
                Usernames2.Add(row3);
            }

            // Close the first data reader
            reader3.Close();



            string query4 = "SELECT total_marks, obtained_marks FROM Evaluations WHERE stu_id = 1234 AND type = 'Final'";
            cm = new SqlCommand(query4, conn);
        
            SqlDataReader reader4 = cm.ExecuteReader();

            Usernames3 = new List<string[]>();

            // get column names and add as first row of data
            string[] columnNames4 = new string[reader4.FieldCount];
            for (int i = 0; i < reader4.FieldCount; i++)
            {
                columnNames4[i] = reader4.GetName(i);
            }
            Usernames3.Add(columnNames4);

            while (reader4.Read())
            {
                string[] row4 = new string[reader4.FieldCount];
                for (int i = 0; i < reader4.FieldCount; i++)
                {
                    row4[i] = reader4[i].ToString();
                }
                Usernames3.Add(row4);
            }

            // Close the first data reader
            reader4.Close();
            Page.DataBind();
        }


    }
}
