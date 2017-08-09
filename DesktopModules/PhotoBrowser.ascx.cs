using System;
using System.Text;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace ASPNET.StarterKit.Portal
{

    public partial class PhotoBrowser : ASPNET.StarterKit.Portal.PortalModuleControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool lbFirstRow = true;
            if (!IsPostBack)
            {
                StringBuilder lsbPhotoIDs = new StringBuilder();
                StringBuilder lsbPhotoCaptions = new StringBuilder();
                //string lsPhotoIDs = string.Empty;
                List<Photo> llist = PhotosDB.GetPhotos(1);
                IEnumerator liEnumerator = llist.GetEnumerator();
                while (liEnumerator.MoveNext())
                {
                    if (lbFirstRow)
                        lbFirstRow = false;
                    else
                    {
                        lsbPhotoIDs.Append("|");
                        lsbPhotoCaptions.Append("|");
                    }
                    Photo liPhoto = (Photo)liEnumerator.Current;
                    lsbPhotoIDs.Append(liPhoto.PhotoID);
                    lsbPhotoCaptions.Append(liPhoto.Caption);
                }
                StringBuilder lsbScript = new StringBuilder();
                lsbScript.Append("<script>LoadCaptions('" + lsbPhotoCaptions + "')<");
                lsbScript.Append("/");
                lsbScript.Append("script>");
                this.Page.RegisterStartupScript("arrayScript1", lsbScript.ToString());
                lsbScript = new StringBuilder();
                lsbScript.Append("<script>LoadIDs('" + lsbPhotoIDs + "')<");
                lsbScript.Append("/");
                lsbScript.Append("script>");
                this.Page.RegisterStartupScript("arrayScript2", lsbScript.ToString());
            }

        }

        protected void Page_Init(object sender, EventArgs e)
        {
            //
            // CODEGEN: This call is required by the ASP.NET Web Form Designer.
            //
            InitializeComponent();
        }

        #region Web Form Designer generated code
        ///		Required method for Designer support - do not modify
        ///		the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {

        }
        #endregion
        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item)
            {
                //if (imgPhoto.Visible == false)
                //{
                //    imgPhoto.Visible = true;

                //    imgPhoto.Src = @"desktopmodules\Handler.ashx?PhotoID=" + ((DataRowView)e.Item.DataItem).Row["PhotoID"].ToString() + ".&Size=L";
                //}
            }
        }
}
}
