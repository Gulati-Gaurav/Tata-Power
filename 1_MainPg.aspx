<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="1_MainPg.aspx.cs" Inherits="WebApplication5.MainPg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            background: #444;
            color: #0A6EBD;
        }
        .auto-style1 {
            width: 100%;
            height: 672px;
        }
        .auto-style2 {
            font-size: xx-large;
            text-align: center;
        }
        .auto-style3 {
            height: 139px;
            width: 433px;
        }
        .auto-style4 {
            height: 339px;
        }
        .auto-style5 {
            padding:0;
            height: 139px;
            width: 483px;
        }
        .btn
        {
            cursor: pointer;
            margin: auto;
            display: inline-block;
            border-radius:50%;
            background: #FFE79B;
            box-shadow: 0px 0px 10px 10px #FF4301;
        }
        img
        {
            border-top-left-radius:50%;
            border-top-right-radius:50%;
            box-shadow: 0px -20px 10px 10px white;
        }
        .auto-style7 {
            font-size: xx-large;
            text-align: center;
            text-decoration: underline;
        }
        .auto-style8 {
            height: 339px;
            width: 432px;
        }
        .auto-style9 {
            padding: 0;
            height: 139px;
            width: 432px;
        }
        .auto-style10 {
            height: 139px;
            width: 27px;
        }
        .auto-style11 {
            height: 339px;
            width: 433px;
        }
        .auto-style12 {
            width: 304px;
            height: 187px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style8">
                        &nbsp;</td>
                    <td class="auto-style4" colspan="2">
                        <h1 class="auto-style7">Welcome to TATA Power Limited</h1>
                        <h4 class="auto-style7">Lighting Up Lives</h4>
                        <p class="auto-style2">
                            <img alt="tt" class="auto-style12" src="Images/640px-Tata_Power_Logo.png" /></p>
                    </td>
                    <td class="auto-style11">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        &nbsp;</td>
                    <td class="auto-style5">
                        <asp:Button CssClass="btn" ID="AdminLogin" runat="server" Height="209px" Text="Admin Login" Width="209px" OnClick="AdminLogin_Click" Font-Names="Segoe UI Semibold" Font-Size="Large" ForeColor="#FF4301" />
                    </td>
                    <td class="auto-style10">
                        <asp:Button CssClass="btn" ID="CustLogin" runat="server" Height="209px" Text="Customer Login" Width="209px" Font-Names="Segoe UI Semibold" Font-Size="Large" ForeColor="#FF4301" OnClick="CustLogin_Click" />
                    </td>
                    <td class="auto-style3">
                        &nbsp;</td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
