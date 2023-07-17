<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="6_CustLogin.aspx.cs" Inherits="WebApplication5.WebForm2" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        body
        {
            font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;
            background: #222;
            color: #16FF00;
        }
        #flexContainer
        {
             display: flex;
             justify-content: space-around;
             flex-direction: row;
        }
        .flex-items
        {
          display: flex;
          flex-direction: column;
          padding : 20px;
        }
        .btn
        {
            cursor: pointer;
            margin: auto;
            border-radius :10px;
            background: #FFE79B;
            height:100%;
            box-shadow: 0px 0px 10px 10px #16FF00;
        }
        .txtbx
        {
            border-radius:10px;
        }
        span
        {
            padding: 10px;
        }
        .auto-style1 {
            width: 100%;
            height: 629px;
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
            height: 225px;
        }
        .auto-style7 {
            font-size: 60px;
            text-align: center;
            text-decoration: underline;
        }
        .auto-style8 {
            height: 225px;
            width: 31%;
        }
        .auto-style9 {
            padding: 0;
            height: 139px;
            width: 31%;
        }
        .auto-style12 {
            width: 255px;
            height: 147px;
        }
        .auto-style15 {
            padding: 0;
            height: 54px;
            width: 17%;
        }
        .auto-style19 {
            padding: 0;
            height: 54px;
            width: 629px;
        }
        .auto-style22 {
            padding: 0;
            height: 51px;
        }
        .auto-style25 {
            padding: 0;
            height: 16px;
            width: 629px;
        }
        .auto-style26 {
            padding: 0;
            height: 16px;
            width: 17%;
        }
        .auto-style27 {
            padding: 0;
            height: 29px;
        }
        .auto-style28 {
            padding: 0;
            height: 38px;
            width: 629px;
        }
        .auto-style29 {
            padding: 0;
            height: 38px;
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
                        </td>
                    <td class="auto-style4" colspan="2">
                        <h1 class="auto-style7">USER Login</h1>
                        <p class="auto-style2">
                            <a href="1_MainPg.aspx"><img alt="tt" class="auto-style12" src="Images/640px-Tata_Power_Logo.png" /></a> 
                        </p>
                    </td>
                    <td class="auto-style8">
                        </td>
                </tr>
                <tr>
                    <td class="auto-style9" rowspan="5">
                        &nbsp;</td>
                    <td class="auto-style25">
                        <strong>Enter Email ID&nbsp;</strong></td>
                    <td class="auto-style26">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox CssClass="txtbx" ID="Email_id" runat="server" Height="30px"></asp:TextBox>
                    </td>
                    <td class="auto-style3" rowspan="5">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style19">
                        <strong>Enter Password&nbsp;</strong></td>
                    <td class="auto-style15">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox CssClass="txtbx" ID="Pass1" runat="server" TextMode="Password" Height="33px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style28">
                        <strong>Re-enter Password&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></td>
                    <td class="auto-style29">
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox CssClass="txtbx" ID="Pass2" runat="server" TextMode="Password" Height="30px"></asp:TextBox>
                        <br />
&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="Pass1" ControlToValidate="Pass2" ErrorMessage="Passwords Doesn't Match" Font-Size="Smaller" ForeColor="Red">Password Doesn&#39;t Match</asp:CompareValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style27" colspan="2">
                    </td>
                </tr>
                <tr>
                    <td class="auto-style22" colspan="2">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                        <asp:Button class="btn" ID="Button1" runat="server" OnClick="Login_Click" Text="Log In" Width="167px" Height="33px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>

