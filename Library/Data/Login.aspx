<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Library.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login to Library</title>
    
</head>
    <center>
<body>
    <style>
    body {
        
 background: linear-gradient(1150deg,#191515,#332c2c);
           
             
        }
    
    
        
        </style>
    <form id="form1" runat="server">
        <div>
            <center>
                
            <table  style ="margin:auto;border:5px groove silver" > 
                
                <tr>
                    <td>
                        <asp:Label ID="UserName" runat="server" Text="Username" ForeColor="White"  Font-Size="30px" Height="30px" Width="200px"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server" Height="30px" Width="500px" Font-Size="30px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Password" runat="server" Text="Password"  ForeColor="White" Font-Size="30px" Height="30px" Width="200px"></asp:Label></td>
                    <td>
                        <asp:TextBox ID="txtPass" TextMode="Password" runat="server" Height="30px" Width="500px" Font-Size="30px" ></asp:TextBox></td>
                </tr>
                <tr>
                    <td>
                        </td>
                    <td>
                        
                        <asp:Button ID="loginButton" runat="server" Text="Login" OnClick="loginButton_Click" Height="50px" Width="505px" Font-Size="30px" /> </td>     
                    
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Label ID="errorMess" runat="server" Text="Bad Password or Username" ForeColor="Red"  Font-Size="30px"></asp:Label>

                    </td>
                </tr>
                
            </table>
                </center>
        </div>
    </form>
</body>
    </center>
</html>
