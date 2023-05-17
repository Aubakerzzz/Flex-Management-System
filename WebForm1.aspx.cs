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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string roll = Request.QueryString["param1"];
            string Ccode = Request.QueryString["param2"];
            int secID = Convert.ToInt32(Request.QueryString["param3"]);
            string type = Request.QueryString["param4"];
            int number = Convert.ToInt32(Request.QueryString["param5"]);
            int totalmarks = Convert.ToInt32(Request.QueryString["Totalmarks"]);
            string year = Request.QueryString["param6"];


            SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project5;Integrated Security=True;MultipleActiveResultSets=true");
            conn.Open();
            SqlCommand cm;
            string q = "Select MAX(EvalNo) AS HIGHEST FROM Evaluations";
            cm = new SqlCommand(q, conn);
            SqlDataReader reader = cm.ExecuteReader();
            reader.Read();
            cm.Dispose();

            int max = Convert.ToInt32(reader["HIGHEST"]);

            for (int i = 0; i < 15; i++)
            {
                int para = Convert.ToInt32(Request.QueryString["Presence_" + Convert.ToString(i + 1)]);
                string ro = Request.QueryString["roll_" + Convert.ToString(i + 1)];
                
                max++;
                string query = String.Format("INSERT INTO EVALUATIONS (CID, StuID, SecID, EvalID, EvalNo, Type, TotalMarks, ObtainedMarks, SemYear) VALUES " +
                                                 "('{0}', '{1}', {2}, {3}, {4}, '{5}', {6}, {7}, '{8}')", Ccode, ro , secID, max, number, type, totalmarks, para, year);

                cm = new SqlCommand(query, conn);
                cm.ExecuteNonQuery();
                cm.Dispose();

            }

            conn.Close();
            Response.Redirect("WebForm15.aspx?param1=" + roll);
        }
    }
}