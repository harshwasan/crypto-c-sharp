using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace crypto
{
    public partial class home : System.Web.UI.Page
    {
        protected Model obj = new Model();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string url = HttpContext.Current.Request.Url.AbsolutePath;
               // obj.checksessions(url);
                checksessionslogout();
            }
        }
    


public void checksessionslogout()
{

    if (Session["user_name"] == null || Session["user_id"] == null)
    {
        string url = HttpContext.Current.Request.Url.AbsolutePath;
        if (url == "~/login.aspx")
        {
            li_login.Visible = false;
            btn_login.Visible = false;
        }
        else
        {
            li_login.Visible = true;
            btn_login.Text = "login";
        }
    }
    else
    {
        li_login.Visible = true;
        btn_login.Text = "logout";
    }


}
protected void btn_logout_Click(object sender, EventArgs e)
{
    Session["user_id"] = null;
    Session["user_name"] = null;
    obj.redirecttologin();
}

        protected void mailbtn_Click(object sender, EventArgs e)
        {
            try
            {
                
                var fromAddress = new MailAddress("cryptonotificationmailer@gmail.com", "crypto");
                var toAddress = new MailAddress(mailtxt.Text.ToString());
                const string fromPassword = "cryptomailer";
                const string subject = "welcome";
                string body = "<p>welcome to crypto newsletter</p> "; 
                var smtp = new SmtpClient
                {
                    Host = "smtp.gmail.com",
                    Port = 587,
                    EnableSsl = true,
                    DeliveryMethod = SmtpDeliveryMethod.Network,
                    UseDefaultCredentials = false,
                    Credentials = new NetworkCredential(fromAddress.Address, fromPassword)
                };
                using (var message = new MailMessage(fromAddress, toAddress)
                {
                    IsBodyHtml = true,
                    Subject = subject,
                    Body = body
                }

                )

                {
                    smtp.Send(message);
                }

                // MessageBox.Show("mail Send");
            }
            catch (Exception ex)
            {

                // MessageBox.Show(ex.ToString());
            }
        }
    }
}