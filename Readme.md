<!-- default badges list -->
![](https://img.shields.io/endpoint?url=https://codecentral.devexpress.com/api/v1/VersionRange/128563376/13.1.4%2B)
[![](https://img.shields.io/badge/Open_in_DevExpress_Support_Center-FF7200?style=flat-square&logo=DevExpress&logoColor=white)](https://supportcenter.devexpress.com/ticket/details/E4647)
[![](https://img.shields.io/badge/📖_How_to_use_DevExpress_Examples-e9f6fc?style=flat-square)](https://docs.devexpress.com/GeneralInformation/403183)
<!-- default badges end -->
<!-- default file list -->
*Files to look at*:

* [Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/Default.aspx.vb))
* [UploadControl.ascx](./CS/UploadControl.ascx) (VB: [UploadControl.ascx](./VB/UploadControl.ascx))
* [UploadControl.ascx.cs](./CS/UploadControl.ascx.cs) (VB: [UploadControl.ascx.vb](./VB/UploadControl.ascx.vb))
<!-- default file list end -->
# ASPxUploadControl - How to implement a confirmation message when overwriting a file


<p>To implement this functionality, it is required to execute the following steps:</p><p>1) Add the <a href="http://documentation.devexpress.com/#AspNet/clsDevExpressWebASPxCallbackASPxCallbacktopic"><u>ASPxCallback</u></a> control onto the page; <br />
2) Handle the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxUploadControlScriptsASPxClientUploadControl_TextChangedtopic"><u>ASPxClientUploadControl.TextChanged Event</u></a>, which is raised on the client side when text within the control edit box is changed when the control has focus (as illustrated in the <a href="https://www.devexpress.com/Support/Center/p/E2531">E2531: How to force the ASPxUploadControl to upload a selected file(s) automatically</a> Code Central example); <br />
3) Perform a round-trip to the server via the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxCallbackScriptsASPxClientCallback_PerformCallbacktopic"><u>ASPxClientCallback.PerformCallback Method</u></a> (pass the selected file's name and data from <a href="http://documentation.devexpress.com/#AspNet/clsDevExpressWebASPxPopupControlASPxPopupControltopic"><u>ASPxPopupControl</u></a> as a parameter); <br />
4) Handle the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxCallbackASPxCallback_Callbacktopic"><u>ASPxCallback.Callback Event</u></a> and check if the selected file already exists on the server. Return the result to the client side via the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxCallbackCallbackEventArgs_Resulttopic"><u>e.Result</u></a> property; <br />
5) Handle the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxCallbackScriptsASPxClientCallback_CallbackCompletetopic"><u>ASPxClientCallback.CallbackComplete Event</u></a> and show a confirmation message if the file already exists; <br />
6) Call the <a href="http://documentation.devexpress.com/#AspNet/DevExpressWebASPxUploadControlScriptsASPxClientUploadControl_Uploadtopic"><u>ASPxClientUploadControl.Upload Method</u></a> to initiate upload of the specified file(s) to the web server memory.</p>

<br/>


