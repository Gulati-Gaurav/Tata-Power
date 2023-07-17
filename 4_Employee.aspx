<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="4_Employee.aspx.cs" Inherits="WebApplication5.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        
        .auto-style2 {
            text-decoration: underline;
            color: #3EC1D3;
            font-size: x-large;
            text-align: center;
        }
        body
        {
            font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #F6F7D7;
            color:#FF165D;
            width:100%;
            font-weight:bolder;
            margin:0;
        }
        table
        {
            margin: auto;
        }
        .btn
        {
            cursor: pointer;
            border-radius: 10px;
            background-color:#FF9A00;
        }
        .auto-style3 {
            text-align: center;
        }
        .auto-style6 {
            height: 32px;
        }
        .auto-style7 {
            width: 814px;
        }
        .auto-style9 {
            width: 7254px;
            height: 33px;
        }
        .auto-style10 {
            width: 814px;
            height: 33px;
        }
        .auto-style17 {
            width: 7254px;
            height: 32px;
        }
                
        .auto-style19 {
            width: 921px;
        }
        
        .auto-style20 {
            width: 146px;
            height: 177px;
            margin:auto;
        }
        
        .auto-style23 {
            width: 238px;
            height: 33px;
        }
        .auto-style25 {
            width: 7254px;
            height: 54px;
        }
        .auto-style26 {
            height: 54px;
        }
        .auto-style27 {
            height: 77px;
        }
        
        .auto-style28 {
            height: 33px;
        }
        .auto-style29 {
            width: 7254px;
        }
        .auto-style32 {
            height: 77px;
            width: 814px;
        }
        .auto-style33 {
            height: 32px;
            width: 814px;
        }
        .auto-style35 {
            width: 787px;
            height: 33px;
        }
        .auto-style36 {
            width: 787px;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style2">
            <div class="auto-style3">
            <h1" class="auto-style3"><a href="1_MainPg.aspx"><strong>Employee Data Retreival/Updation at TataPower</strong></a></h1></div>
        </div>
    <table class="auto-style19">
        <tr>
            <td colspan="2">
                </td>
            <td class="auto-style36">
                </td>
            <td class="auto-style7">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style25">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Enter Employee ID</td>
            <td class="auto-style26" colspan="2">
                <asp:TextBox ID="EmpID" runat="server" ValidationGroup="RV" onkeypress="return isNumber(event);" ></asp:TextBox>
            &nbsp;</td>
            <td class="auto-style7" rowspan="4">
                <img alt="gigg" class="auto-style20" src="Images/gigg.gif" /></td>
        </tr>
        <tr>
            <td class="auto-style17">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Enter Employee Name</td>
            <td class="auto-style6" colspan="2">
                <asp:TextBox ID="EmpName" runat="server" ValidationGroup="RV"></asp:TextBox>
            &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style29">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Enter Employee Dept</td>
            <td colspan="2">
                <asp:TextBox ID="EmpDept" runat="server" ValidationGroup="RV"></asp:TextBox>
            &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style17">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Enter Employee Salary</td>
            <td class="auto-style6" colspan="2">
                <asp:TextBox ID="EmpSal" runat="server" ValidationGroup="RV" onkeypress="return isNumber(event);"></asp:TextBox>
            &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Enter Employee Pict.</td>
            <td class="auto-style28" colspan="2">
                <asp:FileUpload ID="FileUpload1" runat="server" accept="image/*" Width="277px" AllowMultiple="True" />
            &nbsp;</td>
            <td class="auto-style10">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style9">&nbsp;</td>
            <td class="auto-style23">&nbsp;</td>
            <td class="auto-style35">&nbsp;</td>
            <td class="auto-style10">&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style27" colspan="3">&nbsp;
                <asp:Button CssClass="btn" ID="insert" runat="server" BorderStyle="Outset" Font-Bold="True" Font-Names="Segoe UI Semibold" Font-Overline="False" ForeColor="White" Height="34px" OnClick="InsertClick" Text="Insert" Width="178px" />
&nbsp;&nbsp;<asp:Button CssClass="btn" ID="getpdf" runat="server" BorderStyle="Outset" Font-Bold="True" Font-Names="Segoe UI Semibold" Font-Overline="False" ForeColor="White" Height="34px" OnClick="GetPDFClick" Text="Get PDF" Width="178px" />
                &nbsp; <asp:Button CssClass="btn" ID="update0" runat="server" BorderStyle="Outset" Font-Bold="True" Font-Names="Segoe UI Semibold" Font-Overline="False" ForeColor="White" Height="34px" OnClick="DeleteClick" Text="Delete" Width="178px" />
                &nbsp;
                <asp:Button CssClass="btn" ID="update" runat="server" BorderStyle="Outset" Font-Bold="True" Font-Names="Segoe UI Semibold" Font-Overline="False" ForeColor="White" Height="34px" OnClick="UpdateClick" Text="Update" Width="178px" />
                </td>
            <td class="auto-style32">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style6" colspan="3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <div class="auto-style3">
                    <asp:GridView ID="GridView1" runat="server"  Width="710px" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" ForeColor="Black" GridLines="None" AutoGenerateColumns="True">
                        <AlternatingRowStyle BackColor="PaleGoldenrod" />
                        <FooterStyle BackColor="Tan" />
                        <HeaderStyle BackColor="Tan" Font-Bold="True" />
                        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
                        <SortedAscendingCellStyle BackColor="#FAFAE7" />
                        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
                        <SortedDescendingCellStyle BackColor="#E1DB9C" />
                        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
                    </asp:GridView>
                </div>
            </td>
            <td class="auto-style33">&nbsp;</td>
        </tr>
        </table>
    </form>
    </body>
    <script>
        function isNumber(evt)
        {
            var charCode = (evt.which) ? evt.which : event.keyCode;
            if (charCode > 31 && (charCode < 48 || charCode > 57))
            {
                return false;
            }
            return true;
        }
    </script>
</html>
