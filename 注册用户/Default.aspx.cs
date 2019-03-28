using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{

    string[] str = new String[7];
    string[] str1 = new String[7];
    TableRow row = new TableRow();
    TableRow row1 = new TableRow();
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
            tb.ID = "TB1" + i.ToString();
            cell.Controls.Add(tb);
            row.Cells.Add(cell);

        }
        Table1.Rows.Add(row);
        for (int i = 1; i <= TotalControls1; i++)
        {

            TableCell cell = new TableCell();
            TextBox tb = new TextBox();
            tb.ID = "TB" + i.ToString();
            cell.Controls.Add(tb);
            row1.Cells.Add(cell);

        }
        Table2.Rows.Add(row1);
    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        TotalControls = TotalControls + 1;
        TableCell cell = new TableCell();
        TextBox tb = new TextBox();
        tb.ID = "TB1" + TotalControls.ToString();
        cell.Controls.Add(tb);
        row.Cells.Add(cell);
        Table1.Rows.Add(row);


    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        for (int i = 1; i <= TotalControls; i++)
        {
            str[i - 1] = ((TextBox)this.FindControl("TB1" + i.ToString())).Text;

        }
        Label1.Text = str[0];
        Label2.Text = str[1];
        Label3.Text = str[2];
        Label4.Text = TotalControls.ToString();
        for (int i = 1; i <= TotalControls1; i++)
        {
            str1[i - 1] = ((TextBox)this.FindControl("TB" + i.ToString())).Text;

        }
        Label5.Text = str1[0];
        Label6.Text = str1[1];
        Label7.Text = str1[2];
        Label8.Text = TotalControls1.ToString();
    }


    protected void Button3_Click(object sender, EventArgs e)
    {
        TotalControls1 = TotalControls1 + 1;
        TableCell cell = new TableCell();
        TextBox tb = new TextBox();
        tb.ID = "TB" + TotalControls1.ToString();
        cell.Controls.Add(tb);
        row1.Cells.Add(cell);
        Table2.Rows.Add(row1);

    }



    protected void Button4_Click(object sender, EventArgs e)
    {
        Label9.Text = RadioButtonList1.SelectedValue;
        if (RadioButtonList1.SelectedValue == "B")
            Label9.Text = "y";

    }
}