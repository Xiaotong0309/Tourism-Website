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

public partial class 写评价 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void ok(object sender, EventArgs e)
    {
        //更新线路评价表
        string name = Session["用户编号"].ToString();
        string route = DetailsView1.Rows[0].Cells[1].Text;
        string strConn1 = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
        SqlConnection conn2 = new SqlConnection(strConn1);
        SqlCommand cmd2 = conn2.CreateCommand();
        cmd2.CommandText = "insert into 线路评价(用户编号,线路编号,评分,内容) values(@name,@route,@score,@content)";
        cmd2.Parameters.Add("@name", SqlDbType.Int, 4);
        cmd2.Parameters["@name"].Value = int.Parse(name);
        cmd2.Parameters.Add("@route", SqlDbType.Int, 4);
        cmd2.Parameters["@route"].Value = int.Parse(route);
        cmd2.Parameters.Add("@score", SqlDbType.SmallInt, 2);
        cmd2.Parameters["@score"].Value = int.Parse(TextBox2.Text);
        cmd2.Parameters.Add("@content", SqlDbType.VarChar, 7000);
        cmd2.Parameters["@content"].Value = TextBox1.Text;
        conn2.Open();
        cmd2.ExecuteNonQuery();
        conn2.Close();
        Response.Redirect("待评价.aspx");
        
    }
}