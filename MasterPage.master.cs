using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //pgBody.Attributes["bgcolor"] = "fafafa";
    }

    protected string GetSrcPath1()
    {

        return Page.ResolveUrl("~/js/jquery-1.8.3.min.js");
    }

    protected string GetSrcPath2()
    {
        return Page.ResolveUrl("~/css/5grid/init.js?use=mobile,desktop,1000px");
    }

        protected string GetSrcPath3()
    {
        return Page.ResolveUrl("~/js/init.js");
    }
}
