using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Text;

namespace crypto
{
    public partial class token_view : System.Web.UI.Page
    {
        protected Model obj = new Model();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string url = HttpContext.Current.Request.Url.AbsolutePath;
                // var query = HttpUtility.ParseQueryString(uri.Query);
                // string symbol = query.Get("symbol"); 
                obj.checksessions(url);
                checksessionslogout();
                loaddata();
               
            }


        }
        public void loaddata()
        {
            string symbol = Request.QueryString["symbol"];
            if (Request.QueryString["symbol"] != null)
            {
               

                DataTable dt = new DataTable();
                dt = obj.returnpredicteddata(symbol);
                DataTable dt2 = new DataTable();
                dt2 = obj.returnsymboldata(symbol);


                if (dt.Rows.Count > 0)
                {
                    predictedvalue.Text = " $" + dt.Rows[0]["prediction"].ToString();
                    if (Convert.ToDouble(dt2.Rows[0]["price"].ToString()) < Convert.ToDouble(dt.Rows[0]["prediction"].ToString()))
                    {
                        predictedvalue.ForeColor = System.Drawing.Color.Green;
                        recommendation.Text = "The price has more potential to increase , hence it is profitable to buy";
                        recommendation.ForeColor = System.Drawing.Color.Green;
                    }
                    else
                    {
                        predictedvalue.ForeColor = System.Drawing.Color.Red;
                        recommendation.Text = "The price has exceeded its potential to increase , hence it is not safe to buy";
                        recommendation.ForeColor = System.Drawing.Color.Red;
                    }

                }
                else {
                    headerperdict.Visible = false;
                }

            }
            DataTable dt3 = new DataTable();
            dt3 = obj.returnprofitlossalldata(symbol,obj.decode(Session["user_id"].ToString()));
            if (dt3.Rows.Count > 0)
            {
                gridview.DataSource = dt3;
                gridview.DataBind();


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

    }
}