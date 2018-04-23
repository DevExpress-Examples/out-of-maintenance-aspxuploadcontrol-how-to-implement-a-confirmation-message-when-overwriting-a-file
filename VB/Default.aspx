<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="Default.aspx.vb" Inherits="._Default" %>

<%@ Register Src="~/UploadControl.ascx" TagPrefix="uc1" TagName="UploadControl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:UploadControl runat="server" ID="UploadControl" />
    </form>
</body>
</html>
