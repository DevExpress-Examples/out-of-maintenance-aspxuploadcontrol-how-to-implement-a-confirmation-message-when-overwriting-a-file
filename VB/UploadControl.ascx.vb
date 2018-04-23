Imports Microsoft.VisualBasic
Imports DevExpress.Web.ASPxUploadControl
Imports System.IO
Imports System.Web

Namespace WebApplication1
    Partial Public Class UploadControl
        Inherits System.Web.UI.UserControl

        Protected Sub callback_Callback(ByVal source As Object, ByVal e As DevExpress.Web.ASPxCallback.CallbackEventArgs)
            e.Result = If((File.Exists(Server.MapPath(Path.GetFileName(e.Parameter)))), "1", "0")
        End Sub

        Protected Sub uploadCtrl_FileUploadComplete(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs)
            Dim file As UploadedFile = e.UploadedFile

            If file.IsValid Then
                file.SaveAs(Server.MapPath(file.FileName))
            End If
        End Sub
    End Class
End Namespace