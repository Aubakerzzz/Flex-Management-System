using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp01
{
    public partial class WebForm28 : System.Web.UI.Page
    {
        protected string roll;
        protected string name;
        protected string DOB;
        protected string gender;
        protected string email;
        protected string CNIC;
        protected string address;
        protected string phoneNum;
        protected string major;
        protected void Page_Load(object sender, EventArgs e)
        {
            roll = Request.QueryString["param1"];
            SqlConnection conn = new SqlConnection("Data Source=ALI\\SQLEXPRESS;Initial Catalog=project5;Integrated Security=True");
            conn.Open();

            string query = String.Format("SELECT * " +
                                         "FROM [dbo].[Userr] " +
                                         "WHERE [Userr].[UserID] = '{0}'", roll);


            SqlCommand cm = new SqlCommand(query, conn);

            SqlDataReader rdr = cm.ExecuteReader();
            rdr.Read();

            if (rdr["MName"].ToString() == "")
                name = rdr["FName"].ToString() + " " + rdr["LName"].ToString();
            else
                name = rdr["FName"].ToString() + " " + rdr["MName"].ToString() + " " + rdr["LName"].ToString();

            if (rdr["Gender"].ToString() == "M")
                gender = "Male";
            else
                gender = "Female";

            DOB = rdr["DOB"].ToString();
            email = rdr["Email"].ToString();
            CNIC = rdr["CNIC"].ToString();
            address = rdr["Address"].ToString();
            phoneNum = rdr["PhoneNum"].ToString();
            major = rdr["Major"].ToString();

            rdr.Close();
            cm.Dispose();
            conn.Close();
        }
    }
}