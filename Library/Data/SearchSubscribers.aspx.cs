using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Library
{
	public partial class SearchSubscribers : System.Web.UI.Page
	{
		string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=" +
			"C:\\Users\\Anonym\\Desktop\\M2M\\Library\\App_Data\\Database1.mdf;Integrated Security=True";
		protected void Page_Load(object sender, EventArgs e)
		{
		
		}

		protected void SearchButton_Click(object sender, EventArgs e)
		{
			using (SqlConnection sqlConnection = new SqlConnection(connectionString))
			{

				string query = "SELECT * FROM Book WHERE subscriber LIKE '%" + txtSearcher.Text + "%'";
				sqlConnection.Open();
				SqlDataAdapter adapter = new SqlDataAdapter(query, sqlConnection);
				SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);


				DataTable dataTable = new DataTable();
				adapter.Fill(dataTable);
				gvBook.DataSource = dataTable;
				gvBook.DataBind();
			}
		}
	}
}
