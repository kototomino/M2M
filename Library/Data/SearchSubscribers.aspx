<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchSubscribers.aspx.cs" Inherits="Library.SearchSubscribers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Search Books</title>
	<h1>Search Subscribers</h1>

<style>
	input {
		font-size:30px;
		font-family:Calibri;
		width: 377px;
	}
	
	body {
			background: linear-gradient(1150deg,#191515,#332c2c);
		}
		
		h1 {
			
			font-family:Calibri;
			font-style:italic;
			
			text-align:center;
			color:white;
			
			
		}
		
		gvBook {
			padding-top:40px;
		}
		nav ul li a {
			font-family:Calibri;
			font-style:italic;
			color:white;
			font-size:20px;
			text-transform: uppercase;

		}
</style>
</head>
<body>
	<nav>
		<ul>
			<li><a href ="Management.aspx" id="backToHome" >Home</a></li>
			
		</ul>
		</nav>
	<center>
	<form id="form1" runat="server"> 
		
		<asp:TextBox  id="txtSearcher" type="text" placeholder="Find a subscriber" runat="server"></asp:TextBox>
		<asp:Button ID="SearchButton" runat="server" Text="Search" Width="90px" OnClick="SearchButton_Click" />
		<div>
			
	<div>

	</div>


		</div>
             <asp:GridView ID="gvBook" runat="server"	AutoGenerateColumns ="false" ShowFooter="true" DataKeyNames="Id"
				BackColor="White" BorderColor="White" Font-Size="30px" Height="500px" 
				BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" Width="500px">
				
				<FooterStyle BackColor="#C6C3C6" ForeColor="Black" />
				<HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
				<PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
				<RowStyle BackColor="#DEDFDE" ForeColor="Black" />
				<SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
				<SortedAscendingCellStyle BackColor="#F1F1F1" />
				<SortedAscendingHeaderStyle BackColor="#594B9C" />
				<SortedDescendingCellStyle BackColor="#CAC9C9" />
				<SortedDescendingHeaderStyle BackColor="#33276A" />

				<Columns>
					<asp:TemplateField HeaderText="Name">
					<ItemTemplate>
						<asp:Label Text ='<%#Eval("name") %>' runat ="server" Font-Size="30px"></asp:Label>
					</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ID="txtName" Text='<%#Eval("name") %>' runat="server" Font-Size="30px" ></asp:TextBox>
						</EditItemTemplate>
						
						</asp:TemplateField>

					<asp:TemplateField HeaderText="Contact">
					<ItemTemplate>
						<asp:Label Text ='<%#Eval("contact") %>' runat ="server" Font-Size="30px" ></asp:Label>
					</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ID="txtContact" Text='<%#Eval("contact") %>' runat="server" Font-Size="30px" ></asp:TextBox>
						</EditItemTemplate>
						
						</asp:TemplateField>

					<asp:TemplateField HeaderText="Title Of Book">
					<ItemTemplate>
						<asp:Label Text ='<%#Eval("borrowed_books_titles") %>' runat ="server" Font-Size="30px" ></asp:Label>
					</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ID="txtBorrowed_books_titles" Text='<%#Eval("borrowed_books_titles") %>' runat="server" Font-Size="30px" ></asp:TextBox>
						</EditItemTemplate>
						
						</asp:TemplateField>
				
					
				</Columns>
			</asp:GridView>
		 </form>>
		</center>
        
   
</body>
</html>
