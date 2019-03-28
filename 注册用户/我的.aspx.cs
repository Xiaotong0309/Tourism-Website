using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 我的 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       string strUrl_Yes = "../游客/登录.aspx";
        if (Session["用户名"] == null)
            Response.Write("<Script Language='JavaScript'> window.alert('请先登录');window.location.href='" + strUrl_Yes +
        "' ;</script>");
        else
        {
            Label2.Text = Session["用户名"].ToString();
            Label4.Text = Session["手机号"].ToString();
            Label5.Text = Session["积分"].ToString();
        }
      




    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("写游记.aspx");
    }
}