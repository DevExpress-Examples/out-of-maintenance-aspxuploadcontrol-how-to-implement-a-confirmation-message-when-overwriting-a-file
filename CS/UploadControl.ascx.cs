using DevExpress.Web.ASPxUploadControl;
using System.IO;
using System.Web;

namespace WebApplication1 {
    public partial class UploadControl : System.Web.UI.UserControl {

        protected void callback_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e) {
            e.Result = (File.Exists(Server.MapPath(Path.GetFileName(e.Parameter)))) ? "1" : "0";
        }

        protected void uploadCtrl_FileUploadComplete(object sender, DevExpress.Web.ASPxUploadControl.FileUploadCompleteEventArgs e) {
            UploadedFile file = e.UploadedFile;
            if (file.IsValid)
                file.SaveAs(Server.MapPath(file.FileName));
        }
    }
}