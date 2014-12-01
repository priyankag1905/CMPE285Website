using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using CMPE285Website.DAL;

namespace CMPE285Website
{
    public partial class Subscription : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userid"] == null) Session.Add("userid", 1);
        }

        protected void btnSubscribe_Click(object sender, EventArgs e)
        {
            try{
                foreach(GridViewRow row in gdSubscription.Rows){
                    if (((CheckBox)row.FindControl("chkBox")).Checked)
                    {
                        DBManager dbm = new DBManager();
                        MySqlParameter[] param1=new MySqlParameter[4];
                        param1[0]=new MySqlParameter("uID",MySqlDbType.Int32);
                        param1[0].Value=Convert.ToInt32(Session["userid"].ToString());
                        param1[1]=new MySqlParameter("hID",MySqlDbType.Int32);
                        param1[1].Value=Convert.ToInt32(row.Cells[1].Text.ToString());
                        param1[2]=new MySqlParameter("st_date",MySqlDbType.DateTime);
                        param1[2].Value=DateTime.Today;
                        param1[3]=new MySqlParameter("end_date",MySqlDbType.DateTime);
                        param1[3].Value=DBNull.Value;
                        int success=dbm.executeDDL("INSERT into `cmpe285`.`SUBSRIPTIONS`(`uID`,`hID`,`st_date`,`end_date`) " +
                            "VALUES(@uID,@hID,@st_date,@end_date)",param1);

                    }

                }
            } catch(Exception ex) {
                Response.Write(ex.Message);
            }
            Response.Write("Successfully subscribed.");
        }
    }
}