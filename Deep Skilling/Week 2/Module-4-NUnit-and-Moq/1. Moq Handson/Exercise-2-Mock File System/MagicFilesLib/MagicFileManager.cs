namespace MagicFilesLib
{
    public class MagicFileManager
    {
        private readonly IFileManager _fileManager;

        public MagicFileManager(IFileManager fileManager)
        {
            _fileManager = fileManager;
        }

        public string GetFileContent(string filePath)
        {
            return _fileManager.ReadFile(filePath);
        }
    }
}