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
	
	public partial class Login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			
			errorMess.Visible = false;
		}

		protected void loginButton_Click(object sender, EventArgs e)
		{
			using (SqlConnection sqlConnection = new SqlConnection("Data Source=(LocalDB)\\" +
				"MSSQLLocalDB;AttachDbFilename=C:\\Users\\Anonym\\Desktop\\M2M\\" +
				"Library\\App_Data\\Database1.mdf;Integrated Security=True"))
			{
				sqlConnection.Open();
				string query = "SELECT COUNT(1) FROM Admin WHERE " +
					"username=@username AND password=@password";
				SqlCommand sqlCommand = new SqlCommand(query, sqlConnection);
				sqlCommand.Parameters.AddWithValue("@username", txtName.Text.Trim());
				sqlCommand.Parameters.AddWithValue("@password", txtPass.Text.Trim());
				int count = Convert.ToInt32(sqlCommand.ExecuteScalar());
				if (count == 1)
				{
					Session["username"] = txtName.Text.Trim();
					Response.Redirect("Management.aspx");
				}
				else { errorMess.Visible = true; }
			}
		}
	}
}