using Moq;
using NUnit.Framework;
using MagicFilesLib;

namespace MagicFilesLib.Tests
{
    public class Tests
    {
        [Test]
        public void GetFileContent_ReturnsMockedContent()
        {
            // Arrange
            var mockFileManager = new Mock<IFileManager>();

            mockFileManager
                .Setup(f => f.ReadFile(It.IsAny<string>()))
                .Returns("This is a mocked file.");

            var manager = new MagicFileManager(mockFileManager.Object);

            // Act
            string result = manager.GetFileContent("sample.txt");

            // Assert
            Assert.That(result, Is.EqualTo("This is a mocked file."));
        }
    }
}