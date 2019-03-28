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

public partial class 管理员网站_线路管理 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("添加线路.aspx");
    }


    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string nid = GridView1.Rows[e.RowIndex].Cells[0].Text.ToString();
        string aid = GridView1.Rows[e.RowIndex].Cells[7].Text.ToString();
        string strConn = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand cmd = conn.CreateCommand();
        cmd.CommandText = "delete 出行时间 where 线路编号 = " + nid +"and 出发日期 = '"+aid+"'";
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("管理.aspx");
    }
}