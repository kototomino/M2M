<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="IssueBooks.aspx.cs" Inherits="Library.Data.IssueBooks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ISSUE A BOOK</title>
	<h1>ISSUE A BOOK</h1>
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
			float:right;
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
		<nav>
		<ul>
			<li><a href= "Management.aspx" id="homeFromIssue">HOME</a></li>
		
		</ul>
</nav>
		<div>
		
		
        </div>
			<center>
            <asp:GridView ID="gvBook" runat="server" OnRowCommand="gvBook_RowCommand"
				OnRowDeleting="gvBook_RowDeleting"	AutoGenerateColumns ="false" ShowFooter="true" DataKeyNames="Id"
				BackColor="White" BorderColor="White" Font-Size="30px" Height="500px" 
				BorderStyle="Ridge" BorderWidth="2px" CellPadding="3" CellSpacing="1" GridLines="None" Width="500px" >
				
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
						<FooterTemplate>
							<asp:TextBox ID="txtNameFooter" runat="server" Font-Size="30px" ></asp:TextBox>
						</FooterTemplate>
						</asp:TemplateField>

					<asp:TemplateField HeaderText="Contact">
					<ItemTemplate>
						<asp:Label  Text ='<%#Eval("contact") %>' runat ="server" Font-Size="30px" ></asp:Label>
					</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox ID="txtContact" Text='<%#Eval("contact") %>' runat="server" Font-Size="30px" ></asp:TextBox>
						</EditItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtContactFooter" runat="server" Font-Size="30px" ></asp:TextBox>
						</FooterTemplate>
						</asp:TemplateField>

					<asp:TemplateField HeaderText="Title Of Book">
					<ItemTemplate>
						<asp:Label ID="idTitleOfBook" Text ='<%#Eval("borrowed_books_titles") %>' runat ="server" Font-Size="30px" ></asp:Label>
					</ItemTemplate>
						<EditItemTemplate>
							<asp:TextBox id="txtBorrowed_books_titles" Text='<%#Eval("borrowed_books_titles") %>' runat="server" Font-Size="30px" ></asp:TextBox>
						</EditItemTemplate>
						<FooterTemplate>
							<asp:TextBox ID="txtBorrowed_books_titlesFooter" runat="server" Font-Size="30px" ></asp:TextBox>
						</FooterTemplate>
						</asp:TemplateField>
				
					<asp:TemplateField>
						<ItemTemplate>
							
							<asp:ImageButton ImageUrl="~/images/delete.png" runat="server"
								CommandName="Delete" ToolTip="Delete" Width="20px" Height="20px" />
								
						</ItemTemplate>
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