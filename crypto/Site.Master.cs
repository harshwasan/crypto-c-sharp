using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace crypto
{
    public partial class SiteMaster : MasterPage
    {
        protected Model obj = new Model();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                string url = HttpContext.Current.Request.Url.AbsolutePath;
                obj.checksessions(url);
                checksessionslogout();
            }

        }
        public void checksessionslogout()
        {

            if ( Session["user_name"] == null || Session["user_id"] == null)
            {
                string url = HttpContext.Current.Request.Url.AbsolutePath;
                if (url == "/login")
                {
                    li_login.Visible = false;
                    btn_login.Visible = false;
                }
                else
                {
                    li_login.Visible = true;
                    btn_login.Text = "Login";
                }
            }
            else
            {
                li_login.Visible = true;
                btn_login.Text = "Logout";
            }


        }
        protected void btn_logout_Click(object sender, EventArgs e)
        {
            Session["user_id"] = null;
            Session["user_name"] = null;
            obj.redirecttologin();
        }


    }
}
