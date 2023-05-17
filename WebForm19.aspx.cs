using Org.BouncyCastle.Crypto.Encodings;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp01
{
    public partial class WebForm19 : System.Web.UI.Page

    {
        protected List<string[]> Data { get; set; }
        protected List<int> Presence { get; set; }

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
                                         "AND studentSection.SecID = {1} ",  Ccode, secID);

            cm = new SqlCommand(query, conn);

            SqlDataReader reader = cm.ExecuteReader();

            Data = new List<string[]>();
            Presence = new List<int>();

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
                    count++;
                }
                Data.Add(row);
            }

            

            // Close the data reader
            reader.Close();
        }

        protected void newFunc(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project5;Integrated Security=True");
            conn.Open();
            SqlCommand cm;
            string q = "Select MAX(EvalNo) AS HIGHEST FROM Evaluations";
            cm = new SqlCommand(q, conn);
            SqlDataReader reader = cm.ExecuteReader();
            reader.Read();
            cm.Dispose();

            int max = Convert.ToInt32(reader["HIGHEST"]);

            for (int i = 0; i < count; i++)
            {
                string ij = Convert.ToString(i + 1);
                int numbers = Convert.ToInt32(Request.QueryString["Presence_" + ij]);
                max++;
                string query = String.Format("INSERT INTO EVALUATIONS (CID, StuID, SecID, EvalID, EvalNo, Type, TotalMarks, ObtainedMarks, SemYear) VALUES " +
                                             "('{0}', '{1}', {2}, {3}, 3, 'Quiz', 10, {4}, '{5}')", Ccode, Data[i][0], secID, max, numbers, Data[i][2]);

                cm = new SqlCommand(query, conn);
                cm.ExecuteNonQuery();
                cm.Dispose();
            }

            conn.Close();
            Response.Redirect("WebForm20.aspx?param1=<%=Ccode %>&param2=<%=secID %>&param3=<%=roll %>");

        }

        protected void newFunc1(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project5;Integrated Security=True");
            conn.Open();
            SqlCommand cm;
            string q = "Select MAX(EvalNo) AS HIGHEST FROM Evaluations";
            cm = new SqlCommand(q, conn);
            SqlDataReader reader = cm.ExecuteReader();
            reader.Read();
            cm.Dispose();

            int max = Convert.ToInt32(reader["HIGHEST"]);

            for (int i = 0; i < count; i++)
            {
                string ij = Convert.ToString(i + 1);
                int numbers = Convert.ToInt32(Request.QueryString["Presence_" + ij]);
                max++;
                string query = String.Format("INSERT INTO EVALUATIONS (CID, StuID, SecID, EvalID, EvalNo, Type, TotalMarks, ObtainedMarks, SemYear) VALUES " +
                                             "('{0}', '{1}', {2}, {3}, 2, 'Quiz', 10, {4}, '{5}')", Ccode, Data[i][0], secID, max, numbers, Data[i][2]);

                cm = new SqlCommand(query, conn);
                cm.ExecuteNonQuery();
                cm.Dispose();
            }

            conn.Close();
            Response.Redirect("WebForm20.aspx?param1=<%=Ccode %>&param2=<%=secID %>&param3=<%=roll %>");
        }

        protected void newFunc2(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project5;Integrated Security=True");
            conn.Open();
            SqlCommand cm;
            string q = "Select MAX(EvalNo) AS HIGHEST FROM Evaluations";
            cm = new SqlCommand(q, conn);
            SqlDataReader reader = cm.ExecuteReader();
            reader.Read();
            cm.Dispose();

            int max = Convert.ToInt32(reader["HIGHEST"]);

            for (int i = 0; i < count; i++)
            {
                string ij = Convert.ToString(i + 1);
                int numbers = Convert.ToInt32(Request.QueryString["Presence_" + ij]);
                max++;
                string query = String.Format("INSERT INTO EVALUATIONS (CID, StuID, SecID, EvalID, EvalNo, Type, TotalMarks, ObtainedMarks, SemYear) VALUES " +
                                             "('{0}', '{1}', {2}, {3}, 1, 'Quiz', 10, {4}, '{5}')", Ccode, Data[i][0], secID, max, numbers, Data[i][2]);

                cm = new SqlCommand(query, conn);
                cm.ExecuteNonQuery();
                cm.Dispose();
            }

            conn.Close();
            Response.Redirect("WebForm20.aspx?param1=<%=Ccode %>&param2=<%=secID %>&param3=<%=roll %>");
        }
    }
}