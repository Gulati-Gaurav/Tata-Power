using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using SendGrid;
using SendGrid.Helpers.Mail;

using MailKit.Net.Smtp;
using MailKit.Security;
using MimeKit;
using System.Net.Http;
using System.Threading.Tasks;

using System.IO;



namespace WebApplication5
{
    public partial class WebForm5 : System.Web.UI.Page
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
    
        private int correct_values(string phno, string username)
        {
            if (phno.Length != 10)
            {return -1;}

            for (int i = 0; i < username.Length; i++)
            {
                if ((username[i] >= 65 && username[i] <= 90) || (username[i] >= 97 && username[i] <= 122)) { continue; }
                return -2;
            }
            return 1;
        }

        protected void insert_Click(object sender, EventArgs e)
        {
            try
            {
                string mail_id = mail.Text;
                string name_user = nam.Text;
                Int64 phone = Int64.Parse(phno.Text);
                string ph_temp = phone.ToString();
                string address = addr.Text;
                string pass = name_user + ph_temp.Substring(ph_temp.Length - 4);
                pass = HashPassword(pass);
                int bill_d = 0;

                int valid  = correct_values(ph_temp, name_user);

                if (valid == 1)
                {
                    string sql_query = "insert into Customer (Email_id,Name,Address,Phone,Pass,Bill_due) values('" + mail_id + "','" + name_user + "','" + address + "','" + phone + "','" + pass + "','" + bill_d + "')";

                    SqlConnection con = new SqlConnection("Data Source=LAPTOP-TQRTMEM9;Initial Catalog=Tatap;Persist Security Info=True;User ID=pp;Password= ");

                    con.Open();
                    SqlCommand comd = new SqlCommand(sql_query, con);
                    comd.ExecuteNonQuery();
                    con.Close();

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Account Created Successfully');", true);
                }
                else
                {
                    if (valid == -1)
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Phone Number should be of 10 digits');", true);
                    else
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('Username should have only letters');", true);
                }
                mail.Text = "";
                nam.Text = "";
                phno.Text = "";
                addr.Text = "";
            }
            catch(Exception err)
            {
                mail.Text = "";
                nam.Text = "";
                phno.Text = "";
                addr.Text = "";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + err.Message + "');", true);
            }
        }

        protected void back_Click(object sender, EventArgs e)
        {
            Response.Redirect("1_MainPg.aspx");
        }
    }
}