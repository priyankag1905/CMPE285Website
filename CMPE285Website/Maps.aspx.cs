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
using MySql.Data.MySqlClient;

namespace CMPE285Website
{
    public partial class Maps : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                /*DBManager dbm = new DBManager();
                //DataTable dt = dbm.fetchRows("SELECT `hName` as `Name`, `hLat` as `Latitude`, `hlong` as `longitude`, `haddress` as `description` FROM `cmpe285`.`HOSPITAL`", null);
                MySqlParameter[] param = new MySqlParameter[1];
                param[0] = new MySqlParameter("hID", MySqlDbType.Int32);
                param[0].Value = 1;
                DataTable dt = dbm.fetchRows("SELECT * FROM `cmpe285`.`HOSPITAL` where hID>@hID", param);
                rptMarkers.DataSource = dt;
                rptMarkers.DataBind();*/
            }
        }
    }


}