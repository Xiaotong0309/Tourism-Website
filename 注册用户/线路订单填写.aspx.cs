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

public partial class 线路订单填写 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strUrl_Yes = "../游客/登录.aspx";
        if (Session["用户名"] == null)
            Response.Write("<Script Language='JavaScript'> window.alert('请先登录');window.location.href='" + strUrl_Yes +
        "' ;</script>");
        else
        //根据人数动态生成表单
        for (int i = 1; i <= Convert.ToInt32(Request["b"]); i++)
        {
            TableRow r = new TableRow();
            TableCell c = new TableCell();
            Label lbt = new Label();
            lbt.Text = "出行人" + i.ToString() + ":";
            c.Controls.Add(lbt);
            r.Cells.Add(c);
            HolderTable.Rows.Add(r);

            TableRow row = new TableRow();
            TableCell cell = new TableCell();
            Label lb = new Label();
            lb.Text = "姓名：";
            cell.Controls.Add(lb);
            row.Cells.Add(cell);
            TableCell cell1 = new TableCell();
            TextBox tb = new TextBox();
            tb.ID = "TB" + i.ToString();
            cell1.Controls.Add(tb);
            row.Cells.Add(cell1);
            HolderTable.Rows.Add(row);

            TableRow row1 = new TableRow();
            TableCell cell2 = new TableCell();
            Label lb1 = new Label();
            lb1.Text = "身份证号：";
            cell2.Controls.Add(lb1);
            row1.Cells.Add(cell2);
            TableCell cell3 = new TableCell();
            TextBox tb1 = new TextBox();
            tb1.ID = "TB1" + i.ToString();
            cell3.Controls.Add(tb1);
            row1.Cells.Add(cell3);
            HolderTable.Rows.Add(row1);

            TableRow row2 = new TableRow();
            TableCell cell4 = new TableCell();
            Label lb2 = new Label();
            lb2.Text = "护照号：";
            cell4.Controls.Add(lb2);
            row2.Cells.Add(cell4);
            TableCell cell5 = new TableCell();
            TextBox tb2 = new TextBox();
            tb2.ID = "TB2" + i.ToString();
            cell5.Controls.Add(tb2);
            row2.Cells.Add(cell5);
            HolderTable.Rows.Add(row2);

            TableRow row3 = new TableRow();
            TableCell cell6 = new TableCell();
            Label lb3 = new Label();
            lb3.Text = "手机号：";
            cell6.Controls.Add(lb3);
            row3.Cells.Add(cell6);
            TableCell cell7 = new TableCell();
            TextBox tb3 = new TextBox();
            tb3.ID = "TB3" + i.ToString();
            cell7.Controls.Add(tb3);
            row3.Cells.Add(cell7);
            HolderTable.Rows.Add(row3);

            TableRow row4 = new TableRow();
            TableCell cell8 = new TableCell();
            Label lb4 = new Label();
            lb4.Text = "邮箱：";
            cell8.Controls.Add(lb4);
            row4.Cells.Add(cell8);
            TableCell cell9 = new TableCell();
            TextBox tb4 = new TextBox();
            tb4.ID = "TB4" + i.ToString();
            cell9.Controls.Add(tb4);
            row4.Cells.Add(cell9);
            HolderTable.Rows.Add(row4);

            TableRow row5 = new TableRow();
            TableCell cell10 = new TableCell();
            Label lb5 = new Label();
            lb5.Text = "类型（成人或儿童）：";
            cell10.Controls.Add(lb5);
            row5.Cells.Add(cell10);
            TableCell cell11 = new TableCell();
            TextBox tb5 = new TextBox();
            tb5.ID = "TB5" + i.ToString();
            cell11.Controls.Add(tb5);
            row5.Cells.Add(cell11);
            HolderTable.Rows.Add(row5);


        }
    }

    protected void order(object sender, EventArgs e)
    {

        for (int i = 1; i <= Convert.ToInt32(Request["b"]); i++)
        {
            //判断出行人是否存在，更新出行人信息插入数据库
            string temp = string.Empty;
            temp = ((TextBox)this.FindControl("TB1" + i.ToString())).Text;
            string str1 = "select count(*) from 出行人 where 身份证号='" + temp + "'" ;
            SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString);
            conn1.Open();
            SqlCommand cmd1 = new SqlCommand(str1, conn1);
            int r = (int)cmd1.ExecuteScalar();
            if (r == 0)
            {
                string str = string.Empty;
                string strConn = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(strConn);
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "insert into 出行人(身份证号,护照号,姓名,手机号,邮箱,出行人类型) values(@did,@aid,@name,@phone,@mail,@type)";
                cmd.Parameters.Add("@did", SqlDbType.VarChar, 20);
                str = ((TextBox)this.FindControl("TB1" + i.ToString())).Text;//获取控件的值
                cmd.Parameters["@did"].Value = str;
                cmd.Parameters.Add("@aid", SqlDbType.VarChar, 20);
                str = ((TextBox)this.FindControl("TB2" + i.ToString())).Text;
                cmd.Parameters["@aid"].Value = str;
                cmd.Parameters.Add("@name", SqlDbType.VarChar, 20);
                str = ((TextBox)this.FindControl("TB" + i.ToString())).Text;
                cmd.Parameters["@name"].Value = str;
                cmd.Parameters.Add("@phone", SqlDbType.VarChar, 20);
                str = ((TextBox)this.FindControl("TB3" + i.ToString())).Text;
                cmd.Parameters["@phone"].Value = str;
                cmd.Parameters.Add("@mail", SqlDbType.VarChar, 20);
                str = ((TextBox)this.FindControl("TB4" + i.ToString())).Text;
                cmd.Parameters["@mail"].Value = str;
                cmd.Parameters.Add("@type", SqlDbType.Bit, 1);
                str = ((TextBox)this.FindControl("TB5" + i.ToString())).Text;
                if (str == "成人")
                    cmd.Parameters["@type"].Value = 0;
                else cmd.Parameters["@type"].Value = 1;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            conn1.Close();
            //参团信息插入数据库
            string str2 = string.Empty;
            string strConn2 = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
            SqlConnection conn2 = new SqlConnection(strConn2);
            SqlCommand cmd2 = conn2.CreateCommand();
            cmd2.CommandText = "insert into 参团(出行人编号,线路编号,出发日期) values(@pid,@rid,'" + Request["a"].ToString() + "')";
            cmd2.Parameters.Add("@pid", SqlDbType.Int, 4);

            int num = 0;
            String str3 = ((TextBox)this.FindControl("TB1" + i.ToString())).Text;
            string strConn3 = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
            SqlConnection conn3 = new SqlConnection(strConn3);
            SqlCommand cmd3 = conn3.CreateCommand();
            cmd3.CommandText = "select * from 出行人 where 身份证号='" + str3 + "'";
            try
            {
                conn3.Open();
                SqlDataReader sdr = cmd3.ExecuteReader();
                sdr.Read();
                num = sdr.GetInt32(sdr.GetOrdinal("出行人编号"));
            }
            catch (System.Exception ee)
            {
                Response.Write(ee.Message.ToString());
            }
            finally
            {
                conn3.Close();
            }

            cmd2.Parameters["@pid"].Value = num;
            cmd2.Parameters.Add("@rid", SqlDbType.Int, 4);
            cmd2.Parameters["@rid"].Value = int.Parse(Request["c"].ToString());
            conn2.Open();
            cmd2.ExecuteNonQuery();

            conn2.Close();
            //判断用户是否创建过此出行人，创建出行人信息插入数据库
            string str4 = "select count(*) from 创建出行人 where 出行人编号=" + num.ToString() + " and 用户编号=" + int.Parse(Session["用户编号"].ToString());
            SqlConnection conn4 = new SqlConnection(ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString);
            conn4.Open();
            SqlCommand cmd4 = new SqlCommand(str4, conn4);
            int g = (int)cmd4.ExecuteScalar();
            if (g == 0)
            {
                string str5 = string.Empty;
                string strConn5 = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
                SqlConnection conn5 = new SqlConnection(strConn5);
                SqlCommand cmd5 = conn5.CreateCommand();
                cmd5.CommandText = "insert into 创建出行人(用户编号,出行人编号) values(@uid,@gid)";
                cmd5.Parameters.Add("@uid", SqlDbType.Int, 4);
                cmd5.Parameters["@uid"].Value = int.Parse(Session["用户编号"].ToString());
                cmd5.Parameters.Add("@gid", SqlDbType.Int, 4);
                cmd5.Parameters["@gid"].Value = num;
                conn5.Open();
                cmd5.ExecuteNonQuery();
                conn5.Close();

            }
            conn4.Close();


        }

        //预定线路信息
        string strConn13 = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
        SqlConnection conn13 = new SqlConnection(strConn13);
        SqlCommand cmd13 = conn13.CreateCommand();
        cmd13.CommandText = "insert into 预定线路(用户编号,线路编号) values(@uid,@gid)";
        cmd13.Parameters.Add("@uid", SqlDbType.Int, 4);
        cmd13.Parameters["@uid"].Value = int.Parse(Session["用户编号"].ToString());
        cmd13.Parameters.Add("@gid", SqlDbType.Int, 4);
        cmd13.Parameters["@gid"].Value = int.Parse(Request["c"].ToString());
        conn13.Open();
        cmd13.ExecuteNonQuery();
        conn13.Close();
        //直接支付则弹出需支付金额
        //积分抵现则弹出需支付金额，扣除积分更新至数据库
        //购买得积分更新至数据库
        int money =0;
        int mark = 0;
        string strConn9 = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
        SqlConnection conn9 = new SqlConnection(strConn9);
        SqlCommand cmd9 = conn9.CreateCommand();
        cmd9.CommandText = "select * from 用户 where 用户名='" + Session["用户名"].ToString() + "'";
        try
        {
            conn9.Open();
            SqlDataReader sdr = cmd9.ExecuteReader();
            sdr.Read();
            mark = sdr.GetInt32(sdr.GetOrdinal("积分"));
        }
        catch (System.Exception ee)
        {
            Response.Write(ee.Message.ToString());
        }
        finally
        {
            conn9.Close();
        }

        string strConn6 = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
        SqlConnection conn6 = new SqlConnection(strConn6);
        SqlCommand cmd6 = conn6.CreateCommand();
        cmd6.CommandText = "select 价格 from 出行时间 where 线路编号=" + Request["c"] + " and 出发日期='" + Request["a"] + "'";
        try
        {
            conn6.Open();
            SqlDataReader sdr = cmd6.ExecuteReader();
            sdr.Read();
            money = sdr.GetInt32(sdr.GetOrdinal("价格"));
        }
        catch (System.Exception ee)
        {
            Response.Write(ee.Message.ToString());
        }
        finally
        {
            conn6.Close();
        }
        int mm = money;
        if (RadioButtonList1.SelectedValue== "积分抵现")
        {
            
         if ((mark/100) > money)
            {
                mark = mark - 100 * money;
                money = 0;
                string strConn = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(strConn);
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "update 用户 set 积分 = "+ mark.ToString() +" where 用户名='" + Session["用户名"].ToString() + "'";
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            else
            {
                money = money - mark / 100;
                mark = 0;
                string strConn = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
                SqlConnection conn = new SqlConnection(strConn);
                SqlCommand cmd = conn.CreateCommand();
                cmd.CommandText = "update 用户 set 积分 = 0  where 用户名='" + Session["用户名"].ToString() + "'";
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }
            
        }
        mark += mm/5;
        string strConn7 = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
        SqlConnection conn7 = new SqlConnection(strConn7);
        SqlCommand cmd7 = conn7.CreateCommand();
        cmd7.CommandText = "update 用户 set 积分 = " + mark.ToString() + " where 用户名='" + Session["用户名"].ToString() + "'";
        Session["积分"] = mark.ToString();
        conn7.Open();
        cmd7.ExecuteNonQuery();
        conn7.Close();

        string strMsg, strUrl_Yes, strUrl_No;
        strMsg = "您需要支付" + money.ToString() + "元，剩余积分" + mark.ToString() + "，请完成支付。";
        strUrl_Yes = "../游客/旅行商城.aspx";
        Response.Write("<Script Language='JavaScript'> window.alert('" + strMsg + "'); window.location.href='" + strUrl_Yes +
        "' ;</script>");
        

    }
}
