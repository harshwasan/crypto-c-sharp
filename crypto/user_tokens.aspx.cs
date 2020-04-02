using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace crypto
{
    public partial class user_tokens : System.Web.UI.Page
    {
        protected Model obj = new Model();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["user_name"] == null || Session["user_id"] == null)
                { }
                else {
                    DataTable dt2 = new DataTable();
                    dt2 = obj.cchecker();
                    coinlistddl.DataSource = dt2;
                    coinlistddl.DataTextField = "id";
                    coinlistddl.DataValueField = "id";
                    coinlistddl.DataBind();
                   
                    loadusercoins();
                }
            }

        }
        public void loadusercoins() {
            DataTable dt = new DataTable();
            string uid = Session["user_id"].ToString();
            dt =obj.usercoindetails(obj.decode(uid));
            gridview.DataSource = dt;
            gridview.DataBind();
           // gridview.UseAccessibleHeader = true;
           // gridview.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
      

        protected void grd_existingleads_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            // string id = e.CommandArgument.ToString();

            int rowIndex = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gridview.Rows[rowIndex];
            string name = (row.FindControl("Coin") as Label).Text;
            string boughtcost = (row.FindControl("cost_you_bought_at") as Label).Text;
            string volume = (row.FindControl("Vol_owned") as Label).Text;
            string notificationlimit = (row.FindControl("notification_limi") as Label).Text;
            hiddenfield.Value= (row.FindControl("hdnfld") as HiddenField).Value.ToString();
            coinlistddl.SelectedItem.Text = name;
            txt_cost.Text = notificationlimit;
            txt_boughtcost.Text = boughtcost;
            txt_vol.Text = volume; 
            insertusercoin.Visible = false;
            updateusercoin.Visible = true;
            reset.Visible = true;
            coinlistddl.Enabled = false;

        }

        protected void insertusercoin_Click(object sender, EventArgs e)
        {
            string name = coinlistddl.SelectedItem.Value.ToString();
            string boughtcost = txt_boughtcost.Text.ToString();
            string volume = txt_vol.Text.ToString();
            string notificationlimit = txt_cost.Text.ToString();
            string id = obj.decode(Session["user_id"].ToString());
            obj.insertuserpricelist(id, name, volume, boughtcost, notificationlimit);
            coinlistddl.Enabled = true;
            txt_boughtcost.Text = "";
            txt_vol.Text = "";
            txt_cost.Text = "";
            hiddenfield.Value = "";
            

            loadusercoins();
        }

        protected void updateusercoin_Click(object sender, EventArgs e)
        {
            string name = coinlistddl.SelectedItem.Value.ToString();
            string boughtcost = txt_boughtcost.Text.ToString();
            string volume = txt_vol.Text.ToString();
            string notificationlimit = txt_cost.Text.ToString();
            string id = hiddenfield.Value.ToString();
            obj.updateuserlist(id,name,volume,boughtcost,notificationlimit);
            coinlistddl.Enabled = true;
            txt_boughtcost.Text = "";
            txt_vol.Text = "";
            txt_cost.Text = "";
            hiddenfield.Value = "";
            updateusercoin.Visible = false;
            reset.Visible = false;
            insertusercoin.Visible = true;
            loadusercoins();
        }

        protected void reset_Click(object sender, EventArgs e)
        {
            txt_boughtcost.Text = "";
            txt_vol.Text = "";
            txt_cost.Text = "";
            hiddenfield.Value = "";
            coinlistddl.Enabled = true;
            updateusercoin.Visible = false;
            reset.Visible = false;
            insertusercoin.Visible = true;
        }
    }
}