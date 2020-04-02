using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;


public partial class Model : System.Web.UI.Page
{
    readonly string strcon = ConfigurationManager.ConnectionStrings["sqlcon"].ConnectionString;
    readonly string strcon1 = ConfigurationManager.ConnectionStrings["sqlcon1"].ConnectionString;

    public string ErrorString { get; private set; }
    public class model
    {
       
    }
    public DataTable login(string username, string password)
    {

        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection(strcon);
        SqlCommand cmd = new SqlCommand("sp_lgn", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@username", SqlDbType.VarChar, 50).Value = username;
        cmd.Parameters.Add("@password", SqlDbType.VarChar, 100).Value = password;

        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        {
            da.Fill(dt);
        }

        return dt;

    }


    public DataTable usercoindetails(string userid)
    {

        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection(strcon);
        SqlCommand cmd = new SqlCommand("sp_returnusercoindetails", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@uid", SqlDbType.VarChar, 50).Value = userid;
        

        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        {
            da.Fill(dt);
        }

        return dt;

    }
    public DataTable usercoinsymboldetails(string userid,string symbol)
    {

        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection(strcon);
        SqlCommand cmd = new SqlCommand("sp_returnboughtsymbolcoins", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@uid", SqlDbType.VarChar, 50).Value = userid;
        cmd.Parameters.Add("@symbol", SqlDbType.VarChar, 50).Value = symbol;


        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        {
            da.Fill(dt);
        }

        return dt;

    }
    public DataTable returnpredicteddata(string symbol)
    {

        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection(strcon);
        SqlCommand cmd = new SqlCommand("sp_returnpredictedvalues", con);
        cmd.CommandType = CommandType.StoredProcedure;
        //cmd.Parameters.Add("@uid", SqlDbType.VarChar, 50).Value = userid;
        cmd.Parameters.Add("@symbol", SqlDbType.VarChar, 50).Value = symbol;


        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        {
            da.Fill(dt);
        }

        return dt;

    }
    public DataTable cchecker()
    {

        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection(strcon);
        SqlCommand cmd = new SqlCommand("returncoinlastdata", con);
        cmd.CommandType = CommandType.StoredProcedure;
        //cmd.Parameters.Add("@username", SqlDbType.VarChar, 50).Value = username;


        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        {

            da.Fill(dt);
        }

        return dt;

    }
    public DataTable returnsymboldata(string symbol)
    {

        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection(strcon);
        SqlCommand cmd = new SqlCommand("sp_returnsymbollastdata", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@symbol", SqlDbType.VarChar, 50).Value = symbol;


        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        {

            da.Fill(dt);
        }

        return dt;

    }
    public DataTable returnprofitlossalldata(string symbol,string id)
    {

        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection(strcon);
        SqlCommand cmd = new SqlCommand("returnprofitlosscoindata", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@symbol", SqlDbType.VarChar, 50).Value = symbol;
        cmd.Parameters.Add("@id", SqlDbType.VarChar, 50).Value = id;


        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        {

            da.Fill(dt);
        }

        return dt;

    }

    #region inputs
    public void register(string username, string password, string email, string password_hash)
    {
        SqlConnection con = new SqlConnection(strcon);

        SqlCommand cmd = new SqlCommand("sp_register", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@username", SqlDbType.VarChar, 50).Value = username;
        cmd.Parameters.Add("@email", SqlDbType.VarChar, 50).Value = email;
        cmd.Parameters.Add("@password", SqlDbType.VarChar, 50).Value = password;

        cmd.Parameters.Add("@password_hash", SqlDbType.VarChar, 100).Value = password_hash;

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    //public DataTable inserusertlist(string username, string userid, string[] list)//to directly fetch the list of the coins bought by user 
    //{

    //    DataTable dt = new DataTable();
    //    SqlConnection con = new SqlConnection(strcon);
    //    SqlCommand cmd = new SqlCommand("sp_insertuserlist", con);
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    cmd.Parameters.Add("@username", SqlDbType.VarChar, 50).Value = username;
    //    cmd.Parameters.Add("@userid", SqlDbType.VarChar, 50).Value = userid;
    //    cmd.Parameters.Add("@list", SqlDbType.VarChar, 50).Value = list;



    //    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
    //    {

    //        da.Fill(dt);
    //    }

    //    return dt;

    //}

   
    public void insertuserpricelist(string userid, string coinname, string coinvolume, string coinboughtprice, string coinlimit)
    {

        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection(strcon);
        SqlCommand cmd = new SqlCommand("sp_storelist", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@userid", SqlDbType.VarChar, 50).Value = userid;
        cmd.Parameters.Add("@coinname", SqlDbType.VarChar, 50).Value = coinname;        
        cmd.Parameters.Add("@coinvolume", SqlDbType.VarChar, 50).Value = coinvolume;
        cmd.Parameters.Add("@coinboughtprice", SqlDbType.VarChar, 50).Value = coinboughtprice;
        cmd.Parameters.Add("@coinlimit", SqlDbType.VarChar, 50).Value = coinlimit;



        SqlDataAdapter da = new SqlDataAdapter(cmd);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

    }
    public void updateuserlist(string id, string coinname, string coinvolume, string coinboughtprice, string coinlimit)
    {

        DataTable dt = new DataTable();
        SqlConnection con = new SqlConnection(strcon);
        SqlCommand cmd = new SqlCommand("sp_updateuserlist", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add("@id", SqlDbType.VarChar, 50).Value = id;
        cmd.Parameters.Add("@coinname", SqlDbType.VarChar, 50).Value = coinname;
        cmd.Parameters.Add("@coinvolume", SqlDbType.VarChar, 50).Value = coinvolume;
        cmd.Parameters.Add("@coinboughtprice", SqlDbType.VarChar, 50).Value = coinboughtprice;
        cmd.Parameters.Add("@coinlimit", SqlDbType.VarChar, 50).Value = coinlimit;



        SqlDataAdapter da = new SqlDataAdapter(cmd);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();

    }

    #endregion
    #region redirects
    public void redirect(string to)
    {
        string url = HttpContext.Current.Request.Url.AbsolutePath;
        if (url == to)
        {
        }
        else
        {
            HttpContext.Current.Response.Redirect(to);
        }
    }
    public void checksessions(string to)
    {
        if (Session["user_id"] == null || Session["user_name"] == null)
        {
            // string url = HttpContext.Current.Request.Url.AbsolutePath;
            if (to == "/login")
            {
                //redirect(to);
            }
            else
            {
                redirecttologin();
            }
        }
        else
        {

            redirect(to);

        }
    }
    public void redirecttologin()
    {
        HttpContext.Current.Response.Redirect("~/login.aspx");
    }
    #endregion
    #region crypt
    public byte[] GetHash(string inputString)
    {
        HashAlgorithm algorithm = SHA256.Create();
        return algorithm.ComputeHash(Encoding.UTF8.GetBytes(inputString));
    }
    public string GetHashString(string inputString)
    {
        StringBuilder sb = new StringBuilder();
        foreach (byte b in GetHash(inputString))
            sb.Append(b.ToString("X2"));

        return sb.ToString();
    }
    public string encode(string inputString)
    {
        var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(inputString);
        return System.Convert.ToBase64String(plainTextBytes);
    }
    public string decode(string base64EncodedData)
    {
        var base64EncodedBytes = System.Convert.FromBase64String(base64EncodedData);
        return System.Text.Encoding.UTF8.GetString(base64EncodedBytes);
    }
    #endregion
}