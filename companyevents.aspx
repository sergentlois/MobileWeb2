<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="companyevents.aspx.vb" Inherits="companyevents" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script src="lightbox/src/js/lightbox.js"></script>
    <h2><asp:Label ID="lblTitle" runat="server" Text="Label"></asp:Label></h2>
    <h4><asp:Label ID="lblDesc" runat="server" Text="Label"></asp:Label></h4>
    <br />
    <br />
     <br />
     <asp:Repeater id="Repeater1" runat="server">
        <ItemTemplate>
            <a data-lightbox="roadtrip" href='<%# Container.DataItem %>'>
                <asp:Image  id="Image1" Width="18%" alt="" ImageUrl='<%# Container.DataItem %>' Runat="server" />
            </a>
        </ItemTemplate>
        </asp:Repeater>  
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

