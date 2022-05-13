using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Threading;

namespace Library
{
	public partial class Management : System.Web.UI.Page
	{
		string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=" +
			"C:\\Users\\Anonym\\Desktop\\M2M\\Library\\App_Data\\Database1.mdf;Integrated Security=True";
		
		protected void Page_Load(object sender, EventArgs e)
		{
			
			if (!IsPostBack)
			{
				LoadData();
			}
		}


		private void LoadData()
		{
			DataTable dataTable = new DataTable();
			using (SqlConnection sqlConnection = new SqlConnection(connectionString))
			{
				sqlConnection.Open();
				SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM Book ", sqlConnection);
				adapter.Fill(dataTable);
				
				
			}
			if (dataTable.Rows.Count > 0)
			{
				gvBook.DataSource = dataTable;
				gvBook.DataBind();
			}
			else
			{
				dataTable.Rows.Add(dataTable.NewRow());
				gvBook.DataSource = dataTable;
				gvBook.DataBind();
				gvBook.Rows[0].Cells.Clear();
				gvBook.Rows[0].Cells.Add(new TableCell());
				gvBook.Rows[0].Cells[0].ColumnSpan = dataTable.Columns.Count;
				gvBook.Rows[0].Cells[0].Text = " NO DATA IN DATABASE";
				gvBook.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
			}
			
		}

		protected void gvBook_RowCommand(object sender, GridViewCommandEventArgs e)
		{
			try
			{
				
				if (e.CommandName.Equals("AddNew"))
				{
					using (SqlConnection sqlConnection = new SqlConnection(connectionString))
					{
						sqlConnection.Open();
						string query = "INSERT INTO Book (Id,bookName,autorName,quantity,subscriber)" +
							" VALUES (@Id,@bookName,@autorName,@quantity,@subscriber)";
						SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
						sqlCommand.Parameters.AddWithValue("@Id", (gvBook.FooterRow.FindControl("txtIdFooter") as TextBox).Text.Trim());
						sqlCommand.Parameters.AddWithValue("@bookName", (gvBook.FooterRow.FindControl("txtBookNameFooter") as TextBox).Text.Trim());
						sqlCommand.Parameters.AddWithValue("@autorName", (gvBook.FooterRow.FindControl("txtAutorNameFooter") as TextBox).Text.Trim());
						sqlCommand.Parameters.AddWithValue("@quantity", (gvBook.FooterRow.FindControl("txtQuantityFooter") as TextBox).Text.Trim());
						sqlCommand.Parameters.AddWithValue("@subscriber", (gvBook.FooterRow.FindControl("txtSubscriberFooter") as TextBox).Text.Trim());
						sqlCommand.ExecuteNonQuery();
						LoadData();
						
						msgSuccess.Text = "Book was added to database";
						
						msgError.Text = "";
						
					}

				}
			}
			catch (Exception ex)
			{

				msgError.Text = ex.Message;
			}
		}

		protected void gvBook_RowEditing(object sender, GridViewEditEventArgs e)
		{
			gvBook.EditIndex = e.NewEditIndex;
			LoadData();
		}

		protected void gvBook_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
		{
			gvBook.EditIndex = -1;
			LoadData();
		}

		protected void gvBook_RowUpdating(object sender, GridViewUpdateEventArgs e)
		{
			try
			{

				using (SqlConnection sqlConnection = new SqlConnection(connectionString))
				{
					sqlConnection.Open();
					string query = "UPDATE  Book SET bookName=@bookName,autorName=@autorName,quantity=@quantity,subscriber=@subscriber" +
						" WHERE Id=@Id";
					SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
					sqlCommand.Parameters.AddWithValue("@bookName", (gvBook.Rows[e.RowIndex].FindControl("txtBookName") as TextBox).Text.Trim());
					sqlCommand.Parameters.AddWithValue("@autorName", (gvBook.Rows[e.RowIndex].FindControl("txtAutorName") as TextBox).Text.Trim());
					sqlCommand.Parameters.AddWithValue("@quantity", (gvBook.Rows[e.RowIndex].FindControl("txtQuantity") as TextBox).Text.Trim());
					sqlCommand.Parameters.AddWithValue("@subscriber", (gvBook.Rows[e.RowIndex].FindControl("txtSubscriber") as TextBox).Text.Trim());
					sqlCommand.Parameters.AddWithValue("@Id", Convert.ToInt32(gvBook.DataKeys[e.RowIndex].Value.ToString()));
					sqlCommand.ExecuteNonQuery();
					gvBook.EditIndex = -1;
					LoadData();
					msgSuccess.Text = "Book was updated";
					msgError.Text = "";
				}


			}
			catch (Exception ex)
			{

				msgError.Text = ex.Message;
			}
		}

		protected void gvBook_RowDeleting(object sender, GridViewDeleteEventArgs e)
		{
			try
			{
				
				
				using (SqlConnection sqlConnection = new SqlConnection(connectionString))
				{
					sqlConnection.Open();
					string query = "DELETE FROM  Book WHERE Id=@Id";
					SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
					sqlCommand.Parameters.AddWithValue("@Id", Convert.ToInt32(gvBook.DataKeys[e.RowIndex].Value.ToString()));
					sqlCommand.ExecuteNonQuery();
					LoadData(); 
					
					msgSuccess.Text = "Book was deleted";
					
					msgError.Text = "";
					
				}


			}
			catch (Exception ex)
			{

				msgError.Text = ex.Message;
			}
		}

		
	}
}