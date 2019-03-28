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
public partial class 游记 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["用户名"] != null) {  Panel1.Visible = false;  }//已登录则显示登录名
        else { Panel1.Visible = true; }
    

    //该游记浏览次数加一，更新数据库
        string strConn = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand cmd = conn.CreateCommand();
        cmd.CommandText = "update 游记 set 浏览次数 = 浏览次数 + 1 where 游记编号='" + DetailsView1.Rows[0].Cells[1].Text + "'";
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        //用户若收藏过此文章，背景色变深，文字色变浅
        if (Session["用户名"] != null)
        {
            if (DetailsView1.Rows[10].Cells[1].Text == Session["用户名"].ToString())
                Panel3.Visible = false;
            string name = Session["用户编号"].ToString();
            string str = "select count(*) from 游记收藏 where 用户编号=" + name + " and 游记编号=" + DetailsView1.Rows[0].Cells[1].Text.ToString();
            SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString);
            conn1.Open();
            SqlCommand cmd1 = new SqlCommand(str, conn1);
            int r = (int)cmd1.ExecuteScalar();
            if (r > 0)
            {
                Button1.ForeColor= System.Drawing.Color.White;
                Button1.BackColor = System.Drawing.Color.Goldenrod;

            }

            conn1.Close();

            int tip = 0;

            string strConn3 = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
            SqlConnection conn3 = new SqlConnection(strConn3);
            SqlCommand cmd3 = conn3.CreateCommand();
            cmd3.CommandText = "select 用户编号 from 用户 where 用户名='" + DetailsView1.Rows[10].Cells[1].Text + "'";
            try
            {
                conn3.Open();
                SqlDataReader sdr = cmd3.ExecuteReader();
                sdr.Read();
                tip = sdr.GetInt32(sdr.GetOrdinal("用户编号"));
            }
            catch (System.Exception ee)
            {
                Response.Write(ee.Message.ToString());
            }
            finally
            {
                conn3.Close();
            }
            string str1 = "select count(*) from 关注 where 关注者编号=" + name + " and 被关注者编号=" + tip.ToString();
            SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString);
            conn2.Open();
            SqlCommand cmd2 = new SqlCommand(str1, conn2);
            int r2 = (int)cmd2.ExecuteScalar();
            if (r2 > 0)
            {
                Button2.ForeColor = System.Drawing.Color.White;
                Button2.BackColor = System.Drawing.Color.Goldenrod;

            }

            conn2.Close();
        }
    }


    protected void like(object sender, EventArgs e)
    {


        //判断是否有该用户收藏记录
        //没有则藏次数加一，存入数据库，背景色变深，文字色变浅
        //否则收藏次数减一，存入数据库，背景色变浅，文字色变深
        if (Session["用户名"] != null)
        {
            string name = Session["用户编号"].ToString();
            string str = "select count(*) from 游记收藏 where 用户编号='" + name + "' and 游记编号='" + DetailsView1.Rows[0].Cells[1].Text + "'";
            SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString);
            conn1.Open();
            SqlCommand cmd1 = new SqlCommand(str, conn1);
            int r = (int)cmd1.ExecuteScalar();
            if (r > 0)
            {
                string strConn = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(strConn);
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "update 游记 set 收藏次数 = 收藏次数 - 1 where 游记编号='" + DetailsView1.Rows[0].Cells[1].Text + "'";
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                string strConn1 = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
                SqlConnection conn2 = new SqlConnection(strConn1);
                SqlCommand cmd2 = conn2.CreateCommand();
                cmd2.CommandText = "DELETE FROM 游记收藏 WHERE 游记编号='" + DetailsView1.Rows[0].Cells[1].Text + "'";
                conn2.Open();
                cmd2.ExecuteNonQuery();
                conn2.Close();

                Button1.ForeColor = System.Drawing.Color.Black;
                Button1.BackColor = System.Drawing.Color.Silver;

            }
            else
            {
                string strConn = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(strConn);
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "update 游记 set 收藏次数 = 收藏次数 + 1 where 游记编号='" + DetailsView1.Rows[0].Cells[1].Text + "'";
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();

                string strConn1 = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
                SqlConnection conn2 = new SqlConnection(strConn1);
                SqlCommand cmd2 = conn2.CreateCommand();
                cmd2.CommandText = "insert into 游记收藏(用户编号,游记编号) values(@name,@tip)";
                cmd2.Parameters.Add("@name", SqlDbType.Int, 4);
                cmd2.Parameters["@name"].Value = int.Parse(name);
                cmd2.Parameters.Add("@tip", SqlDbType.Int, 4);
                cmd2.Parameters["@tip"].Value = int.Parse(DetailsView1.Rows[0].Cells[1].Text);
                conn2.Open();
                cmd2.ExecuteNonQuery();
                conn2.Close();

                Button1.ForeColor = System.Drawing.Color.White;
                Button1.BackColor = System.Drawing.Color.Goldenrod;
            }

            conn1.Close();
        }
        else {

            Response.Redirect("登录.aspx");
        }
            
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        //更新关注表
        int name = int.Parse(Session["用户编号"].ToString());
        int tip = 0;

        string strConn3 = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
        SqlConnection conn3 = new SqlConnection(strConn3);
        SqlCommand cmd3 = conn3.CreateCommand();
        cmd3.CommandText = "select 用户编号 from 用户 where 用户名='" + DetailsView1.Rows[10].Cells[1].Text + "'";
        try
        {
            conn3.Open();
            SqlDataReader sdr = cmd3.ExecuteReader();
            sdr.Read();
            tip = sdr.GetInt32(sdr.GetOrdinal("用户编号"));
        }
        catch (System.Exception ee)
        {
            Response.Write(ee.Message.ToString());
        }
        finally
        {
            conn3.Close();
        }

        string strConn1 = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
        SqlConnection conn2 = new SqlConnection(strConn1);
        SqlCommand cmd2 = conn2.CreateCommand();
        cmd2.CommandText = "insert into 关注(关注者编号,被关注者编号) values(@name,@tip)";
        cmd2.Parameters.Add("@name", SqlDbType.Int, 4);
        cmd2.Parameters["@name"].Value = name;
        cmd2.Parameters.Add("@tip", SqlDbType.Int, 4);
        cmd2.Parameters["@tip"].Value = tip;

        string str = "select count(*) from 关注 where 关注者编号=" + name.ToString() + " and 被关注者编号=" + tip.ToString();
        SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString);
        conn1.Open();
        SqlCommand cmd1 = new SqlCommand(str, conn1);
        int r = (int)cmd1.ExecuteScalar();
        if (r == 0)
        {
            conn2.Open();
            cmd2.ExecuteNonQuery();
            conn2.Close();
            Button2.ForeColor = System.Drawing.Color.White;
            Button2.BackColor = System.Drawing.Color.Goldenrod;
        }
        else
        {
            string strConn6 = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
            SqlConnection conn6 = new SqlConnection(strConn6);
            SqlCommand cmd6 = conn6.CreateCommand();
            cmd6.CommandText = "DELETE FROM 关注 where 关注者编号=" + name.ToString() + " and 被关注者编号=" + tip.ToString();
            conn6.Open();
            cmd6.ExecuteNonQuery();
            conn6.Close();

            Button2.ForeColor = System.Drawing.Color.Black;
            Button2.BackColor = System.Drawing.Color.Silver;
        }

    }

   
}