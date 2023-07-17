using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void New_Customer_Click(object sender, EventArgs e)
        {
            Response.Redirect("5_CreateUser.aspx");
        }

        protected void Employee_Click(object sender, EventArgs e)
        {
            Response.Redirect("4_Employee.aspx");
        }

        protected void Bulk_notif(object sender, EventArgs e)
        {
            Response.Redirect("8_Bulk_notif.aspx");
        }

        protected void Indv_notif(object sender, EventArgs e)
        {
            Response.Redirect("9_Indv_notif.aspx");
        }
    }
}