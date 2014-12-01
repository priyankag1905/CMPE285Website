using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using CMPE285Website.DAL;

namespace CMPE285Website
{
    public partial class Maps : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
               /* DBManager dbm = new DBManager();
                DataTable dt = dbm.fetchRows("SELECT hName as Name, hLat as Latitude, hlong as longitude, haddress as description FROM cmpe285.HOSPITAL", null);
                rptMarkers.DataSource = dt;
                rptMarkers.DataBind();*/
            }
        }
    }


}