
namespace ASPNET.StarterKit.Portal.PhotoAlbum
{
    /// <summary>
    /// Describes the Photo Object
    /// </summary>
    public class Photo
    {
        private int mId;
        private string mName;
        private string mDescription;

        /// <summary>
        /// Photo ID
        /// </summary>
        public int PhotoID { get { return mId; } }
        /// <summary>
        /// Photo Name
        /// </summary>
        public string Name { get { return mName; } }
        /// <summary>
        /// Photo Description
        /// </summary>
        public string Description { get { return mDescription; } }

        /// <summary>
        /// Loads a Photo
        /// </summary>
        /// <param name="lId"></param>
        /// <param name="lName"></param>
        /// <param name="lDescription"></param>
        public Photo(int lId, string lName, string lDescription)
        {
            mId = lId;
            mName = lName;
            mDescription = lDescription;
        }

    }
}