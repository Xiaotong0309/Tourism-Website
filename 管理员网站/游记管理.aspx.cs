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

public partial class 游记管理 : System.Web.UI.Page
{
    
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }






    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string nid = GridView1.Rows[e.RowIndex].Cells[0].Text.ToString();
        string strConn1 = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
        SqlConnection conn2 = new SqlConnection(strConn1);
        SqlCommand cmd2 = conn2.CreateCommand();
        SqlCommand cmd1 = conn2.CreateCommand();
        SqlCommand cmd0 = conn2.CreateCommand();
        
        cmd2.CommandText = "DELETE FROM 游记 WHERE 游记编号="+nid;
        cmd1.CommandText = "DELETE FROM 游记收藏 WHERE 游记编号=" + nid;
        cmd0.CommandText = "DELETE FROM 游记目的地 WHERE 游记编号=" + nid;

        conn2.Open();
        cmd0.ExecuteNonQuery();
        cmd1.ExecuteNonQuery();
        cmd2.ExecuteNonQuery();
        conn2.Close();
    }



    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("管理.aspx");
    }


}