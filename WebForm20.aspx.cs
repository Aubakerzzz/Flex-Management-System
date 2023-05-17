using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp01
{
    public partial class WebForm20 : System.Web.UI.Page
    {
        protected string Ccode;
        protected int SecID;
        protected string roll;
        protected void Page_Load(object sender, EventArgs e)
        {
            Ccode = Request.QueryString["param1"];
            SecID = Convert.ToInt32(Request.QueryString["param2"]);
            roll = Request.QueryString["param3"];
        }
    }
}