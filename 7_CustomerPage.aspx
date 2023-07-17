<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="7_CustomerPage.aspx.cs" Inherits="WebApplication5._7_CustomerPage" %>

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
            border-radius :10px;
            background: #FFE79B;
            height:100%;
            box-shadow: 0px 0px 10px 10px #16FF00;
            padding:10px;
        }
        .set_to_left
        {
            display:flex;
            margin-right: auto;
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
        }

        .center-align 
        {
        text-align: center;
        margin: 20px auto;
    }
        .auto-style2 {
            text-align: center;
        }
        .auto-style3 {
            height: 33px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id ="flexContainer">
           <div class = "flex-items">
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <span>  <asp:Label ID="Label2" runat="server"></asp:Label>  </span> 
                <span>  <asp:Label ID="Label3" runat="server"></asp:Label>  </span> 
                <span>  <asp:Label ID="Label4" runat="server"></asp:Label>  </span> 
            </div>
            <div class = "flex-items">
                <asp:Label ID="Label5" runat="server"></asp:Label>
                <span> <asp:Label ID="Label6" runat="server"></asp:Label> <asp:TextBox ID="newPass" runat="server" TextMode="Password" Visible="False"></asp:TextBox></span>

                <span><asp:Label ID="Label7" runat="server"></asp:Label> <asp:TextBox ID="newPh" runat="server" Visible="False"></asp:TextBox> </span>
                <span><asp:Button ID="UpdateButton" runat="server" Text="Update" OnClick="Update_Click" Visible="False" class="btn"/></span>
            </div>
        </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">
                    Your Notifications</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" CssClass="center-align">
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <div id ="set_to_left">
                        <asp:Button class="btn" ID="logOutBtn" runat="server" OnClick="logOutBtn_Click" Text="LogOut" />
                    </div>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

