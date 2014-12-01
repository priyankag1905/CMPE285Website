using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CMPE285Website.DAL;
using System.Data;
using MySql.Data.MySqlClient;

namespace CMPE285Website
{
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnHelp_Click(object sender, EventArgs e)
        {
            if (Session["userid"] == null)
            { Response.Redirect("Login.aspx"); }
            else
            {
                DBManager dbm = new DBManager();
                MySqlParameter[] param = new MySqlParameter[1];
                param[0] = new MySqlParameter("@uID", MySqlDbType.Int32);
                param[0].Value = Convert.ToInt32(Session["userid"].ToString());

                DataTable dt = dbm.fetchRows("select eEmailID,fname,lname,phno,address from cmpe285.USER_DETAILS where uID=@uID", param);
                string email = dt.Rows[0][0].ToString();
                string name = dt.Rows[0][1].ToString() + " " + dt.Rows[0][2];
                string phno = dt.Rows[0][2].ToString();
                string address = dt.Rows[0][3].ToString();
                MailServer mail = new MailServer();
                mail.sendMail(email, "Help!!", "You are the registered emergency contact for " + name + ". The person is in need of help. Please contact immediately at Ph." + phno + "\nAddress" + address);
            }
        }
    }
}