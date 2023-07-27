using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source=LAPTOP-TQRTMEM9;Initial Catalog=Tatap;Persist Security Info=True;User ID=pp;Password=");

            SqlCommand comd = new SqlCommand("select * from temp_cord", con);

            SqlDataAdapter d = new SqlDataAdapter(comd);
            DataTable dt = new DataTable();
            d.Fill(dt);

            GridView1.DataSource = dt;
            GridView1.DataBind();
            
            ClientScript.RegisterStartupScript(GetType(), "Javascript", "javascript:loadMap()", true);
        }
    }
}
