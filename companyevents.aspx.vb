Imports System.IO

Partial Class companyevents
    Inherits System.Web.UI.Page

    
    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        'Load Title
        Try
            Using sr As New StreamReader("D:\Information_Management\MobileWeb\albums\" & Request.QueryString("album") & "\title.txt")
                Dim line As String
                line = sr.ReadToEnd()
                'Console.WriteLine(line)
                lblTitle.Text = line
            End Using
        Catch ex As Exception
            'Console.WriteLine("The file could not be read:")
            'Console.WriteLine(ex.Message)
        End Try

        'Load Description
        Try
            Using sr As New StreamReader("D:\Information_Management\MobileWeb\albums\" & Request.QueryString("album") & "\description.txt")
                Dim line As String
                line = sr.ReadToEnd()
                'Console.WriteLine(line)
                lblDesc.Text = line
            End Using
        Catch ex As Exception
            'Console.WriteLine("The file could not be read:")
            'Console.WriteLine(ex.Message)
        End Try
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        Try
            If Page.IsPostBack = False Then
                Repeater1.DataSource = GetPhotos()
                Repeater1.DataBind()
            End If
        Catch ex As Exception
            Response.Write("Album Not Found")

        End Try
    End Sub
    Function GetPhotos() As ArrayList
        Dim returnList As New ArrayList

        Dim diFiles As DirectoryInfo = New DirectoryInfo("D:\Information_Management\MobileWeb\albums\" & Request.QueryString("album") & "\")

        For Each File As FileInfo In diFiles.GetFiles("*.jpg")
            returnList.Add(Page.ResolveUrl("~/") & "albums/" & Request.QueryString("album") & "/" & Path.GetFileName(File.FullName))
        Next
        Return returnList
    End Function
End Class
