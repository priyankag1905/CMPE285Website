using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Collections;

namespace CMPE285Website.DAL
{
    public class MailServer
    {

        public Boolean sendMail(string toAddress, string subject, string body)
        {
            MailMessage message = new MailMessage();
            var fromAdd = new MailAddress(System.Configuration.ConfigurationManager.AppSettings["mailSender"]);
            var toAdd = new MailAddress(toAddress);
            message.To.Add(toAdd);
            message.From = fromAdd;
            message.Subject = subject;
            message.Body = body;
            //message.CC.Add(new MailAddress("carboncopy@foo.bar.com"));

            SmtpClient client = new SmtpClient();
            client.Port = 587; // Gmail works on this port
            client.Host = "smtp.gmail.com";
            System.Net.NetworkCredential nc = new System.Net.NetworkCredential(System.Configuration.ConfigurationManager.AppSettings["mailSender"].ToString(), System.Configuration.ConfigurationManager.AppSettings["mailPassword"].ToString());
            client.EnableSsl = true;
            client.UseDefaultCredentials = false;
            client.Credentials = nc;
            client.Send(message);
            //Label_error.Text = "Mail Send";
            return true;
        }
    }

}