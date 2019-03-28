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

public partial class 管理员网站_游记管理详细 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //删除游记记录
        string strConn1 = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
        SqlConnection conn2 = new SqlConnection(strConn1);
        SqlCommand cmd2 = conn2.CreateCommand();
        SqlCommand cmd1 = conn2.CreateCommand();
        SqlCommand cmd0 = conn2.CreateCommand();
        cmd2.CommandText = "DELETE FROM 游记 WHERE 游记编号=" + DetailsView1.Rows[0].Cells[1].Text ;
        cmd1.CommandText = "DELETE FROM 游记收藏 WHERE 游记编号=" + DetailsView1.Rows[0].Cells[1].Text ;
        cmd0.CommandText = "DELETE FROM 游记目的地 WHERE 游记编号=" + DetailsView1.Rows[0].Cells[1].Text ;

        conn2.Open();
        cmd0.ExecuteNonQuery();
        cmd1.ExecuteNonQuery();
        cmd2.ExecuteNonQuery();
        conn2.Close();
        Response.Redirect("游记管理.aspx");
    }
}