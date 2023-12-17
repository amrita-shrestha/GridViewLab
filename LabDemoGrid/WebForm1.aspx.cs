using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LabDemoGrid
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            SqlDataSource1.InsertParameters["name"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("NameDDl")).Text;
            SqlDataSource1.InsertParameters["course"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("DropDownList1")).SelectedValue;
            //if inserted a=1
            int a = SqlDataSource1.Insert();
            if (a > 0)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(),"Script","<script>alert('Insertion successdful')</script>");
            }
        
        }
    }
}