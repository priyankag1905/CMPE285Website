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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = "";
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DBManager dbm = new DBManager();
            MySqlParameter[] param= new MySqlParameter[2];
            param[0] = new MySqlParameter("@EmailId",MySqlDbType.VarChar);
            param[0].Value = txtEmail.Text;
            param[1] = new MySqlParameter("@Password",MySqlDbType.VarChar);
            param[1].Value = txtPassword.Text;
            DataTable dt = dbm.fetchRows("Select uid from `cmpe285`.`USER_DETAILS` where emailid=@EmailId and pwd=@Password", param);
            if (dt.Rows.Count == 0) lblMessage.Text = "Invalid login credentials";
            else { Session.Add("userid", dt.Rows[0][0].ToString()); }
        }
    }
}