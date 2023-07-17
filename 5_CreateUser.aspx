<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="5_CreateUser.aspx.cs" Inherits="WebApplication5.WebForm5" %>

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

         h1
         {
             margin: auto;
         }

        .auto-style1 {
            width: 100%;
            height: 593px;
        }
        .auto-style2 {
            height: 125px;
        }
        .auto-style3 {
            height: 125px;
            width: 429px;
        }
        .auto-style4 {
            width: 429px;
        }
        .auto-style5 {
            height: 125px;
            width: 611px;
        }
        .auto-style6 {
            width: 611px;
        }
        .auto-style7 {
            width: 554px;
            height: 57px;
            color: #FFFF00;
        }
        .auto-style8 {
            width: 65px;
        }
        .auto-style9 {
            width: 316px;
        }
        .auto-style10 {
            width: 611px;
            height: 78px;
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
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style3"></td>
                    <td class="auto-style5" colspan="2">
                        <h1 class="auto-style7">&nbsp;<a href="1_MainPg.aspx"> Create A New Customer Login</a></h1>
                    </td>
                    <td class="auto-style2"></td>
                </tr>
                <tr>
                    <td class="auto-style4" rowspan="4">&nbsp;</td>
                    <td class="auto-style9">
                        <asp:Label ID="Label1" runat="server" Text="Customer Mail Id" Width="248%" Font-Size="Large"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:TextBox ID="mail" runat="server"></asp:TextBox>
                    </td>
                    <td rowspan="4">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="Label2" runat="server" Text="Customer Name" Width="248%" Font-Size="Large"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:TextBox ID="nam" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="Label3" runat="server" Text="Customer Phone No." Width="248%" Font-Size="Large"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:TextBox ID="phno" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style9">
                        <asp:Label ID="Label4" runat="server" Text="Customer Address" Width="248%" Font-Size="Large"></asp:Label>
                    </td>
                    <td class="auto-style8">
                        <asp:TextBox ID="addr" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4" rowspan="2">&nbsp;</td>
                    <td class="auto-style10" colspan="2">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="insert" CssClass="btn" runat="server" Text="Create User" Height="50px" Width="394px" OnClick="insert_Click" />
                    </td>
                    <td rowspan="2">&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style6" colspan="2">&nbsp;</td>
                </tr>
                </table>
        </div>
    </form>
</body>
</html>
