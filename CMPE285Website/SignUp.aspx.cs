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
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = "";
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            DBManager dbm = new DBManager();
            String query = "INSERT INTO `cmpe285`.`USER_DETAILS`(`pwd`,`emailID`,`fName`,`lName`," +
                "`phNo`,`address`,`eName`,`ePhNo`,`eEmailID`) VALUES(@pwd,@emailID,@fname,@lname," +
                "@phno,@address,@ename,@ephno,@eemailid)";
            MySqlParameter[] param = new MySqlParameter[9];
            param[0] = new MySqlParameter("@pwd", MySqlDbType.VarChar);
            param[0].Value = txtPassword.Text;
            param[1] = new MySqlParameter("@emailID", MySqlDbType.VarChar);
            param[1].Value = txtEmail.Text;
            param[2] = new MySqlParameter("@fname", MySqlDbType.VarChar);
            param[2].Value = txtFirstName.Text;
            param[3] = new MySqlParameter("@lname", MySqlDbType.VarChar);
            param[3].Value = txtLastName.Text;
            param[4] = new MySqlParameter("@phno", MySqlDbType.VarChar);
            param[4].Value = txtPhNo.Text;
            param[5] = new MySqlParameter("@address", MySqlDbType.VarChar);
            param[5].Value = txtAddress.Text;
            param[6] = new MySqlParameter("@ename", MySqlDbType.VarChar);
            param[6].Value = txtEName.Text;
            param[7] = new MySqlParameter("@ephno",MySqlDbType.VarChar);
            param[7].Value = txtEPhNo.Text;
            param[8] = new MySqlParameter("@eemailid",MySqlDbType.VarChar);
            param[8].Value = txtEEmail.Text;
            dbm.executeDDL(query, param);
            DBManager dbm1 = new DBManager();
            MySqlParameter[] param1 = new MySqlParameter[1];
            param1[0] = new MySqlParameter("@emailid",MySqlDbType.VarChar);
            DataTable dt = dbm1.fetchRows("select uid from `cmpe285`.`USER_DETAILS` where emailID=@emailid", param1);
            if (dt == null) lblMessage.Text = "SignUp failed";
            else
            {
                Session.Add("userid", dt.Rows[0][0].ToString());
                DBManager dbm2 = new DBManager();
                String query2 = "INSERT INTO `cmpe285`.`MEDICAL_ER` (`bGrp`,`allergies`,`insPvdr`,`insID`,`uID`) "+
                    "VALUES(@bgrp,@allergies,@iprovider,@iid,@uid)";
                MySqlParameter[] param2 = new MySqlParameter[5];
                param2[0] = new MySqlParameter("@bgrp", MySqlDbType.VarChar);
                param2[0].Value = txtBgrp.Text;
                param2[1] = new MySqlParameter("@allergies", MySqlDbType.VarChar);
                param2[1].Value = txtAllergies.Text;
                param2[2] = new MySqlParameter("@iprovider", MySqlDbType.VarChar);
                param2[2].Value = txtIProvider.Text;
                param2[3] = new MySqlParameter("@iid", MySqlDbType.VarChar);
                param2[3].Value = txtIId.Text;
                param2[4] = new MySqlParameter("@uid", MySqlDbType.Int32);
                param2[4].Value = Convert.ToInt32(Session["userid"].ToString());
                dbm.executeDDL(query2, param2);
                Response.Redirect("Home.aspx");
            }
            
        }
    }
}