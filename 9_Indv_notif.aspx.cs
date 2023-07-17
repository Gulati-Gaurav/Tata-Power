using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected int execute_query(string query, bool i)
        {
            SqlConnection con = new SqlConnection("Data Source=LAPTOP-TQRTMEM9;Initial Catalog=Tatap;Persist Security Info=True;User ID=pp;Password= ");
            con.Open();
            SqlCommand comd = new SqlCommand(query, con);
            int notifId = 0;
            if (i == false)
            {
                notifId = (int)comd.ExecuteScalar();
            }
            else
            {
                comd.ExecuteNonQuery();
            }
            con.Close();
            return notifId;
        }

        protected void SendBtn_Click(object sender, EventArgs e)
        {
            string input = Ids.Text;
            string[] tokens = input.Split(',');

            string message = msg.Text;
            string query = "INSERT INTO Notifs (notif_mess) OUTPUT INSERTED.notif_id VALUES ('" + message + "');";
            int notif_id = execute_query(query, false);

            foreach (string token in tokens)
            {
                string mergeQuery = "INSERT INTO Notif_merger (Cust_id, Notif_id) VALUES ('" + token + "', '" + notif_id + "');";
                execute_query(mergeQuery, true);
            }
            msg.Text = "";

            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Message Sent to All Specific Users');", true);
        }
    }
}