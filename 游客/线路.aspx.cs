using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class 线路 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["用户名"] != null) { Panel1.Visible = false; }//已登录则显示登录名
        else { Panel1.Visible = true; }
        if (Session["用户名"] != null)
        {
            string name = Session["用户编号"].ToString();
            string str = "select count(*) from 线路收藏 where 用户编号=" + name + " and 线路编号=" + DetailsView1.Rows[0].Cells[1].Text.ToString();
            SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString);
            conn1.Open();
            SqlCommand cmd1 = new SqlCommand(str, conn1);
            int r = (int)cmd1.ExecuteScalar();
            if (r > 0)
            {
                Button2.ForeColor = System.Drawing.Color.White;
                Button2.BackColor = System.Drawing.Color.Goldenrod;

            }

            conn1.Close();
        }
    }

    protected void order(object sender, EventArgs e)
    {
        //转移至填写订单页面，传递日期，人数，线路编号
        string a = Text1.Text;
        string b = Text2.Text;
        Response.Redirect("../注册用户/线路订单填写.aspx?a=" + a + "&b=" + b + "&c=" + this.DetailsView1.Rows[0].Cells[1].Text.ToString());
    }

    protected void like(object sender, EventArgs e)
    {
        //判断是否有该用户收藏记录
        //没有则藏次数加一，存入数据库，背景色变深，文字色变浅
        //否则收藏次数减一，存入数据库，背景色变浅，文字色变深
        if (Session["用户名"] != null)
        {
            string name = Session["用户编号"].ToString();
            string tip = DetailsView1.Rows[0].Cells[0].Text;
            string str = "select count(*) from 线路收藏 where 用户编号=" + name + " and 线路编号=" + DetailsView1.Rows[0].Cells[1].Text ;
            SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString);
            conn1.Open();
            SqlCommand cmd1 = new SqlCommand(str, conn1);
            int r = (int)cmd1.ExecuteScalar();
            if (r > 0)
            {


                string strConn1 = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
                SqlConnection conn2 = new SqlConnection(strConn1);
                SqlCommand cmd2 = conn2.CreateCommand();
                cmd2.CommandText = "DELETE FROM 线路收藏 WHERE 线路编号=" + DetailsView1.Rows[0].Cells[1].Text;
                conn2.Open();
                cmd2.ExecuteNonQuery();
                conn2.Close();

                Button2.ForeColor = System.Drawing.Color.Black;
                Button2.BackColor = System.Drawing.Color.Silver;


            }
            else
            {


                string strConn1 = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
                SqlConnection conn2 = new SqlConnection(strConn1);
                SqlCommand cmd2 = conn2.CreateCommand();
                cmd2.CommandText = "insert into 线路收藏(用户编号,线路编号) values(@name,@tip)";
                cmd2.Parameters.Add("@name", SqlDbType.Int, 4);
                cmd2.Parameters["@name"].Value = int.Parse(name);
                cmd2.Parameters.Add("@tip", SqlDbType.Int, 4);
                cmd2.Parameters["@tip"].Value = int.Parse(DetailsView1.Rows[0].Cells[1].Text);
                conn2.Open();
                cmd2.ExecuteNonQuery();
                conn2.Close();

                Button2.ForeColor = System.Drawing.Color.White;
                Button2.BackColor = System.Drawing.Color.Goldenrod;

            }

            conn1.Close();
        }
    }
}