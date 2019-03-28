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

public partial class 注册用户_写游记 : System.Web.UI.Page
{
    TableRow row = new TableRow();
    protected int TotalControls
    {
        get
        {
            return ViewState["TotControls"] == null ? 0 : (int)(ViewState["TotControls"]);
        }
        set
        {
            ViewState["TotControls"] = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUrl_Yes = "../游客/登录.aspx";
        if (Session["用户名"] == null)
            Response.Write("<Script Language='JavaScript'> window.alert('请先登录');window.location.href='" + strUrl_Yes +
        "' ;</script>");
        else
        {
            for (int i = 1; i <= TotalControls; i++)
            {

                TableCell cell = new TableCell();
                TextBox tb = new TextBox();
                tb.ID = "TB" + i.ToString();
                cell.Controls.Add(tb);
                row.Cells.Add(cell);

            }
            Table1.Rows.Add(row);
        }
      
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //插入游记表
        string strConn = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand cmd = conn.CreateCommand();
        cmd.CommandText = "insert into 游记(题目,发表时间,人均花费,出行时间,出行人数,出行方式,正文,发布者) values(@title,@utime,@cost,'"+ TextBox3.Text + "',@num,@type,@article,@author)";
        cmd.Parameters.Add("@title", SqlDbType.VarChar, 100);
        cmd.Parameters["@title"].Value = TextBox1.Text;
        cmd.Parameters.Add("@utime", SqlDbType.Date, 8);
        cmd.Parameters["@utime"].Value = System.DateTime.Now;
        cmd.Parameters.Add("@cost", SqlDbType.Int, 4);
        cmd.Parameters["@cost"].Value = int.Parse(TextBox2.Text);
        cmd.Parameters.Add("@num", SqlDbType.Int, 4);
        cmd.Parameters["@num"].Value = int.Parse(TextBox4.Text);
        cmd.Parameters.Add("@type", SqlDbType.SmallInt, 2);
        if(this.RadioButtonList1.SelectedValue == "一个人")
        cmd.Parameters["@type"].Value = 0;
        else if (this.RadioButtonList1.SelectedValue == "和朋友")
            cmd.Parameters["@type"].Value = 1;
        else cmd.Parameters["@type"].Value = 2;
        cmd.Parameters.Add("@article", SqlDbType.VarChar, 7000);
        cmd.Parameters["@article"].Value = TextBox5.Text;
        cmd.Parameters.Add("@author", SqlDbType.Int, 4);
        cmd.Parameters["@author"].Value = int.Parse(Session["用户编号"].ToString());
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        string str1 = "select max(游记编号) from 游记";
        SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString);
        conn1.Open();
        SqlCommand cmd1 = new SqlCommand(str1, conn1);
        int r = (int)cmd1.ExecuteScalar();//当前游记编号
        conn1.Close();

        //插入游记目的地表
        for (int i = 1; i <= TotalControls; i++)
        {
            //插入路线目的地表
            string str = string.Empty;
            string strConn2 = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
            SqlConnection conn2 = new SqlConnection(strConn2);
            SqlCommand cmd2 = conn2.CreateCommand();
            cmd2.CommandText = "insert into 游记目的地(目的地编号,游记编号) values(@did,@aid)";
            cmd2.Parameters.Add("@aid", SqlDbType.Int, 4);
            cmd2.Parameters["@aid"].Value = r;
            cmd2.Parameters.Add("@did", SqlDbType.Int, 4);
            str = ((TextBox)this.FindControl("TB" + i.ToString())).Text;

            int num = 0;
            string strConn3 = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
            SqlConnection conn3 = new SqlConnection(strConn3);
            SqlCommand cmd3 = conn3.CreateCommand();
            cmd3.CommandText = "select * from 目的地 where 名称='" + str + "'";
            try
            {
                conn3.Open();
                SqlDataReader sdr = cmd3.ExecuteReader();
                sdr.Read();
                num = sdr.GetInt32(sdr.GetOrdinal("目的地编号"));
            }
            catch (System.Exception ee)
            {
                Response.Write(ee.Message.ToString());
            }
            finally
            {
                conn3.Close();
            }

            cmd2.Parameters["@did"].Value = num;
            conn2.Open();
            cmd2.ExecuteNonQuery();
            conn2.Close();
        }

        Response.Redirect("我的.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        TotalControls = TotalControls + 1;
        TableCell cell = new TableCell();
        TextBox tb = new TextBox();
        tb.ID = "TB" + TotalControls.ToString();
        cell.Controls.Add(tb);
        row.Cells.Add(cell);
        Table1.Rows.Add(row);
    }
}