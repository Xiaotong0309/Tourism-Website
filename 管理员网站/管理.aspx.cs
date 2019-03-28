using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class 管理 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (Session["用户名"] != null)
        {
            Panel2.Visible = false;
            Panel1.Visible = true;
            Panel3.Visible = true;
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string strConn = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand cmd = conn.CreateCommand();
        //方法一：拼接sql字符串，易带来sql注入漏洞,比如，用户名或密码处输入 hi' or 1=1 -- 
        cmd.CommandText = "select * from 管理员 where 账号='" + txtUsername.Text.Trim() + "' and 密码='" + txtPwd.Text.Trim() + "'";
        //方法二：参数化查询，ADO.NET会对一些特殊字符进行转义，这样可以在一定程序上防止SQL注入，提高程序执行效率
        //cmd.CommandText = "select * from admin where U_name=@username and U_pwd=@password";
        //cmd.Parameters.Add(new SqlParameter("username",txtUsername.Text.Trim()));
        //cmd.Parameters.Add(new SqlParameter("password",txtPwd.Text.Trim()));
        //方法三：调用存储过程
        //cmd.CommandText = "sp_Login"; //存储过程的名称
        //cmd.CommandType = CommandType.StoredProcedure;  //设置类型为存储过程
        //cmd.Parameters.Add("@Username",SqlDbType.VarChar,20).Value=txtUsername.Text.Trim();
        //cmd.Parameters.Add("@Password",SqlDbType.VarChar,20).Value=txtPwd.Text.Trim();
        try
        {
            conn.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                Session["用户名"] = txtUsername.Text.Trim();
                Panel2.Visible = false;
                Panel1.Visible = true;
                Panel3.Visible = true;
            }
            else
            {
                //用户不存在
                lblMsg.Text = "用户名或密码错误！";
                txtUsername.Text = "";
                txtPwd.Text = "";
            }
        }


        catch (System.Exception ee)
        {
            Response.Write(ee.Message.ToString());
        }
        finally
        {
            conn.Close();
        }
    }

    protected void Button1_Click1(object sender, EventArgs e)
    {
        Response.Redirect("用户管理.aspx");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("游记管理.aspx");
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("线路管理.aspx");
    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        Session["用户名"] = null;
        Panel2.Visible = true;
        Panel1.Visible = false;
        Panel3.Visible = false;
    }
}