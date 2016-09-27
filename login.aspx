<%@ Page Language="VB" AutoEventWireup="false" CodeFile="login.aspx.vb" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <title>Login - MIS Website</title>
    <style>
    .center {
        margin: auto;
        width: 20%;
        border:3px solid #D0D0D0;
        padding: 10px;
        min-width:300px;
        
    }
        body { 
             background: url("../images/background.jpg") no-repeat center center fixed;
            -webkit-background-size: cover;
            -moz-background-size: cover;
            -o-background-size: cover;
            background-size: cover;
        }

</style>
</head>
<body>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <form id="form1" runat="server">
    <!--  <div class="col-md-9" role="main"> -->
     <div class="center">
         <asp:Login ID="Login1" runat="server" CssClass="">
         <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
         <LoginButtonStyle  CssClass="btn-primary"/>
         <TextBoxStyle CssClass="form-control" />
          <TitleTextStyle/>
          </asp:Login>
     </div>
    </form>

</body>
</html>
