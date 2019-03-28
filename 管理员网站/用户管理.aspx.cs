using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.IO;

public partial class 管理员网站_用户管理 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string str = "select count(*) from 用户";
        SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString);
        conn1.Open();
        SqlCommand cmd1 = new SqlCommand(str, conn1);
        int r = (int)cmd1.ExecuteScalar();
        Label2.Text = r.ToString();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("管理.aspx");
    }
}