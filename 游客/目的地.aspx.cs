using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["用户名"] != null) { Label1.Text = Session["用户名"].ToString(); Panel1.Visible = false; Panel2.Visible = true; }//已登录则显示登录名
        else { Panel1.Visible = true; Panel2.Visible = false; }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["用户名"] = null;
        Session["生日"] = null;
        Session["手机号"] = null;
        Session["积分"] = null;
        Session["用户编号"] = null;
        Panel1.Visible = true;
        Panel2.Visible = false;


    }
}