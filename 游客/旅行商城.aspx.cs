using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;

public partial class 旅行商城 : System.Web.UI.Page
{

    string sql = "SELECT * FROM[线路筛选] WHERE 1=1 ";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["用户名"] != null) { Label6.Text = Session["用户名"].ToString(); Panel1.Visible = false; Panel2.Visible = true; }//已登录则显示登录名
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



    protected void Button1_Click1(object sender, EventArgs e)
    {
        if(!string.IsNullOrEmpty(this.TextBox1.Text))
            sql += " and 出发地 ='" + TextBox1.Text + "' ";
        if (!string.IsNullOrEmpty(this.TextBox2.Text))
            sql += " and 目的地 ='" + TextBox2.Text + "' ";
        int t = 0;
        for (int i = 1 ; i < CheckBoxList1.Items.Count; i++)
        {
            if (CheckBoxList1.Items[i].Selected)
            {
                string aa = CheckBoxList1.Items[i].Value.Substring(0, CheckBoxList1.Items[i].Value.Length - 1);
                if (t == 0)
                {
                    sql += " and (出发月份 =" + aa;
                    t = 1;
                }
                else sql += " or 出发月份 =" + aa;

            }
        }
        if(t==1)
        sql += " )" ;
        t = 0;
        for (int i = 1; i < CheckBoxList2.Items.Count; i++)
        {
            if (CheckBoxList2.Items[i].Selected)
            {
                string aa = CheckBoxList2.Items[i].Value.Substring(0, CheckBoxList2.Items[i].Value.Length - 1);
                if (t == 0)
                {
                    sql += " and (天数 =" + aa;
                    t = 1;
                }
                else sql += " or 天数 =" + aa;
            }
        }
        if (t == 1)
            sql += " )";
        t = 0;
        for (int i = 1; i < CheckBoxList3.Items.Count; i++)
        {
            if (CheckBoxList3.Items[i].Selected)
            {

                string aa = CheckBoxList3.Items[i].Value;
                if (t == 0)
                {
                    sql += " and (线路类型 ='" + aa +"'";
                    t = 1;
                }
                else sql += " or 线路类型 ='" + aa + "'";
            }
        }
        if (t == 1)
            sql += " )";
        t = 0;
        this.SqlDataSource1.SelectCommand = sql;
    }


   
}