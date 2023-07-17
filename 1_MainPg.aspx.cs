using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class MainPg : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void AdminLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("2_Admin_login.aspx");
        }

        protected void CustLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("6_CustLogin.aspx");
        }
    }
}