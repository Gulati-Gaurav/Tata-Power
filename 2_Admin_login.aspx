<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="2_Admin_login.aspx.cs" Inherits="WebApplication5.WebForm3" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            background: #222;
            color: #34B3F1;
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
            width: 31%;
        }
        .auto-style4 {
            height: 339px;
        }
        .btn
        {
            cursor: pointer;
            margin: auto;
            border-radius :10px;
            background: #FFE79B;
            height:100%;
            box-shadow: 0px 0px 10px 10px #34B3F1;
        }
        .txtbx
        {
            border-radius:10px;
        }
        .auto-style7 {
            font-size: 60px;
            text-align: center;
            text-decoration: underline;
        }
        .auto-style8 {
            height: 339px;
            width: 31%;
        }
        .auto-style9 {
            padding: 0;
            height: 139px;
            width: 31%;
        }
        .auto-style12 {
            width: 304px;
            height: 187px;
        }
        .auto-style14 {
            padding: 0;
            height: 53px;
        }
        .auto-style15 {
            padding: 0;
            height: 54px;
            width: 17%;
        }
        .auto-style16 {
            padding: 0;
            height: 39px;
        }
        .auto-style19 {
            padding: 0;
            height: 54px;
            width: 1461px;
        }
        .auto-style22 {
            padding: 0;
            height: 51px;
        }
        .auto-style23 {
            padding: 0;
            height: 31px;
            width: 1461px;
        }
        .auto-style24 {
            padding: 0;
            height: 31px;
            width: 17%;
        }
        .auto-style25 {
            padding: 0;
            height: 16px;
            width: 1461px;
        }
        .auto-style26 {
            padding: 0;
            height: 16px;
            width: 17%;
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
                        <h1 class="auto-style7">ADMIN Login</h1>
                        <p class="auto-style2">
                            <a href="1_MainPg.aspx"> <img alt="tt" class="auto-style12" src="Images/640px-Tata_Power_Logo.png" onclick="redirectToPage()" />
                            </a>
                        </p>
                    </td>
                    <td class="auto-style8">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9" rowspan="6">
                        &nbsp;</td>
                    <td class="auto-style25">
                        <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Enter Login ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></td>
                    <td class="auto-style26">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox CssClass="txtbx" ID="Login_id" runat="server" Height="30px"></asp:TextBox>
                    </td>
                    <td class="auto-style3" rowspan="6">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style19">
                        <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Enter Password&nbsp;</strong></td>
                    <td class="auto-style15">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox CssClass="txtbx" ID="Pass1" runat="server" TextMode="Password" Height="33px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style23">
                        <strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Re-enter Password&nbsp;</strong></td>
                    <td class="auto-style24">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox CssClass="txtbx" ID="Pass2" runat="server" TextMode="Password" Height="30px"></asp:TextBox>
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Pass1" ControlToValidate="Pass2" ErrorMessage="Passwords Doesn't Match" Font-Size="Smaller" ForeColor="Red">Password Doesn&#39;t Match</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style14" colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style22" colspan="2">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button class="btn" ID="Button1" runat="server" OnClick="Login_Click" Text="Button" Width="335px" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style16" colspan="2">
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
