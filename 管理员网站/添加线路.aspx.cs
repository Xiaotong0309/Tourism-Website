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

public partial class 管理员网站_添加线路 : System.Web.UI.Page
{
    TableRow row = new TableRow();
    TableRow row1 = new TableRow();
    TableRow row2 = new TableRow();
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
    protected int TotalControls1
    {
        get
        {
            return ViewState["TotControls1"] == null ? 0 : (int)(ViewState["TotControls1"]);
        }
        set
        {
            ViewState["TotControls1"] = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
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


        for (int i = 1; i <= TotalControls1; i++)
        {

            TableCell cell = new TableCell();
            TextBox tb = new TextBox();
            tb.ID = "TB1" + i.ToString();
            cell.Controls.Add(tb);
            row1.Cells.Add(cell);

            TableCell cell1 = new TableCell();
            TextBox tb1 = new TextBox();
            tb1.ID = "TB2" + i.ToString();
            cell1.Controls.Add(tb1);
            row2.Cells.Add(cell1);

        }
        Table2.Rows.Add(row1);
        Table3.Rows.Add(row2);



    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        TotalControls = TotalControls + 1;
        TableCell cell = new TableCell();
        TextBox tb = new TextBox();
        tb.ID = "TB" + TotalControls.ToString();
        cell.Controls.Add(tb);
        row.Cells.Add(cell);
        Table1.Rows.Add(row);
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        TotalControls1 = TotalControls1 + 1;
        TableCell cell = new TableCell();
        TextBox tb = new TextBox();
        tb.ID = "TB1" + TotalControls1.ToString();
        cell.Controls.Add(tb);
        row1.Cells.Add(cell);
        Table2.Rows.Add(row1);

        TableCell cell1 = new TableCell();
        TextBox tb1 = new TextBox();
        tb1.ID = "TB2" + TotalControls1.ToString();
        cell1.Controls.Add(tb1);
        row2.Cells.Add(cell1);
        Table2.Rows.Add(row2);
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        //插入线路表
        string strConn = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand cmd = conn.CreateCommand();
        cmd.CommandText = "insert into 线路(名称,联系方式,天数,线路说明,类别,出发地) values(@title,@utime,@cost,@gtime,@type,@spot)";
        cmd.Parameters.Add("@title", SqlDbType.VarChar, 100);
        cmd.Parameters["@title"].Value = TextBox1.Text;
        cmd.Parameters.Add("@utime", SqlDbType.VarChar, 20);
        cmd.Parameters["@utime"].Value = TextBox2.Text;
        cmd.Parameters.Add("@cost", SqlDbType.Int, 4);
        cmd.Parameters["@cost"].Value = int.Parse(TextBox3.Text);
        cmd.Parameters.Add("@gtime", SqlDbType.VarChar, 7000);
        cmd.Parameters["@gtime"].Value = TextBox4.Text;
        cmd.Parameters.Add("@spot", SqlDbType.VarChar, 20);
        cmd.Parameters["@spot"].Value = TextBox5.Text;
        cmd.Parameters.Add("@type", SqlDbType.SmallInt, 2);
        if (RadioButtonList1.SelectedValue == "一日游")
            cmd.Parameters["@type"].Value = 0;
        else if (RadioButtonList1.SelectedValue == "多日游")
            cmd.Parameters["@type"].Value = 1;
        else cmd.Parameters["@type"].Value = 2;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        string str1 = "select max(线路编号) from 线路";
        SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString);
        conn1.Open();
        SqlCommand cmd1 = new SqlCommand(str1, conn1);
        int r = (int)cmd1.ExecuteScalar();//当前线路编号
        conn1.Close();


        for (int i = 1; i <= TotalControls; i++)
        {
            //插入路线目的地表
            int num = 0;
            string str = string.Empty;
            string strConn2 = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
            SqlConnection conn2 = new SqlConnection(strConn2);
            SqlCommand cmd2 = conn2.CreateCommand();
            cmd2.CommandText = "insert into 线路目的地(目的地编号,线路编号) values(@did,@aid)";
            cmd2.Parameters.Add("@aid", SqlDbType.Int, 4);
            cmd2.Parameters["@aid"].Value = r;
            cmd2.Parameters.Add("@did", SqlDbType.Int, 4);
            str = ((TextBox)this.FindControl("TB" + i.ToString())).Text.Trim();

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


        //插入出行时间表
        for (int i = 1; i <= TotalControls1; i++)
        {
            string str = string.Empty;
            string strConn2 = ConfigurationManager.ConnectionStrings["TravelConnectionString"].ConnectionString;
            SqlConnection conn2 = new SqlConnection(strConn2);
            SqlCommand cmd2 = conn2.CreateCommand();
            str = ((TextBox)this.FindControl("TB1" + i.ToString())).Text;
            cmd2.CommandText = "insert into 出行时间(线路编号,出发日期,价格) values(@did,'" + str + "',@cost)";
            cmd2.Parameters.Add("@did", SqlDbType.Int, 4);
            cmd2.Parameters["@did"].Value = r;
            cmd2.Parameters.Add("@cost", SqlDbType.Int, 4);
            str = ((TextBox)this.FindControl("TB2" + i.ToString())).Text;
            cmd2.Parameters["@cost"].Value = int.Parse(str);
            conn2.Open();
            cmd2.ExecuteNonQuery();
            conn2.Close();
        }


        Response.Redirect("线路管理.aspx");
    }

}