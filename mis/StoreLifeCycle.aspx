<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="StoreLifeCycle.aspx.vb" Inherits="mis_StoreLifeCycle" %>

<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="row">
        <div class="form-group col-md-3">
        </div>
        <div class="form-group col-md-6">
            <div class="input-group">
                <asp:TextBox ID="txtSearch" runat="server" class="form-control" placeholder="Search for..."></asp:TextBox>
                <span class="input-group-btn">
                    <asp:Button ID="Button2" runat="server" Text="Go" class="btn btn-default" />
                </span>
            </div>
            <!-- /input-group -->
        </div>
    </div>
   
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" CellPadding="4" CssClass="table table-striped table-hover" DataSourceID="SqlSearch0" EnableModelValidation="True" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    </asp:GridView>
   
    <br />
    <br />
    <div class="row">
        <div class="form-group col-md-2">
            <asp:Button ID="Button3" runat="server" Text="Create New" CssClass="btn btn-primary" />
        </div>
    </div>
    <h4>General</h4>
    <hr />
    
    <div class="row">
        <div class="form-group col-md-3">
            <label for="dbcompany" class="control-label">Company</label>
        <asp:DropDownList ID="dbcompany" runat="server" CssClass="form-control" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="CompanyLong" DataValueField="Company"></asp:DropDownList>
        </div>
        <div class="form-group col-md-3">
            <label for="dbStore" class="control-label">Store</label>
            <asp:DropDownList ID="dbStore" runat="server" CssClass="form-control" DataSourceID="SqlStore" DataTextField="storename" DataValueField="storename"></asp:DropDownList>
        </div>
    </div>
    <div class="row">
        <div class="col-md-9">
            <label for="txtAddress">Address</label>
            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
     </div> 
      <div class="row">
        <div class="col-md-3">
            <label for="txtCOR">COR</Label>
            <asp:TextBox ID="txtCOR" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-3">
            <label for="txtEACCREG">EACCREG TR</Label>
            <asp:TextBox ID="txtEACCREG" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-3">
            <label for="txtESALES">ESALES TR</Label>
            <asp:TextBox ID="txtESALES" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <label for="txtOpening">Store Opening</Label>
            <asp:TextBox ID="txtOpening" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-3">
            <label for="txtStoreType">Type of Store</Label>
            <asp:TextBox ID="txtStoreType" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-3">
            <label for="txtQVName">Qlikview Name</Label>
            <asp:TextBox ID="txtQVName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
        <div class="col-md-3">
            <label for="txtDateAddedQV">Date Added to QV</Label>
            <asp:TextBox ID="txtDateAddedQV" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
    <div class="row">
        <div class="col-md-3">
            <label for="txtBRelocated">Relocated</Label>
            <asp:DropDownList ID="txtBRelocated" runat="server" CssClass="form-control">
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Yes</asp:ListItem>
            </asp:DropDownList>
        </div>
        <div class="col-md-9">
            <label for="txtRelocated">New Address</Label>
            <asp:TextBox ID="txtRelocated" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
    </div>
   
    <br />
    <h4>Connectivity</h4>
    <hr />

    <br />
    <h4>Corporate Accounts</h4>
    <hr />

    <br />
    <h4>Asset List</h4>
    <hr />
    <div class="row">
        <div class="col-md-10">
            
        </div>
        <div class="col-md-2">
            <asp:Button ID="Button1" runat="server" Text="Save" class="btn btn-info" />
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Management_Info_SysConnectionString %>" SelectCommand="SELECT [CompanyLong], [Company] FROM [company]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlStore" runat="server" ConnectionString="<%$ ConnectionStrings:Management_Info_SysConnectionString %>" SelectCommand="SELECT [storename] FROM [stores] WHERE ([company] = @company)">
        <SelectParameters>
            <asp:ControlParameter ControlID="dbcompany" Name="company" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SQLInsertGeneral" runat="server" ConnectionString="<%$ ConnectionStrings:Management_Info_SysConnectionString %>" DeleteCommand="DELETE FROM [slc_general] WHERE [SLC_ID] = @SLC_ID" InsertCommand="INSERT INTO [slc_general] ([CompanyCode], [StoreName], [PhysicalAddress], [COR], [EACCREG_TR], [ESALES_TR], [StoreOpening], [QlikviewName], [StoreType], [Relocated], [Addtl], [UploadedBy], [QlikviewDateAdded]) VALUES (@CompanyCode, @StoreName, @PhysicalAddress, @COR, @EACCREG_TR, @ESALES_TR, @StoreOpening, @QlikviewName, @StoreType, @Relocated, @Addtl, @UploadedBy, @QlikviewDateAdded)" SelectCommand="SELECT SLC_ID, CompanyCode, StoreName, PhysicalAddress, COR, EACCREG_TR, ESALES_TR, StoreOpening, QlikviewName, StoreType, Relocated, Addtl, UploadedBy, QlikviewDateAdded FROM slc_general WHERE (SLC_ID = @SLC_ID)" UpdateCommand="UPDATE slc_general SET CompanyCode = @CompanyCode, StoreName = @StoreName, PhysicalAddress = @PhysicalAddress, COR = @COR, EACCREG_TR = @EACCREG_TR, ESALES_TR = @ESALES_TR, StoreOpening = @StoreOpening, QlikviewName = @QlikviewName, StoreType = @StoreType, Relocated = @Relocated, Addtl = @Addtl, UploadedBy = @UploadedBy, QlikviewDateAdded = @QlikviewDateAdded WHERE (SLC_ID = @SLC_ID)">
        <DeleteParameters>
            <asp:Parameter Name="SLC_ID" Type="Int64" />
        </DeleteParameters>
        <InsertParameters>
            <asp:ControlParameter ControlID="dbcompany" Name="CompanyCode" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="dbStore" Name="StoreName" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="txtAddress" Name="PhysicalAddress" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtCOR" Name="COR" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEACCREG" Name="EACCREG_TR" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtESALES" Name="ESALES_TR" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtOpening" Name="StoreOpening" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtQVName" Name="QlikviewName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtStoreType" Name="StoreType" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtBRelocated" Name="Relocated" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="txtRelocated" Name="Addtl" PropertyName="Text" Type="String" />
            <asp:Parameter DefaultValue="NONE" Name="UploadedBy" Type="String" />
            <asp:ControlParameter ControlID="txtDateAddedQV" DefaultValue="" Name="QlikviewDateAdded" PropertyName="Text" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:ControlParameter ControlID="dbcompany" Name="CompanyCode" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="dbStore" Name="StoreName" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="txtAddress" Name="PhysicalAddress" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtCOR" Name="COR" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtEACCREG" Name="EACCREG_TR" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtESALES" Name="ESALES_TR" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtOpening" Name="StoreOpening" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtQVName" Name="QlikviewName" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtStoreType" Name="StoreType" PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="txtBRelocated" Name="Relocated" PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="txtRelocated" Name="Addtl" PropertyName="Text" Type="String" />
            <asp:Parameter Name="UploadedBy" Type="String" DefaultValue="NONE" />
            <asp:ControlParameter ControlID="txtDateAddedQV" DefaultValue="" Name="QlikviewDateAdded" PropertyName="Text" Type="String" />
            <asp:QueryStringParameter Name="SLC_ID" QueryStringField="item" Type="Int64" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlSearch0" runat="server" ConnectionString="<%$ ConnectionStrings:Management_Info_SysConnectionString %>" SelectCommand="sp_FindStringInTable" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:Parameter DefaultValue="" Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
            <asp:QueryStringParameter DefaultValue="%%" Name="stringToFind" QueryStringField="search_query" Type="String" />
            <asp:Parameter DefaultValue="%%" Name="author" Type="String" />
            <asp:Parameter DefaultValue="1000" Name="limit" Type="String" />
            <asp:Parameter DefaultValue="SLC_ID,CompanyCode,StoreName,StoreOpening,QlikviewName,StoreType" Name="tableslist" Type="String" />
            <asp:Parameter DefaultValue="dbo" Name="schema" Type="String" />
            <asp:Parameter DefaultValue="slc_general" Name="table" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
        
    <asp:SqlDataSource ID="SqlSet" runat="server" ConnectionString="<%$ ConnectionStrings:Management_Info_SysConnectionString %>" SelectCommand="SELECT * FROM [slc_general] WHERE ([SLC_ID] = @SLC_ID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="SLC_ID" QueryStringField="item" Type="Int64" />
        </SelectParameters>
    </asp:SqlDataSource>
        
</asp:Content>

