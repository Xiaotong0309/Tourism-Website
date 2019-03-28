using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 我的订单 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label2.Text = Session["用户名"].ToString();
        Label4.Text = Session["手机号"].ToString();
        Label5.Text = Session["积分"].ToString();
    }
}