using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Configuration;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace crypto
{
    public partial class login : System.Web.UI.Page
    {
        protected Model obj = new Model();
        public string ErrorString { get; private set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            lbl_err.Visible = false;
            lbl_su_err.Visible = false;

            if (!IsPostBack)
            {
                register.Visible = false;
            }
        }
        protected void btn_login_Click(object sender, EventArgs e)
        {
            string username = txt_username.Text.ToString();
            string password = txt_password.Text.ToString();
            string crypt = string.Concat(username, password);
            string hashed_pwd = obj.GetHashString(crypt);

            DataTable dt = new DataTable();
            dt = obj.login(username, hashed_pwd);
            if (dt.Rows.Count == 0)
            {
                lbl_err.Visible = true;
            }
            else
            {
                Session["user_id"] = obj.encode(dt.Rows[0]["id"].ToString());
                Session["user_name"] = obj.encode(dt.Rows[0]["username"].ToString());
                string url = "user_tokens.aspx";
                obj.redirect(url);
            }

        }

        protected void btn_su_Click(object sender, EventArgs e)
        {
            string username = txt_su_username.Text.ToString();
            string password = txt_su_pass.Text.ToString();
            string email = txt_su_email.Text.ToString();
            string crypt = string.Concat(username, password);
            string hashed_pwd = obj.GetHashString(crypt);
            DataTable dt = new DataTable();
            try
            {
                obj.register(username, password, email, hashed_pwd);
            }

            catch (Exception ex)
            {
                ErrorString = ex.Message;
                throw;
                //return false;

            }

        }

        protected void btnreg_Click(object sender, EventArgs e)
        {
            logindiv.Visible = false;
            register.Visible = true;
        }

        protected void havacc_Click(object sender, EventArgs e)
        {
            register.Visible = false;
            logindiv.Visible = true;
        }
    }
}
