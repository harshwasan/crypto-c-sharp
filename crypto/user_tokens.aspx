<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user_tokens.aspx.cs" MasterPageFile="Site.Master" Inherits="crypto.user_tokens" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content1" runat="server">

    <div>
        <div>
            <asp:DropDownList ID="coinlistddl" runat="server"></asp:DropDownList>
            <asp:Label runat="server" ID="lbl_cost" Text="Notification Limit"></asp:Label>
            <asp:TextBox runat="server" ID="txt_cost"></asp:TextBox>
            <asp:Label runat="server" ID="lbl_boughtcost" Text="coin bought at"></asp:Label>
            <asp:TextBox runat="server" ID="txt_boughtcost"></asp:TextBox>
            <asp:Label runat="server" Text="Volume" ID="lbl_volume"></asp:Label>
            <asp:TextBox runat="server" ID="txt_vol"></asp:TextBox>
            <asp:HiddenField runat="server" ID="hiddenfield" />
            <asp:Button runat="server" ID="insertusercoin" Text="submit"  Visible="true" OnClick="insertusercoin_Click" />
            <asp:Button runat="server" ID="updateusercoin" Visible="false" Text="update" OnClick="updateusercoin_Click" />
             <asp:Button runat="server" ID="reset" Visible="false" Text="reset" OnClick="reset_Click" />
        </div>
        <style>
            .table-condensed tr th {
                color: #495057;
                background-color: #e9ecef;
                border-color: #dee2e6
            }
        </style>
        <div>
            <br/><br/><br/>

            <div class="responsive-table m-2">
                <asp:GridView runat="server" class="table table-condensed  " UseAccessibleHeader="true" GridLines="None" ID="gridview" AutoGenerateColumns="False" PageSize="13" OnRowCommand="grd_existingleads_RowCommand">
                    <Columns>
                        <asp:TemplateField HeaderText="Sr No">

                            <ItemTemplate>
                                <%#Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Coin">
                            <ItemTemplate>
                                <asp:Label ID="Coin" runat="server"
                                    Text='<%# Bind("coinname") %>'></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Cost you bought at">
                            <ItemTemplate>
                                <asp:Label ID="cost_you_bought_at" runat="server"
                                    Text='<%# Bind("costboughtat")  %>'></asp:Label>
                            </ItemTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Volume Owned">
                            <ItemTemplate>
                                <asp:Label ID="Vol_owned" runat="server"
                                    Text='<%# Bind("volume") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Notification limit">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="notification_limi" Text='<%# Bind("cost") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HiddenField runat="server" ID="hdnfld" Value='<%# Bind("id") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>


                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:Button runat="server" ID="edit" Text="edit" CommandArgument="<%# Container.DataItemIndex %>" />
                                <%--<asp:Button runat="server" ID="Button1" Text="edit" CommandArgument="<%# Eval("id") %>"  />--%>
                            </ItemTemplate>


                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>


            <%--  <div class="col">
                <div class="row" style="padding: 1%">--%>

            <asp:Label class="col-sm-2 col-form-label" runat="server" ID="lbl_welcome"></asp:Label>
            <div class="responsive-table m-2">
                <table id="table" class="table main-table">


                    <thead class="thead-light">
                        <tr>
                            <th scope="col">Sr.no</th>
                            <th scope="col">Name</th>
                            <th scope="col">Price</th>
                        </tr>
                    </thead>
                    <tbody class="table-body">
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <%--   </div>


    </div>--%>

    <script src="scripts/jquery-3.3.1.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <%--<script src="js/main.js"></script>--%>
    <script type="text/javascript">

        $(document).ready(() => {
            $.ajax({
                type: 'GET',
                url: 'https://api.nomics.com/v1/currencies/ticker?key=5481aac3a6152007bb6524f6ddfa6d40&ids=BTC,ETH,USDT,MKR,FTXTOKEN,REP,DX,CPX,FSN,IOST,ENG,ENJ,REQ&interval=1d',
                success: function (data) {
                    $.each(data, function (key, value) {
                        debugger;
                        $(".table-body").append(
                            "<tr><td>" + (key + 1) + "</td><td><a class='link" + key + "'><img style='width:16px;height:16px;' src=" + value['logo_url'] + " > " + value['name'] + "</a></td><td id=" + key + " >$" + value['price'] + "</td></tr>"
                        );
                        $(".link" + key).attr('href', "token_view?symbol=" + value['symbol']);
                    });
                },
            })
        });
    </script>

</asp:Content>
