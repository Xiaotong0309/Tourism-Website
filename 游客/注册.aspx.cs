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

public partial class reg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        SqlConnection connres = new SqlConnection(ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString);

        connres.Open();
        //string cmdres = "insert into 用户(用户名,密码,手机号,生日,性别) values(@name,@pass,@phone,@birthday,@sex)";
        string str1 = this.Request.Form["birth"];
        string cmdres = "insert into 用户(用户名,密码,手机号,生日,性别) values('"+ this.Request.Form["name"] + "','"+ this.Request.Form["pwd"] + "','"+ this.Request.Form["phone"] + "','"+ str1 + "',@sex)";
        SqlCommand cmdte = new SqlCommand(cmdres, connres);
        /*
        cmdte.Parameters.Add("@name", SqlDbType.VarChar, 20);
        cmdte.Parameters["@name"].Value = this.Request.Form["name"];
        cmdte.Parameters.Add("@pass", SqlDbType.VarChar, 18);
        cmdte.Parameters["@pass"].Value = this.Request.Form["pwd"];
        cmdte.Parameters.Add("@phone", SqlDbType.VarChar, 20);
        cmdte.Parameters["@phone"].Value = this.Request.Form["phone"];
        //cmdte.Parameters.Add("@birthday", SqlDbType.Date, 8);
        cmdte.Parameters["@birthday"].Value =this.Request.Form["birth"];
        */
        cmdte.Parameters.Add("@sex", SqlDbType.Bit, 1);
        cmdte.Parameters["@sex"].Value = int.Parse(this.RadioButtonList1.SelectedIndex.ToString());


        string name = this.Request.Form["name"];
        string str = "select count(*) from 用户 where 用户名='" + name + "'";
        if(this.Request.Form["name"].ToString() == null || this.Request.Form["pwd"].ToString() == null )
        {
            Response.Write("<script>alter('请重新输入！')</script>");
        }
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString);
        conn.Open();
        SqlCommand cmd = new SqlCommand(str, conn);
        int r = (int)cmd.ExecuteScalar();
        conn.Close();
        
        if (r >= 1)
        {
            Response.Write("<script>alter('用户已存在，请重新输入！')</script>");


        }
        else
        {

            
                cmdte.ExecuteNonQuery();
                connres.Close();
            //Response.Write("<script>alert('注册成功！')</script>");
            Response.Write("<Script Language='JavaScript'> window.alert('注册成功！'); window.location.href='首页.aspx' ;</script>");
            //Response.Redirect("首页.aspx");

        }

    }
}