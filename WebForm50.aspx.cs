using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApp01
{
    public partial class WebForm50 : System.Web.UI.Page
    {
        protected string roll;
        protected void Page_Load(object sender, EventArgs e)
        {
            roll = Request.QueryString["param1"];
        }
    }
}