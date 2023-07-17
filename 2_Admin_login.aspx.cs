using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication5
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string HashPassword(string password)
        {
            using (var sha256 = SHA256.Create())
            {
                byte[] passwordBytes = Encoding.UTF8.GetBytes(password);
                byte[] hashedBytes = sha256.ComputeHash(passwordBytes);
                string hashedPassword = Convert.ToBase64String(hashedBytes);
                return hashedPassword;
            }
        }

        protected string get_password(string user_name, ref string check_existence)
        {
            string pass = "";
            SqlConnection con = new SqlConnection("Data Source=LAPTOP-TQRTMEM9;Initial Catalog=Tatap;User ID=pp;Password=");
            con.Open();
            SqlCommand cmd = new SqlCommand("select COUNT(*) from Admin_details where Admin_nam = '" + user_name + "' ", con);

            int count = (int)cmd.ExecuteScalar();
            if (count == 0) { check_existence = "-1"; return pass; }

            cmd = new SqlCommand("select Admin_pass from Admin_details where Admin_nam = '" + user_name + "' ", con);
            pass = Convert.ToString(cmd.ExecuteScalar());
            con.Close();
            return pass;
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            string admin_login_id = Login_id.Text;
            string pass = Pass1.Text;
            string check_exist = "";
            pass = HashPassword(pass);
            string true_pass = get_password(admin_login_id, ref check_exist);
            if (check_exist=="-1" || pass!=true_pass)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid Credentials');", true);   
            }
            else
            {
                Response.Redirect("3_AdminControl.aspx");
            }
        }
    }
}