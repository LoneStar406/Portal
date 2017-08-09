
namespace ASPNET.StarterKit.Portal.PhotoAlbum
{
    /// <summary>
    /// Describes the Album Object
    /// </summary>
    public class Album
    {

        private int mId;
        private string mName;
        private string mDescription;
        private Photo mTitlePhoto;
        /// <summary>
        /// Album ID
        /// </summary>
        public int AlbumID { get { return mId; } }
        /// <summary>
        /// Album Name
        /// </summary>
        public string Name { get { return mName; } }
        /// <summary>
        /// Album Description
        /// </summary>
        public string Description { get { return mDescription; } }
        /// <summary>
        /// The title photo of the album
        /// </summary>
        public Photo TitlePhoto { get { return mTitlePhoto; } }


        /// <summary>
        /// Loads an Album
        /// </summary>
        /// <param name="lId"></param>
        /// <param name="lName"></param>
        /// <param name="lDescription"></param>
        public Album(int lId, string lName, string lDescription)
        {
            mId = lId;
            mName = lName;
            mDescription = lDescription;
        }
        /// <summary>
        /// Loads an Album with a title photo
        /// </summary>
        /// <param name="lId"></param>
        /// <param name="lName"></param>
        /// <param name="lDescription"></param>
        public Album(int lId, string lName, string lDescription, Photo lTitlePhoto)
        {
            mId = lId;
            mName = lName;
            mDescription = lDescription;
            mTitlePhoto = lTitlePhoto;
        }
    }
}

