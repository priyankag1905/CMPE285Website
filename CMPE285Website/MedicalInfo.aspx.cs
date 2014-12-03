using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CMPE285Website.DAL;
using MySql.Data.MySqlClient;
using System.Data;

namespace CMPE285Website
{
    public partial class MedicalInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null) Response.Redirect("Login.aspx");            
        }
    }
}