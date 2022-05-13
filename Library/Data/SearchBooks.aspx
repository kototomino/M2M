<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchBooks.aspx.cs" Inherits="Library.SearchBooks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server"> 
	
    <title>Search Books</title>
	<h1>Search Books</h1>

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
<body >
	<nav>
		<ul>
			<li><a href ="Management.aspx" id="backToHome" >Home</a></li>
			
		</ul>
		</nav>
	<center>
	<form id="form1" runat="server">
		
		<asp:TextBox  id="txtSearcher" type="text" placeholder="Find a book" runat="server"></asp:TextBox>
		<asp:Button ID="SearchButton" runat="server" Text="Search" Width="90px" OnClick="SearchButton_Click" />
		<div>
			
	<div>

	</div>


		</div>
             <asp:GridView ID="gvBook" runat="server" 
				 ShowFooter="true" DataKeyNames="Id"
				 AutoGenerateColumns ="false"
				 
				BackColor="White" BorderColor="White" Font-Size="30px" Height="500px" 
				BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" Width="1500px" style="margin-top: 0px" >
				
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
					<asp:TemplateField HeaderText="ID">
					<ItemTemplate>
						<asp:Label Text ='<%#Eval("Id") %>' runat ="server" Font-Size="30px"></asp:Label>
					</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ID="txtId" Text='<%#Eval("Id") %>' runat="server" Font-Size="30px" ></asp:TextBox>
						</EditItemTemplate>
						
						</asp:TemplateField>

					<asp:TemplateField HeaderText="Book name">
					<ItemTemplate>
						<asp:Label Text ='<%#Eval("bookName") %>' runat ="server" Font-Size="30px" ></asp:Label>
					</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ID="txtBookName" Text='<%#Eval("bookName") %>' runat="server" Font-Size="30px" ></asp:TextBox>
						</EditItemTemplate>
						
						</asp:TemplateField>

					<asp:TemplateField HeaderText="Autor">
					<ItemTemplate>
						<asp:Label Text ='<%#Eval("autorName") %>' runat ="server" Font-Size="30px" ></asp:Label>
					</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ID="txtAutorName" Text='<%#Eval("autorName") %>' runat="server" Font-Size="30px" ></asp:TextBox>
						</EditItemTemplate>
						
						</asp:TemplateField>

					<asp:TemplateField HeaderText="Quantity">
					<ItemTemplate>
						<asp:Label Text ='<%#Eval("quantity") %>' runat ="server" Font-Size="30px" ></asp:Label>
					</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ID="txtQuantity" Text='<%#Eval("quantity") %>' runat="server" Font-Size="30px" ></asp:TextBox>
						</EditItemTemplate>
						
						</asp:TemplateField>

					<asp:TemplateField HeaderText="Subscriber">
					<ItemTemplate>
						<asp:Label Text ='<%#Eval("subscriber") %>' runat ="server" Font-Size="30px" ></asp:Label>
					</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ID="txtSubscriber" Text='<%#Eval("subscriber") %>' runat="server" Font-Size="30px" ></asp:TextBox>
						</EditItemTemplate>
						</asp:TemplateField>
				</Columns>
			</asp:GridView>
		</form>
		</center>
        
    
</body>
</html>
