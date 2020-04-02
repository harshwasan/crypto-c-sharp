<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" MasterPageFile="Site.Master" Inherits="crypto.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Content1" runat="server">

        <div>

              <div class="col">
              
              <div class="row" style="padding: 1%">

                    <asp:Label class="col-sm-2 col-form-label" runat="server" ID="lbl_username">Username/ID</asp:Label>
                    <asp:TextBox runat="server" class="form-control" ID="txt_username"></asp:TextBox>


                </div>
              <div class="row" style="padding: 1%">

                    <asp:Label class="col-sm-2 col-form-label" runat="server" ID="Password" >Password</asp:Label>
                    <asp:TextBox runat="server" class="form-control" ID="txt_password" TextMode="Password" ></asp:TextBox>


                </div>
             <div class="row" style="padding: 1%">
                  <asp:Button runat="server" ID="btn_login" OnClick="btn_login_Click" class="site-btn" Text="Login" />
                      </div>
            <div class="row" style="padding: 1%">
                   <asp:Label class="col-sm-2 col-form-label" runat="server" ID="lbl_err"  ForeColor="Red">*Incorrect credentials</asp:Label>
                      </div>
                </div>
            <div class="col">
                 <div class="row" style="padding: 1%">

                    <asp:Label class="col-sm-2 col-form-label" runat="server" ID="lbl_su_username">Username/ID</asp:Label>
                    <asp:TextBox runat="server" class="form-control" ID="txt_su_username"></asp:TextBox>


                </div>
                  <div class="row" style="padding: 1%">

                    <asp:Label class="col-sm-2 col-form-label" runat="server" ID="lbl_su_email">Email-ID</asp:Label>
                    <asp:TextBox runat="server" class="form-control" ID="txt_su_email"></asp:TextBox>


                </div>

              <div class="row" style="padding: 1%">

                    <asp:Label class="col-sm-2 col-form-label" runat="server" ID="lbl_su_pass" >Password</asp:Label>
                    <asp:TextBox runat="server" class="form-control" ID="txt_su_pass" TextMode="Password" ></asp:TextBox>


                </div>
                  <div class="row" style="padding: 1%">
                  <asp:Button runat="server" ID="btn_su" OnClick="btn_su_Click" class="site-btn" Text="Sign-up" />
                      </div>
               <div class="row" style="padding: 1%">
                   <asp:Label class="col-sm-2 col-form-label" runat="server" ID="lbl_su_err"  ForeColor="Red">*Incorrect credentials</asp:Label>
                      </div>
                </div>

            </div>
                 
</asp:Content>
