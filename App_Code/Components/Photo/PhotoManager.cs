using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Web;

namespace ASPNET.StarterKit.Portal.PhotoAlbum
{
    public class PhotoManager
    {
        //Retrieve All Photos - Admin Only
        //Retrieve All Albums - Admin Only
        //Retrieve All Photos for Album - Admin Or User restricted
        //Add Photo - Admin Only
        public bool AddPhoto(string lsName, string lsDescription, string lsTags, byte[] lbBytesOriginal)
        {
            //PhotoBO.PhotosDataTable.
return true;
        }
        //Add Album - Admin Only
        //Add Photo to Album - Admin Only
        //Add Album to Module - Admin Only
        //Delete Photo - Admin Only
        //Delete Album - Admin Only
        //Delete Photo From Album - Admin Only
        //Delete Album from Module - Admin Only
        //Retrieve All Albums for a module
        public void AddAlbumToModule(int liModuleID, int liAlbumID)
        {
            PhotoBOTableAdapters.AlbumsModulesTableAdapter lAdapter = new PhotoBOTableAdapters.AlbumsModulesTableAdapter();
            string lsName = HttpContext.Current.User.Identity.Name;
            lAdapter.Insert(liAlbumID, liModuleID, true, 15, DateTime.Now, 15, DateTime.Now);
        }


        // Helper Functions

        private static byte[] ResizeImageFile(byte[] imageFile, int targetSize)
        {
            using (System.Drawing.Image oldImage = System.Drawing.Image.FromStream(new MemoryStream(imageFile)))
            {
                Size newSize = CalculateDimensions(oldImage.Size, targetSize);
                using (Bitmap newImage = new Bitmap(newSize.Width, newSize.Height, PixelFormat.Format24bppRgb))
                {
                    using (Graphics canvas = Graphics.FromImage(newImage))
                    {
                        canvas.SmoothingMode = SmoothingMode.AntiAlias;
                        canvas.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        canvas.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        canvas.DrawImage(oldImage, new Rectangle(new Point(0, 0), newSize));
                        MemoryStream m = new MemoryStream();
                        newImage.Save(m, ImageFormat.Jpeg);
                        return m.GetBuffer();
                    }
                }
            }
        }

        private static Size CalculateDimensions(Size oldSize, int targetSize)
        {
            Size newSize = new Size();
            if (oldSize.Height > oldSize.Width)
            {
                newSize.Width = (int)(oldSize.Width * ((float)targetSize / (float)oldSize.Height));
                newSize.Height = targetSize;
            }
            else
            {
                newSize.Width = targetSize;
                newSize.Height = (int)(oldSize.Height * ((float)targetSize / (float)oldSize.Width));
            }
            return newSize;
        }
    }
}