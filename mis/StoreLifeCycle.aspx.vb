Imports System.Data
Imports System.Data.SqlClient
Imports System.IO
Imports AjaxControlToolkit
Imports System.Reflection

Partial Class mis_StoreLifeCycle
    Inherits System.Web.UI.Page
    Sub ReturnMessage(message As String, CssClass As String)
        Dim err As New CustomValidator
        err.IsValid = False
        err.ErrorMessage = message
        Page.Validators.Add(err)

        Dim mpContentPlaceHolder As ContentPlaceHolder
        mpContentPlaceHolder = _
            CType(Master.FindControl("ContentPlaceHolder1"),  _
            ContentPlaceHolder)
        If Not mpContentPlaceHolder Is Nothing Then
            Dim Validation As New ValidationSummary
            Validation = CType(mpContentPlaceHolder.FindControl("ValidationSummary1"), ValidationSummary)
            If Not Validation Is Nothing Then
                Validation.CssClass = CssClass '"alert alert-success"
            End If
        End If

    End Sub
    Sub Reset()
        Try
            txtAddress.Text = ""
            txtCOR.Text = ""
            txtEACCREG.Text = ""
            txtESALES.Text = ""
            txtOpening.Text = ""
            txtStoreType.Text = ""
            txtQVName.Text = ""
            txtDateAddedQV.Text = ""
            txtRelocated.Text = ""
        Catch ex As Exception
            ReturnMessage(ex.Message, "alert alert-danger")
        End Try
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        Try
            If Request.QueryString("item") = "" Then
                SQLInsertGeneral.Insert()
                ReturnMessage("Saved!", "alert alert-success")
                Reset()
            Else
                SQLInsertGeneral.Update()
                ReturnMessage("Changes Saved!", "alert alert-success")
            End If

        Catch ex As Exception
            ReturnMessage(ex.Message, "alert alert-danger")
        End Try
    End Sub

    Protected Sub GridView1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView1.SelectedIndexChanged
        Session("SelectedIndex") = GridView1.SelectedIndex
        Session("selectedkey") = GridView1.SelectedRow.Cells(1).Text
        Session("SelectedTabIndex") = GridView1.PageIndex

        'lblLogs.Visible = False
        'Session("UKey") = GridView2.SelectedRow.Cells(1).Text
        'Response.Redirect("contracts.aspx?item=" & GridView2.SelectedRow.Cells(1).Text)

        Dim isreadonly As PropertyInfo = GetType(System.Collections.Specialized.NameValueCollection).GetProperty("IsReadOnly", BindingFlags.Instance Or BindingFlags.NonPublic)
        ' make collection editable
        isreadonly.SetValue(Me.Request.QueryString, False, Nothing)
        ' remove
        'Me.Request.QueryString.Remove("search_query")
        Me.Request.QueryString.Set("item", GridView1.SelectedRow.Cells(1).Text)
        SetInfo()
    End Sub

    Sub SetInfo()
        Try

            Dim dvSql As DataView = DirectCast(SqlSet.Select(DataSourceSelectArguments.Empty), DataView)
            For Each drvSql As DataRowView In dvSql
                'txtdesc.Text = drvSql("Description").ToString()
                txtAddress.Text = drvSql("PhysicalAddress").ToString()
                txtCOR.Text = drvSql("COR").ToString()
                txtEACCREG.Text = drvSql("EACCREG_TR").ToString()
                txtESALES.Text = drvSql("ESALES_TR").ToString()
                txtOpening.Text = drvSql("StoreOpening").ToString()
                txtStoreType.Text = drvSql("StoreType").ToString()
                txtQVName.Text = drvSql("QlikviewName").ToString()
                txtDateAddedQV.Text = drvSql("QlikviewDateAdded").ToString()
                txtRelocated.Text = drvSql("Addtl").ToString()

              
            Next
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim isreadonly As PropertyInfo = GetType(System.Collections.Specialized.NameValueCollection).GetProperty("IsReadOnly", BindingFlags.Instance Or BindingFlags.NonPublic)
        ' make collection editable
        isreadonly.SetValue(Me.Request.QueryString, False, Nothing)
        ' remove
        Me.Request.QueryString.Remove("item")
        Me.Request.QueryString.Set("search_query", "%" & txtSearch.Text & "%")
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Me.Request.QueryString.Remove("item")
        Me.Request.QueryString.Set("search_query", "%%")
        Response.Redirect(HttpContext.Current.Request.Url.ToString(), True)
        Reset()

    End Sub
End Class
