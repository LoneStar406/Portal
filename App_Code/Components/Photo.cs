
namespace ASPNET.StarterKit.Portal
{
    /// <summary>
    /// Describes the Photo Object
    /// </summary>
    public class Photo
    {

        private int _id;
        private int _albumid;
        private string _caption;

        /// <summary>
        /// The Photo ID
        /// </summary>
        public int PhotoID { get { return _id; } }
        public int AlbumID { get { return _albumid; } }
        public string Caption { get { return _caption; } }

        public Photo(int id, int albumid, string caption)
        {
            _id = id;
            _albumid = albumid;
            _caption = caption;
        }

    }
}