<%@ Control Language="vb" AutoEventWireup="true" CodeBehind="UploadControl.ascx.vb" Inherits="WebApplication1.UploadControl" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxCallback" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxUploadControl" TagPrefix="dx" %>

<script type="text/javascript">
	function OnUploadControlTextChanged(s, e) {
		callback.PerformCallback(uploadCtrl.GetText());
	}
	function OnFileUploadStart(s, e) {
		btnUpload.SetEnabled(false);
		btnUpload.SetText("Uploading...");
	}
	function OnFileUploadComplete(s, e) {
		btnUpload.SetEnabled(true);
		btnUpload.SetText("Upload");
	}

	function OnBtnUploadClick(s, e) {
		uploadCtrl.UploadFile();
	}
	function OnBtnOkClick(s, e) {
		popupConfirm.Hide();
		uploadCtrl.Upload();
	}
	function OnBtnCancelClick(s, e) {
		uploadCtrl.ClearText();
		popupConfirm.Hide();
	}

	function OnCallbackComplete(s, e) {
		if (e.result == '1') {
			popupConfirm.UpdatePosition();
			popupConfirm.Show();
		}
	}
</script>

<table>
	<tr>
		<td style="padding-right: 10px">
			<dx:ASPxUploadControl ID="uploadCtrl" runat="server" ClientInstanceName="uploadCtrl" Width="300px" OnFileUploadComplete="uploadCtrl_FileUploadComplete">
				<ClientSideEvents TextChanged="OnUploadControlTextChanged" FileUploadStart="OnFileUploadStart" FileUploadComplete="OnFileUploadComplete" />
			</dx:ASPxUploadControl>
		</td>
		<td>
			<dx:ASPxButton ID="btnUpload" runat="server" ClientInstanceName="btnUpload" AutoPostBack="false" Text="Upload">
				<ClientSideEvents Click="OnBtnUploadClick" />
			</dx:ASPxButton>
		</td>
	</tr>
</table>

<dx:ASPxPopupControl ID="popupConfirm" runat="server" ClientInstanceName="popupConfirm" HeaderText="Confirm overwrite" ShowCloseButton="false" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter">
	<ContentCollection>
		<dx:PopupControlContentControl runat="server" SupportsDisabledAttribute="True">
			<table style="width: 300px">
				<tr>
					<td colspan="2" style="width: 100%; text-align: center; padding-bottom: 10px;">
						<dx:ASPxLabel ID="lblConfirm" runat="server" Text="File Already Exists.  Do you want to overwrite it?" />
					</td>
				</tr>
				<tr>
					<td style="text-align: left">
						<dx:ASPxButton ID="btnOk" runat="server" ClientInstanceName="btnOk" AutoPostBack="false" Text="Ok" Width="100px">
							<ClientSideEvents Click="OnBtnOkClick" />
						</dx:ASPxButton>
					</td>
					<td style="text-align: right">
						<dx:ASPxButton ID="btnCancel" runat="server" ClientInstanceName="btnCancel" AutoPostBack="false" Text="Cancel" Width="100px">
							<ClientSideEvents Click="OnBtnCancelClick" />
						</dx:ASPxButton>
					</td>
				</tr>
			</table>
		</dx:PopupControlContentControl>
	</ContentCollection>

</dx:ASPxPopupControl>

<dx:ASPxCallback ID="callback" runat="server" ClientInstanceName="callback" OnCallback="callback_Callback">
	<ClientSideEvents CallbackComplete="OnCallbackComplete" />
</dx:ASPxCallback>
