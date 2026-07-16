using Moq;
using NUnit.Framework;
using PlayersManagerLib;

namespace PlayersManagerLib.Tests
{
    public class Tests
    {
        [Test]
        public void RegisterNewPlayer_ShouldCreatePlayer_WhenNameDoesNotExist()
        {
            // Arrange
            var mockPlayerMapper = new Mock<IPlayerMapper>();

            mockPlayerMapper
                .Setup(p => p.IsPlayerNameExistsInDb(It.IsAny<string>()))
                .Returns(false);

            mockPlayerMapper
                .Setup(p => p.AddNewPlayerIntoDb(It.IsAny<string>()));

            // Act
            Player player = Player.RegisterNewPlayer("Virat", mockPlayerMapper.Object);

            // Assert
            Assert.That(player, Is.Not.Null);
            Assert.That(player.Name, Is.EqualTo("Virat"));
            Assert.That(player.Age, Is.EqualTo(23));
            Assert.That(player.Country, Is.EqualTo("India"));
            Assert.That(player.NoOfMatches, Is.EqualTo(30));

            mockPlayerMapper.Verify(
                p => p.AddNewPlayerIntoDb("Virat"),
                Times.Once);
        }
    }
}