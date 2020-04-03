<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" MasterPageFile="Site.Master" Inherits="crypto.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content1" runat="server">
    <style>
          .hero-section {
                height: 1500px;
                padding-top: 260px;
                display: block;
                background-image: none !important;
                background-size:cover;
                background-color: #f3f7f9;
                background-position: right top;
                background-repeat:no-repeat;
                position: relative;
            }
    </style>
    <div  class="container"  style="height:100%;width:100%">
    <div class="border border-primary mx-auto" id="logindiv" runat="server" style="width:50%">
        <div class="m-3">
            <h5>Login</h5>
            <hr />
            <br />
            <div class="form-group">
          <asp:Label class="col-sm-2 col-form-label" runat="server" ID="lbl_username">Username/ID</asp:Label>
       <br />
                 <asp:TextBox runat="server" class="form-control" ID="txt_username"></asp:TextBox><br />
    </div>
    <div class="form-group">
           <asp:Label class="col-sm-2 col-form-label" runat="server" ID="Password">Password</asp:Label><br />
        <asp:TextBox runat="server" class="form-control" ID="txt_password" TextMode="Password"></asp:TextBox><br />

    </div>
          <asp:Button runat="server" ID="btn_login" OnClick="btn_login_Click" CssClass="btn btn-outline-primary small" Text="Login" />
            <asp:Button runat="server" ID="btnreg" OnClick="btnreg_Click" CssClass="btn btn-outline-primary small" Text="Sign-Up" /><br />
               <asp:Label class="col-sm-2 col-form-label" runat="server" ID="lbl_err" ForeColor="Red">*Incorrect credentials</asp:Label><br />
        </div>
    </div>
    
    <div id="register"  class="border border-primary mx-auto" runat="server" style="width:50%">
        <div class="m-3">
            <div class="form-group">
                <h5>Sign-Up</h5>
            <hr />
                <br />
          <asp:Label class="col-sm-2 col-form-label" runat="server" ID="lbl_su_username">Username/ID</asp:Label><br />
                            <asp:TextBox runat="server" class="form-control" ID="txt_su_username"></asp:TextBox><br />
    </div>
    <div class="form-group">
          
                            <asp:Label class="col-sm-2 col-form-label" runat="server" ID="lbl_su_email">Email-ID</asp:Label><br />
                            <asp:TextBox runat="server" class="form-control" ID="txt_su_email"></asp:TextBox><br />
    </div>
             <div class="form-group">
          
                            
                            <asp:Label class="col-sm-2 col-form-label" runat="server" ID="lbl_su_pass">Password</asp:Label><br />
                            <asp:TextBox runat="server" class="form-control" ID="txt_su_pass" TextMode="Password"></asp:TextBox><br />

    </div>
            <asp:Button runat="server" ID="Button1" OnClick="btn_su_Click" CssClass="btn btn-outline-primary small" Text="Sign-up" />
               <asp:Button runat="server" ID="havacc" OnClick="havacc_Click" CssClass="btn btn-outline-primary small" Text="Already have an account?" /><br />
                    <asp:Label class="col-sm-2 col-form-label" runat="server" ID="lbl_su_err" ForeColor="Red">*Incorrect credentials</asp:Label><br />
        </div>
    </div>
    

       </div>
    <br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
</asp:Content>
