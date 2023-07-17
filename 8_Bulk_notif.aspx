<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="8_Bulk_notif.aspx.cs" Inherits="WebApplication5._8_Bulk_notif_add" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 481px;
        }
        .auto-style3 {
            width: 481px;
            height: 26px;
        }
        .auto-style4 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">Insert Bulk Message To Be Sent</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:TextBox ID="msg" runat="server" Width="319px"></asp:TextBox>
                </td>
                <td class="auto-style4"></td>
                <td class="auto-style4"></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Button ID="SendBtn" runat="server" OnClick="SendBtn_Click" style="height: 29px" Text="Send" Width="194px" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div>
        </div>
    </form>
</body>
</html>
