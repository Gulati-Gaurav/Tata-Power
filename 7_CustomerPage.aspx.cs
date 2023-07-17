using Google.Apis.Auth.OAuth2.Flows;
using Google.Apis.Auth.OAuth2.Responses;
using Google.Apis.Auth.OAuth2;
using Google.Apis.Oauth2.v2;
using Google.Apis.Services;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Org.BouncyCastle.Asn1.Ocsp;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Data;
using System.Drawing;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;

namespace WebApplication5
{
    public partial class _7_CustomerPage : System.Web.UI.Page
    {
        protected void get_credentials(string mail, ref string nam, ref string ph, ref string billd, ref string addr)
        {
            SqlConnection con = new SqlConnection("Data Source=LAPTOP-TQRTMEM9;Initial Catalog=Tatap;User ID=pp;Password= ");
            con.Open();
            SqlCommand cmd =  new SqlCommand("select Name from Customer where Email_id = '" + mail + "' ", con);
            nam = Convert.ToString(cmd.ExecuteScalar());
            cmd = new SqlCommand("select Phone from Customer where Email_id = '" + mail + "' ", con);
            ph = Convert.ToString(cmd.ExecuteScalar());
            cmd = new SqlCommand("select Address from Customer where Email_id = '" + mail + "' ", con);
            addr = Convert.ToString(cmd.ExecuteScalar());
            cmd = new SqlCommand("select Bill_due from Customer where Email_id = '" + mail + "' ", con);
            billd = Convert.ToString(cmd.ExecuteScalar());
            con.Close();
            return ;
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

        protected void excQuery(string sql_query)
        {
            SqlConnection con = new SqlConnection("Data Source=LAPTOP-TQRTMEM9;Initial Catalog=Tatap;Persist Security Info=True;User ID=pp;Password= ");
            con.Open();
            SqlCommand comd = new SqlCommand(sql_query, con);
            comd.ExecuteNonQuery();
            con.Close();
        }

        string mail;
        protected void Update_Click(object sender, EventArgs e)
        {
            string pass = newPass.Text;
            string ph = newPh.Text;

            if (pass != "")
            {
                try
                {
                    pass = HashPassword(pass);
                    string sql_query = "update Customer set Pass = '" + pass + "' where Email_id = '" + mail + "'  ";
                    excQuery(sql_query);
                    newPass.Text = "";
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid Format for password');", true);
                }
            }
            if (ph != "")
            {
                try
                {
                    string sql_query = "update Customer set Phone = '" + int.Parse(ph) + "' where Email_id = '" + mail + "'  ";
                    excQuery(sql_query);
                    newPh.Text = "";
                }
                catch
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Invalid Format for Phone Number. Try Again');", true);
                }
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            string loginMethod = Request.QueryString["method"];
             if (loginMethod == "email")
            {
                string nam = "";
                string ph = "";
                string billd = "";
                string addr = "";
                string email = Request.QueryString["emailID"];

                get_credentials(email, ref nam, ref ph, ref billd, ref addr);

                Label1.Text = "Hi " + nam + " Your Details are:-";
                Label2.Text = "Your Phone Number - " + ph;
                Label3.Text = "Your Bill Due - " + billd;
                Label4.Text = "Your Address - " + addr;
                Label5.Text = "Change Your Credentials";
                Label6.Text = "New Password = ";
                Label7.Text = "New Phone Number = ";
                newPass.Visible = true;
                newPh.Visible = true;
                UpdateButton.Visible = true;
                mail = email;

                SqlConnection con = new SqlConnection("Data Source=LAPTOP-TQRTMEM9;Initial Catalog=Tatap;Persist Security Info=True;User ID=pp;Password= ");

                SqlCommand comd = new SqlCommand("SELECT notif_mess FROM Notif_merger JOIN Notifs ON Notif_merger.notif_id = Notifs.notif_id WHERE notif_merger.Cust_id = '"+mail+"';", con);

                SqlDataAdapter d = new SqlDataAdapter(comd);
                DataTable dt = new DataTable();
                d.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                Label1.Text = "Invalid login method";
            }
        }

        protected void logOutBtn_Click(object sender, EventArgs e)
        {
            // set logged to 0 
            SqlConnection con = new SqlConnection("Data Source=LAPTOP-TQRTMEM9;Initial Catalog=Tatap;User ID=pp;Password= ");
            con.Open();
            SqlCommand cmd = new SqlCommand("UPDATE Customer SET logged = 0 WHERE Email_id = '" + mail + "' ", con);
            cmd.ExecuteNonQuery();
            con.Close();

            // remove cookie
            HttpCookie cookie = new HttpCookie(mail);
            cookie.Expires = DateTime.Now.AddDays(-1); 
            Response.Cookies.Add(cookie);

            // redirect to TATA Homepage
            Response.Redirect("1_MainPg.aspx");
        }
    }
}
