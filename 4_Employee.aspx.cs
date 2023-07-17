using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using PdfSharp;
using PdfSharp.Drawing;
using PdfSharp.Pdf;
using System.IO;
using System.Diagnostics;
using Image = System.Web.UI.WebControls.Image;
using System.Web.Management;
using Microsoft.SqlServer.Server;


namespace WebApplication5
{
    public class ImageTemplate : ITemplate
    {
        private string columnName;
        private int imageWidth;
        private int imageHeight;

        public ImageTemplate(int imageWidth, int imageHeight)
        {
            this.columnName = "Emp_pic";
            this.imageWidth = imageWidth;
            this.imageHeight = imageHeight;
        }

        public void InstantiateIn(Control container)
        {
            Image image = new Image();
            image.DataBinding += new EventHandler(Image_DataBinding);
            container.Controls.Add(image);
        }

        protected void Image_DataBinding(object sender, EventArgs e)
        {
            Image image = (Image)sender;
            GridViewRow container = (GridViewRow)image.NamingContainer;
            object dataValue = DataBinder.Eval(container.DataItem, columnName);

            if (dataValue != DBNull.Value)
            {
                image.ImageUrl = dataValue.ToString();
            }

            image.Width = imageWidth;
            image.Height = imageHeight;
        }
    }

    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) { LoadRecord(); }
        }

        protected void InsertClick(object sender, EventArgs e)
        {
            try
            {
                string Image="";
                if (FileUpload1.HasFile)
                {
                    string str = FileUpload1.FileName;
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Upload/" + str));
                    Image = "~/Upload/" + str.ToString();
                }
                else
                {
                    Image = "~\\Upload\\def.jpg";
                }

                 string sql_query = "insert into Emp_data (Emp_id,Emp_nam,Emp_dept,Emp_salary,Emp_pic) values('" + int.Parse(EmpID.Text) + "','" + EmpName.Text + "','" + EmpDept.Text + "','" + int.Parse(EmpSal.Text) + "','" + Image + "')";
                 string success = "Successfully Inserted";
                 rock_and_roll(sql_query, success);
            }
            catch (Exception err) 
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + err.Message + "');", true);
            }
        }

        protected void UpdateClick(object sender, EventArgs e)
        {
            try
            {
                string Image = "";
                if (FileUpload1.HasFile)
                {
                    string str = FileUpload1.FileName;
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Upload/" + str));
                    Image = "~/Upload/" + str.ToString();
                }
                else
                {
                    Image = "~\\Upload\\def.jpg";
                }

                string sql_query = "update Emp_data set Emp_nam = '" + EmpName.Text + "', Emp_dept = '" + EmpDept.Text + "',Emp_salary = '" + int.Parse(EmpSal.Text) + "' , Emp_pic = '" + Image +"' where Emp_id = '" + int.Parse(EmpID.Text) + "'  ";
                string success = "Successfully Updated";
                rock_and_roll(sql_query, success);
            }
            catch (Exception err)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + err.Message + "');", true);
            }
        }

        protected void DeleteClick(object sender, EventArgs e)
        {
            try
            {
                string sql_query = "delete Emp_data where Emp_id = '" + int.Parse(EmpID.Text) + "'";
                string success = "Successfully deleted";
                rock_and_roll(sql_query, success);
            }
            catch (Exception err)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + err.Message + "');", true);
            }
        }

        SqlConnection con = new SqlConnection("Data Source=LAPTOP-TQRTMEM9;Initial Catalog=Tatap;Persist Security Info=True;User ID=pp;Password= ");
        protected void rock_and_roll(string sql_query, string message)
        {
            con.Open();
            SqlCommand comd = new SqlCommand(sql_query, con);
            comd.ExecuteNonQuery();
            con.Close();

            
            EmpID.Text = "";
            EmpName.Text = "";
            EmpSal.Text = "";
            EmpDept.Text = "";
            LoadRecord();
            Response.Redirect(Request.RawUrl);
            ScriptManager.RegisterStartupScript(this, this.GetType(), "script", "alert('" + message + "');", true);
        }
        void LoadRecord()
        {
            //Emp_id, Emp_nam, Emp_dept, Emp_salary
            SqlCommand comd = new SqlCommand("select * from Emp_data", con);

            SqlDataAdapter d = new SqlDataAdapter(comd);
            DataTable dt = new DataTable();
            d.Fill(dt);

            TemplateField imageField = new TemplateField();
            imageField.HeaderText = "Image";
            imageField.ItemTemplate = new ImageTemplate(100, 100); 

            GridView1.Columns.Add(imageField);

            GridView1.DataSource = dt;
            GridView1.DataBind();

        }


        protected void get_details(int id, ref string nam, ref string dept, ref int sal,ref string pic)
        {
            
            SqlConnection con = new SqlConnection("Data Source=LAPTOP-TQRTMEM9;Initial Catalog=Tatap;User ID=pp;Password= ");
            con.Open();

            SqlCommand cmd = new SqlCommand("select Emp_nam from Emp_data where Emp_id = '" + id + "' ", con);
            nam = Convert.ToString(cmd.ExecuteScalar());
            cmd = new SqlCommand("select Emp_dept from Emp_data where Emp_id = '" + id + "' ", con);
            dept = Convert.ToString(cmd.ExecuteScalar());
            cmd = new SqlCommand("select Emp_salary from Emp_data where Emp_id = '" + id + "' ", con);
            sal = Convert.ToInt32(cmd.ExecuteScalar());
            cmd = new SqlCommand("select Emp_pic from Emp_data where Emp_id = '" + id + "' ", con);
            pic = Convert.ToString(cmd.ExecuteScalar());

            con.Close();
            return;
        }

        protected void GetPDFClick(object sender, EventArgs e)
        {
            PdfDocument document = new PdfDocument();
            PdfPage page = document.AddPage();

            int id = int.Parse(EmpID.Text);
            string nam="";
            string dept="";
            int sal=0;
            string pic = "";

            get_details(id, ref nam, ref dept, ref sal,ref pic);

            XPoint position = new XPoint(50, 50);

            XGraphics gfx = XGraphics.FromPdfPage(page);
            XFont font = new XFont("Verdana", 20, XFontStyle.BoldItalic);
            gfx.DrawString("Id : "+ id +"", font, XBrushes.Black, position);
            position.Y += 20;
            gfx.DrawString("Name : " + nam + "", font, XBrushes.Black, position);
            position.Y += 20;
            gfx.DrawString("Department : " + dept + "", font, XBrushes.Black, position);
            position.Y += 20;
            gfx.DrawString("Salary : " + sal + "", font, XBrushes.Black, position);

            
            XImage image = XImage.FromFile("C:\\Users\\S B Gulati\\Desktop\\Gaurav\\visual studio\\Tata_Power"+pic.Substring(1));

            double x = 150;
            double y = 150;
            double width = 200;
            double height = 150;

            gfx.DrawImage(image, x,y, width, height);

            string fileName = "output_" + Guid.NewGuid().ToString() + ".pdf";

            using (MemoryStream stream = new MemoryStream())
            {
                document.Save(stream);
                document.Close();
                Response.Clear();

                Response.ContentType = "application/pdf";
                Response.AddHeader("Content-Disposition", "attachment; filename=" + fileName);

                Response.BinaryWrite(stream.ToArray());
                Response.End();
            }
        }
    }
}