using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Security.Cryptography;
using System.Text;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Drawing;

namespace WebApplication5
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        private string mail;
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

        string getCorrectPass(string mail,ref int check_existence,ref bool logged)
        {
            string pass = "";
            SqlConnection con = new SqlConnection("Data Source=LAPTOP-TQRTMEM9;Initial Catalog=Tatap;User ID=pp;Password= ");
            con.Open();
            SqlCommand cmd = new SqlCommand("select COUNT(*) from Customer where Email_id = '" + mail + "' ", con);

            int count = (int)cmd.ExecuteScalar();
            if (count == 0) { check_existence = -1; return pass; }

            cmd = new SqlCommand("select Pass from Customer where Email_id = '" + mail + "' ", con);
            pass = Convert.ToString(cmd.ExecuteScalar());

            cmd = new SqlCommand("select logged from Customer where Email_id = '" + mail + "' ", con);
            object result = cmd.ExecuteScalar();
            logged = (bool)result;

            con.Close();
            return pass;
        }

        protected bool logged_here_or_not(string email)
        {
            if (Request.Cookies[email] == null)
            {
                return false;
            }
            return true;
        }

        protected void add_cookies(string email)
        {
            HttpCookie cookie = new HttpCookie(email);
            cookie.Value = "HI";
            Response.Cookies.Add(cookie);
            cookie.Expires = DateTime.Now.AddDays(7);
        }

        protected void Login_Click(object sender, EventArgs e)
        {
            string email = Email_id.Text;
            string pass = Pass1.Text;
            bool logged = true;
            int check_existence=0;
            string true_pass = getCorrectPass(email, ref check_existence,ref logged);

            if(check_existence==-1)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Incorrect Credentials');", true);
            }
            else
            {
                pass = HashPassword(pass);
                if (pass == true_pass)
                {
                    if (logged==false || (logged == true && logged_here_or_not(email) == true))
                    {
                        // change logged to 1 
                        SqlConnection con = new SqlConnection("Data Source=LAPTOP-TQRTMEM9;Initial Catalog=Tatap;User ID=pp;Password= ");
                        con.Open();
                        SqlCommand cmd = new SqlCommand("UPDATE Customer SET logged = 1 WHERE Email_id='"+email+"' ", con);
                        cmd.ExecuteNonQuery();
                        con.Close();

                        // add cookies 
                        add_cookies(email);

                        // redirect
                        Response.Redirect("https://localhost:44330/7_CustomerPage?method=email&emailID=" + email);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('You have already logged in somewhere. Please Log out of all devices first');", true);

                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Incorrect Credentials');", true);
                }
            }
        }
    }
}