<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Management.aspx.cs" Inherits="Library.Management" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Library management</title>
	
	
	
	&nbsp;<style>
		body {
			background: linear-gradient(1150deg,#191515,#332c2c);
		}

	      	h1 {
	      		font-family: Calibri;
	      		font-style: italic;
	      		padding-left: 150px;
	      		text-align: left;
	      		color: white;
	      	}

		nav ul {
			
			margin-right: 150px
		}
		nav ul li {
			display: inline-block;
			line-height: 80px;
			margin: 0 5px;
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
	
	<body> <form id="form1" runat="server">
		<h1>Welcome to the Library</h1> 
		<center>
		<nav>
		<ul>
			<li><a href= "IssueBooks.aspx" id="IssueBooks">Issue or return a book</a></li>
			<li><a href= "SearchSubscribers.aspx" id="SearchSubscribers">Search Subscribers</a></li>
			<li><a href= "SearchBooks.aspx " id="SearchBooks">Search Books</a></li>
			<li><a href= "Login.aspx" id="LogOut">Log Out</a></li>
			<li><asp:TextBox  id="txtSearcherID" type="text" placeholder="Find a book by ID" runat="server"  ></asp:TextBox></li>
			<li><asp:Button ID="SearchButtonID" runat="server" Text="Search" Width="90px" OnClick="SearchButtonID_Click"   /></li>
		</ul>
</nav>
			</center>
		<div>
		
		
        </div>
			<center>
            <asp:GridView ID="gvBook" runat="server" OnRowCommand="gvBook_RowCommand" OnRowEditing="gvBook_RowEditing"
				OnRowCancelingEdit="gvBook_RowCancelingEdit" OnRowUpdating="gvBook_RowUpdating" OnRowDeleting="gvBook_RowDeleting"	AutoGenerateColumns ="false" ShowFooter="true" DataKeyNames="Id"
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
					<asp:TemplateField HeaderText="ID">
					<ItemTemplate>
						<asp:Label Text ='<%#Eval("Id") %>' runat ="server" Font-Size="30px"></asp:Label>
					</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ID="txtId" Text='<%#Eval("Id") %>' runat="server" Font-Size="30px" ></asp:TextBox>
						</EditItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtIdFooter" runat="server" Font-Size="30px" ></asp:TextBox>
						</FooterTemplate>
						</asp:TemplateField>

					<asp:TemplateField HeaderText="Book name">
					<ItemTemplate>
						<asp:Label Text ='<%#Eval("bookName") %>' runat ="server" Font-Size="30px" ></asp:Label>
					</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ID="txtBookName" Text='<%#Eval("bookName") %>' runat="server" Font-Size="30px" ></asp:TextBox>
						</EditItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtBookNameFooter" runat="server" Font-Size="30px" ></asp:TextBox>
						</FooterTemplate>
						</asp:TemplateField>

					<asp:TemplateField HeaderText="Autor">
					<ItemTemplate>
						<asp:Label Text ='<%#Eval("autorName") %>' runat ="server" Font-Size="30px" ></asp:Label>
					</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ID="txtAutorName" Text='<%#Eval("autorName") %>' runat="server" Font-Size="30px" ></asp:TextBox>
						</EditItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtAutorNameFooter" runat="server" Font-Size="30px" ></asp:TextBox>
						</FooterTemplate>
						</asp:TemplateField>

					<asp:TemplateField HeaderText="Quantity">
					<ItemTemplate>
						<asp:Label Text ='<%#Eval("quantity") %>' runat ="server" Font-Size="30px" ></asp:Label>
					</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ID="txtQuantity" Text='<%#Eval("quantity") %>' runat="server" Font-Size="30px" ></asp:TextBox>
						</EditItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtQuantityFooter" runat="server" Font-Size="30px" ></asp:TextBox>
						</FooterTemplate>
						</asp:TemplateField>
					<asp:TemplateField>
						<ItemTemplate>
							<asp:ImageButton ImageUrl="~/images/editing.png" runat="server"
								CommandName="Edit" ToolTip="Edit" Width="20px" Height="20px" />

							<asp:ImageButton ImageUrl="~/images/delete.png" runat="server"
								CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
								
						</ItemTemplate>

						<EditItemTemplate>
							<asp:ImageButton ImageUrl="~/images/floppy-disk.png" runat="server"
								CommandName="Update" ToolTip="Update" Width="20px" Height="20px" />

							<asp:ImageButton ImageUrl="~/images/cancel.png" runat="server"
								CommandName="Cancel" ToolTip="Cancel" Width="20px" Height="20px" />

						</EditItemTemplate>

						<FooterTemplate>
							<asp:ImageButton ImageUrl="~/images/add.png" runat="server"
								CommandName="AddNew" ToolTip="Add New" Width="20px" Height="20px" />

						</FooterTemplate>

					</asp:TemplateField>
				</Columns>
			</asp:GridView>
				</center>
			<center>
			<br />
					
			<asp:Label ID="msgSuccess" runat="server" ForeColor="Green" Font-Size="30px" ></asp:Label>
			<br />
			<asp:Label ID="msgError" runat="server" ForeColor="Red" Font-Size="30px" ></asp:Label>
				</center>
			 </form>
        
</body>

</html>
