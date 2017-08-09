using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class DesktopModules_PhotoAdmin_PhotoLibraryEdit : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnAddPhoto_Click(object sender, EventArgs e)
    {
        try
        {
            lblReport.Visible = true;
            if (FileUpload1.HasFile)
            {
                // Get the name of the file to upload.
                string fileName = Server.HtmlEncode(FileUpload1.FileName);
                // Get the extension of the uploaded file.
                string extension = System.IO.Path.GetExtension(fileName);

                // Allow only files with .doc or .xls extensions
                // to be uploaded.
                if ((string.Compare(extension, ".jpeg", true) == 0) || (string.Compare(extension, ".jpg", true) == 0))
                {
                    System.IO.Stream myStream;
                    Int32 fileLen;
                    // Get the length of the file.
                    fileLen = FileUpload1.PostedFile.ContentLength;
                    // Create a byte array to hold the contents of the file.
                    Byte[] Input = new Byte[fileLen];

                    // Initialize the stream to read the uploaded file.
                    myStream = FileUpload1.FileContent;

                    // BBBBBBBBBBBRead the file into the byte array.
                    myStream.Read(Input, 0, fileLen);

                    ASPNET.StarterKit.Portal.PhotosDB photos = new ASPNET.StarterKit.Portal.PhotosDB();
                    photos.AddPhoto(1, "Hello World", Input);

                    lblReport.Text = "File " + FileUpload1.FileName + " Successfully uploaded";
                    //Refresh Grid
                    gvPhotos.DataBind();
                }
                else
                {
                    lblReport.Text = "Invalid File type. Currently only JPEGs are accepted";
                }
            }
            else
            {
                lblReport.Text = "No File Selected";
            }
        }
        catch (Exception ex)
        {
            lblReport.Text = ex.Message;
        }
    }
}
