using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.IO;
using System.Web;
using System.Threading;
using ASPNET.StarterKit.Portal;

namespace ASPNET.StarterKit.Portal
{

    /// <summary>
    /// Summary description for PhotosDB
    /// </summary>
    public class PhotosDB
    {
        public PhotosDB()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public static Stream GetPhoto(int photoid, PhotoSize size)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]))
            {
                using (SqlCommand command = new SqlCommand("Portal_GetPhoto", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@PhotoID", photoid));
                    command.Parameters.Add(new SqlParameter("@Size", (int)size));
                    connection.Open();
                    object result = command.ExecuteScalar();
                    try
                    {
                        return new MemoryStream((byte[])result);
                    }
                    catch
                    {
                        return null;
                    }
                }
            }
        }

        public static Stream GetPhoto(PhotoSize size)
        {
            string path = HttpContext.Current.Server.MapPath("~/Images/");
            switch (size)
            {
                case PhotoSize.Small:
                    path += "placeholder-100.jpg";
                    break;
                case PhotoSize.Medium:
                    path += "placeholder-200.jpg";
                    break;
                case PhotoSize.Large:
                    path += "placeholder-600.jpg";
                    break;
                default:
                    path += "placeholder-600.jpg";
                    break;
            }
            return new FileStream(path, FileMode.Open, FileAccess.Read, FileShare.Read);
        }

        public static Stream GetFirstPhoto(int albumid, PhotoSize size)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]))
            {
                using (SqlCommand command = new SqlCommand("GetFirstPhoto", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@AlbumID", albumid));
                    command.Parameters.Add(new SqlParameter("@Size", (int)size));
                    bool filter = !(HttpContext.Current.User.IsInRole("Friends") || HttpContext.Current.User.IsInRole("Administrators"));
                    command.Parameters.Add(new SqlParameter("@IsPublic", filter));
                    connection.Open();
                    object result = command.ExecuteScalar();
                    try
                    {
                        return new MemoryStream((byte[])result);
                    }
                    catch
                    {
                        return null;
                    }
                }
            }
        }

        public static List<Photo> GetPhotos(int AlbumID)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]))
            {
                using (SqlCommand command = new SqlCommand("Portal_GetPhotos", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@AlbumID", AlbumID));
                    //bool filter = !(HttpContext.Current.User.IsInRole("Friends") || HttpContext.Current.User.IsInRole("Administrators"));
                   // command.Parameters.Add(new SqlParameter("@IsPublic", filter));
                    connection.Open();
                    List<Photo> list = new List<Photo>();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Photo temp = new Photo(
                                (int)reader["PhotoID"],
                                (int)reader["AlbumID"],
                                (string)reader["Caption"]);
                            list.Add(temp);
                        }
                    }
                    return list;
                }
            }


        }

        public List<Photo> GetPhotos()
        {
            return GetPhotos(GetRandomAlbumID());
        }

        public void AddPhoto(int AlbumID, string Caption, byte[] BytesOriginal)
        {
            string lsUserName = Thread.CurrentPrincipal.Identity.Name;
            if (lsUserName.Length < 1)
            {
                lsUserName = "unknown";
            }
            using (SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]))
            {
                using (SqlCommand command = new SqlCommand("Portal_AddPhoto", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@AlbumID", AlbumID));
                    command.Parameters.Add(new SqlParameter("@Caption", Caption));
                    command.Parameters.Add(new SqlParameter("@BytesOriginal", BytesOriginal));
                    command.Parameters.Add(new SqlParameter("@BytesFull", ResizeImageFile(BytesOriginal, 600)));
                    //command.Parameters.Add(new SqlParameter("@BytesPoster", ResizeImageFile(BytesOriginal, 198)));
                    command.Parameters.Add(new SqlParameter("@BytesThumb", ResizeImageFile(BytesOriginal, 100)));
                    command.Parameters.Add(new SqlParameter("@CreatedBy", lsUserName));
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        public void RemovePhoto(int PhotoID)
        {
            string lsUserName = Thread.CurrentPrincipal.Identity.Name;
            if (lsUserName.Length < 1)
            {
                lsUserName = "unknown";
            }
            using (SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]))
            {
                using (SqlCommand command = new SqlCommand("Portal_DeletePhoto", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@PhotoID", PhotoID));
                    command.Parameters.Add(new SqlParameter("@UpdatedBy", lsUserName));
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        public void EditPhoto(string Caption, int PhotoID)
        {
            string lsUserName = Thread.CurrentPrincipal.Identity.Name;
            if (lsUserName.Length < 1)
            {
                lsUserName = "unknown";
            }
            using (SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]))
            {
                using (SqlCommand command = new SqlCommand("Portal_UpdatePhoto", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@Caption", Caption));
                    command.Parameters.Add(new SqlParameter("@PhotoID", PhotoID));
                    command.Parameters.Add(new SqlParameter("@UpdatedBy", lsUserName));
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        // Album-Related Methods

        public List<Album> GetAlbums()
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]))
            {
                using (SqlCommand command = new SqlCommand("GetAlbums", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    bool filter = !(HttpContext.Current.User.IsInRole("Friends") || HttpContext.Current.User.IsInRole("Administrators"));
                    command.Parameters.Add(new SqlParameter("@IsPublic", filter));
                    connection.Open();
                    List<Album> list = new List<Album>();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Album temp = new Album(
                                (int)reader["AlbumID"],
                                (int)reader["NumberOfPhotos"],
                                (string)reader["Caption"],
                                (bool)reader["IsPublic"]);
                            list.Add(temp);
                        }
                    }
                    return list;
                }
            }
        }

        public void AddAlbum(string Caption, bool IsPublic)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]))
            {
                using (SqlCommand command = new SqlCommand("AddAlbum", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@Caption", Caption));
                    command.Parameters.Add(new SqlParameter("@IsPublic", IsPublic));
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        public void RemoveAlbum(int AlbumID)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]))
            {
                using (SqlCommand command = new SqlCommand("RemoveAlbum", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@AlbumID", AlbumID));
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        public void EditAlbum(string Caption, bool IsPublic, int AlbumID)
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]))
            {
                using (SqlCommand command = new SqlCommand("EditAlbum", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.Add(new SqlParameter("@Caption", Caption));
                    command.Parameters.Add(new SqlParameter("@IsPublic", IsPublic));
                    command.Parameters.Add(new SqlParameter("@AlbumID", AlbumID));
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        public int GetRandomAlbumID()
        {
            using (SqlConnection connection = new SqlConnection(ConfigurationSettings.AppSettings["connectionString"]))
            {
                using (SqlCommand command = new SqlCommand("GetNonEmptyAlbums", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    List<Album> list = new List<Album>();
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Album temp = new Album((int)reader["AlbumID"], 0, "", false);
                            list.Add(temp);
                        }
                    }
                    try
                    {
                        Random r = new Random();
                        return list[r.Next(list.Count)].AlbumID;
                    }
                    catch
                    {
                        return -1;
                    }
                }
            }
        }

        // Helper Functions

        private byte[] ResizeImageFile(byte[] imageFile, int targetSize)
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

        private Size CalculateDimensions(Size oldSize, int targetSize)
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

        public ICollection ListUploadDirectory()
        {
            DirectoryInfo d = new DirectoryInfo(System.Web.HttpContext.Current.Server.MapPath("~/Upload"));
            return d.GetFileSystemInfos("*.jpg");
        }
    }
}
