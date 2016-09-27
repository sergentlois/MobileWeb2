<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="itsoftware.aspx.vb" Inherits="mis_itsoftware" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <!-- Button trigger modal -->
<button type="button" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">
  Add Software
</button>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">Add Software</h4>
      </div>
        <div class="modal-body">

          <!-- Update Panel AJAX -->


          <div class="form-group">
            <label for="dbcompany" class="control-label">Company</label>
              <asp:DropDownList ID="dbcompany" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="CompanyLong" DataValueField="Company"></asp:DropDownList>
          </div>
          <div class="form-group">
            <label for="dbStore" class="control-label">Store</label>
              <asp:DropDownList ID="dbStore" runat="server" CssClass="form-control"></asp:DropDownList>
          </div>
          <div class="form-group">
            <label for="txtaddress" class="control-label">Address</label>
              <asp:TextBox ID="txtaddress"  runat="server" CssClass="form-control"></asp:TextBox>
          </div>
          
          <br />
          <div class="form-group">
            <label for="txtbusiness" class="control-label">Business Name</label>
              <asp:TextBox ID="txtbusiness" runat="server" CssClass="form-control"></asp:TextBox>
          </div>
          <div class="form-group">
            <label for="registeredname" class="control-label">Registered Name</label>
              <asp:TextBox ID="registeredname" runat="server" CssClass="form-control"></asp:TextBox>
          </div>
           <div class="form-group">
            <label for="txtdateCorIssued" class="control-label">Date COR Issued</label>
               <asp:TextBox ID="txtdateCorIssued" runat="server" CssClass="form-control"></asp:TextBox>
          </div>
          <br />
           <div class="form-group">
            <label for="txtTerminal" class="control-label">Terminal Number</label>
               <asp:TextBox ID="txtTerminal" runat="server" CssClass="form-control"></asp:TextBox>
          </div>
           <div class="form-group">
            <label for="txtMachineID" class="control-label">Machine ID Number</label>
               <asp:TextBox ID="txtMachineID" runat="server" CssClass="form-control"></asp:TextBox>
          </div>
          <div class="form-group">
            <label for="txtsoftwarename" class="control-label">Software Name</label>
              <asp:TextBox ID="txtsoftwarename" runat="server" CssClass="form-control"></asp:TextBox>
          </div>
          <div class="form-group">
            <label for="txtsoftwareversion" class="control-label">Software Version</label>
              <asp:TextBox ID="txtsoftwareversion" runat="server" CssClass="form-control"></asp:TextBox>
          </div>
           <div class="form-group">
            <label for="txtPermitNumber" class="control-label">Permit Number</label>
               <asp:TextBox ID="txtPermitNumber" runat="server" CssClass="form-control"></asp:TextBox>
          </div>
           <br />
          <div class="form-group">
            <label for="txtTSGInstaller" class="control-label">TSG Installer</label>
              <asp:TextBox ID="txtTSGInstaller" runat="server" CssClass="form-control"></asp:TextBox>
          </div>
          <div class="form-group">
            <label for="txtTSGUpdater" class="control-label">TSG Updater of OR</label>
              <asp:TextBox ID="txtTSGUpdater" runat="server" CssClass="form-control"></asp:TextBox>
          </div>
           <div class="form-group">
            <label for="txtReportUtilityVersion" class="control-label">Repot Utility Version</label>
               <asp:TextBox ID="txtReportUtilityVersion" runat="server" CssClass="form-control"></asp:TextBox>
          </div>
          <div class="form-group">
              <asp:CheckBox ID="ckbEACCREG" runat="server" Text="Registers in EACCREG" />
              <asp:CheckBox ID="ckbESales" runat="server" Text="Registerd in E-Sales" />
          </div>
         
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

        <br />

    <p>
    </p>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Management_Info_SysConnectionString %>" SelectCommand="SELECT [CompanyLong], [Company] FROM [company]"></asp:SqlDataSource>
    </p>
 
</asp:Content>

