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
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["userid"] != null && ds == null)
                {
                    fetchUserData();
                    displayUserData();
                }
                else if (Session["userid"] != null)
                {
                    displayUserData();
                }
                else
                {
                    hideUserData();
                    showLogin();
                }
            }
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
                string phno = dt.Rows[0][3].ToString();
                string address = dt.Rows[0][4].ToString();
                MailServer mail = new MailServer();
                mail.sendMail(email, "Help!!", "You are the registered emergency contact for " + name + ". The person is in need of help. Please contact immediately at Ph." + phno + "\nAddress" + address);
            }
        }

        protected DataSet fetchUserData()
        {
            //get user details
            int uid = Convert.ToInt32(Session["userid"].ToString());
            ds = new DataSet();
            DBManager dm = new DBManager();
            MySqlParameter[] param = new MySqlParameter[1];
            param[0] = new MySqlParameter("uid", MySqlDbType.Int32);
            param[0].Value = uid;
            ds.Tables.Add( dm.fetchRows("SELECT uId,emailID,fName,lName,phNo,address " +
                                        "FROM cmpe285.USER_DETAILS WHERE uID=@uid",param));
            //get emer contact details
            dm = new DBManager();
            param = new MySqlParameter[1];
            param[0] = new MySqlParameter("uid", MySqlDbType.Int32);
            param[0].Value = uid;
            ds.Tables.Add(dm.fetchRows("SELECT eName,ePhNo,eEmailID " +
                                        "FROM cmpe285.USER_DETAILS WHERE uID=@uid", param));
            //get subscriptions
            dm = new DBManager();
            param = new MySqlParameter[1];
            param[0] = new MySqlParameter("uid", MySqlDbType.Int32);
            param[0].Value = uid;
            ds.Tables.Add(dm.fetchRows("SELECT hName,hAddress,hPhNo,emailId "+
                                        "FROM HOSPITAL join SUBSCRIPTIONS on (HOSPITAL.hID=SUBSCRIPTIONS.hID) "+
                                        "WHERE uID=@uid", param));
            return ds;
        }

        public void displayUserData()
        {
            rptUserDetails.DataSource = ds.Tables[0];
            rptUserDetails.DataBind();

            rptEmergency.DataSource = ds.Tables[1];
            rptEmergency.DataBind();

            grdSubscriptions.DataSource = ds.Tables[2];
            grdSubscriptions.DataBind();

            loggedIn.Visible = true;
        }

        public void hideUserData()
        {
            loggedIn.Visible = false;
        }

        public void showLogin()
        {
            
        }

        protected void btnNotifyEContact_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["userid"] == null)
            { Response.Redirect("Login.aspx"); }

            DBManager dbm = new DBManager();
            MySqlParameter[] param = new MySqlParameter[1];
            param[0] = new MySqlParameter("@uID", MySqlDbType.Int32);
            param[0].Value = Convert.ToInt32(Session["userid"].ToString());

            DataTable dt = dbm.fetchRows("select eEmailID,fname,lname,phno,address from cmpe285.USER_DETAILS where uID=@uID", param);
            string email = dt.Rows[0][0].ToString();
            string name = dt.Rows[0][1].ToString() + " " + dt.Rows[0][2];
            string phno = dt.Rows[0][3].ToString();
            string address = dt.Rows[0][4].ToString();
            MailServer mail = new MailServer();
            mail.sendMail(email, "Help!!", "You are the registered emergency contact for " + name + ". The person is in need of help. Please contact immediately at Ph." + phno + "\nAddress" + address);
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append("Emergency contact notified.");
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }

        protected void btnHospitalGuide_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["userid"] == null)
            { Response.Redirect("Login.aspx"); }
            Response.Redirect("Maps.aspx?filter=1");
        }

        protected void btnNotifyHospital_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["userid"] == null)
            { Response.Redirect("Login.aspx"); }

            DBManager dbm = new DBManager();
            MySqlParameter[] param = new MySqlParameter[1];
            param[0] = new MySqlParameter("@uID", MySqlDbType.Int32);
            param[0].Value = Convert.ToInt32(Session["userid"].ToString());

            DataTable dt = dbm.fetchRows("SELECT bGrp,allergies,insPvdr,insID "+
                                         "FROM MEDICAL_ER "+
                                         "WHERE MEDICAL_ER.uID=@uID", param);
            string bGrp = dt.Rows[0][0].ToString();
            string allergies = dt.Rows[0][1].ToString();
            string insPvdr = dt.Rows[0][2].ToString();
            string insID = dt.Rows[0][3].ToString();

            DBManager dbm1 = new DBManager();
            MySqlParameter[] param1 = new MySqlParameter[1];
            param1[0] = new MySqlParameter("@uID", MySqlDbType.Int32);
            param1[0].Value = Convert.ToInt32(Session["userid"].ToString());


            DataTable dt1 = dbm1.fetchRows("SELECT USER_DETAILS.emailID,fName,lName,phNo,address,HOSPITAL.emailId "+
                                         "FROM cmpe285.USER_DETAILS join SUBSCRIPTIONS on (USER_DETAILS.uID=SUBSCRIPTIONS.uID) "+
                                         "join HOSPITAL on (HOSPITAL.hID=SUBSCRIPTIONS.hID) "+
                                         "WHERE USER_DETAILS.uID", param1);
            string email = dt1.Rows[0][0].ToString();
            string name = dt1.Rows[0][1].ToString() + " " + dt1.Rows[0][2];
            string phno = dt1.Rows[0][3].ToString();
            string address = dt1.Rows[0][4].ToString();

            string message = "Hi,\nThere has been an emergency for the following patient\n" +
                            "Name:" + name + "\n" +
                            "Email:" + email + "\n" +
                            "Ph. no:" + phno + "\n" +
                            "Address:" + address + "\n" +
                            "Insurance Provider:" + insPvdr + "\n" +
                            "Insurance ID:" + insID + "\n" +
                            "Blood group:" + bGrp + "\n" +
                            "Allergies:" + allergies + "\n" +
                            "Please take immediate action.\nThank you!\nEmerge Team";
            MailServer mail ;
            foreach (DataRow dr in dt1.Rows)
            {
                string hospitalMail = dr[5].ToString();
                mail = new MailServer();
                mail.sendMail(hospitalMail, "Emergency situation for "+name, message);
            }
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("alert('");
            sb.Append("Hospitals notified.");
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }

        protected void btnMedicalInfo_Click(object sender, ImageClickEventArgs e)
        {
            if (Session["userid"] == null)
            { Response.Redirect("Login.aspx"); }

            Response.Redirect("MedicalInfo.aspx");
        }
    }
}