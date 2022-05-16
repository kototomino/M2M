using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Library.Data
{
	public partial class IssueBooks : System.Web.UI.Page
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
				SqlDataAdapter adapter = new SqlDataAdapter("SELECT * FROM Subscriber ", sqlConnection);
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
						int result = 0;
						sqlConnection.Open();
						TextBox textBox = (TextBox)gvBook.FooterRow.FindControl("txtBorrowed_books_titlesFooter");
						TextBox textBoxName = (TextBox)gvBook.FooterRow.FindControl("txtNameFooter");
						TextBox textBoxContact = (TextBox)gvBook.FooterRow.FindControl("txtContactFooter");
						string valueName = textBoxName.Text;
						string value = textBox.Text;
						string valueContact = textBoxContact.Text;
						string queryHelp = "SELECT * FROM Subscriber where borrowed_books_titles='" + value + "' and name='" + valueName
							+"' and contact='"+valueContact + "'";
						SqlCommand command = new SqlCommand(queryHelp, sqlConnection);

						try
						{
							result = (int)(command.ExecuteScalar());
						}
						catch (Exception ex)
						{

							msgError.Text = ex.Message;
						}
						
						
						if (result > 0)
						{
							msgError.Text = "CANNOT BE ISSUED";
						}
						else
						{
							int quant = 0;
							

							string queryUpdate = "UPDATE Book set available=available-1 where bookName='" + value + "'";
							string queryCheck = "SELECT * FROM Book WHERE bookName='" + value + "'";
							SqlCommand sqlCommandCheck = new SqlCommand(queryCheck, sqlConnection);
							sqlCommandCheck.ExecuteNonQuery();
							DataTable dataTable = new DataTable();
							SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommandCheck);
							sqlDataAdapter.Fill(dataTable);
							foreach (DataRow row in dataTable.Rows)
							{
								quant = Convert.ToInt32(row["available"].ToString());
							}

							if (quant > 0)
							{

								string query = "INSERT INTO Subscriber (name,contact,borrowed_books_titles)" +
									" VALUES (@name,@contact,@borrowed_books_titles)";
								SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
								sqlCommand.Parameters.AddWithValue("@name", (gvBook.FooterRow.FindControl("txtNameFooter") as TextBox).Text.Trim());
								sqlCommand.Parameters.AddWithValue("@contact", (gvBook.FooterRow.FindControl("txtContactFooter") as TextBox).Text.Trim());
								sqlCommand.Parameters.AddWithValue("@borrowed_books_titles", (gvBook.FooterRow.FindControl("txtBorrowed_books_titlesFooter") as TextBox).Text.Trim());
								sqlCommand.ExecuteNonQuery();




								SqlCommand sqlCommandUpdate = new SqlCommand(queryUpdate, sqlConnection);

								sqlCommandUpdate.ExecuteNonQuery();
								LoadData();

								msgSuccess.Text = "Book was issued";

								msgError.Text = "";

							}
							else
							{
								msgError.Text = "Book cannot be issued quantity of available is 0 or book was not found";
								msgSuccess.Text = "";
							}

						}
					}
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
					string value = "";
					

					foreach (GridViewRow row in gvBook.Rows)
					{
						Label title = row.FindControl("idTitleOfBook") as Label;
						value = title.Text;
						
					}

					string queryReturn = "UPDATE Book set available=available+1 where bookName='" + value + "'";

					SqlCommand sqlCommandCheck = new SqlCommand(queryReturn, sqlConnection);


					sqlCommandCheck.ExecuteNonQuery();

					string query = "DELETE FROM  Subscriber WHERE Id=@Id";
					SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
					sqlCommand.Parameters.AddWithValue("@Id", Convert.ToInt32(gvBook.DataKeys[e.RowIndex].Value.ToString()));
					sqlCommand.ExecuteNonQuery();


					msgSuccess.Text = "Subscriber returned a book";

					msgError.Text = "";
					LoadData();
				}


			}
			catch (Exception ex)
			{

				msgError.Text = ex.Message;
			}
		}
	}
}