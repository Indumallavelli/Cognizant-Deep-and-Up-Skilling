using Moq;
using NUnit.Framework;
using CustomerCommLib;

namespace CustomerCommLib.Tests
{
    public class Tests
    {
        [Test]
        public void SendWelcomeMail_ReturnsTrue_WhenMailIsSent()
        {
            // Arrange
            var mockMailSender = new Mock<IMailSender>();

            mockMailSender
                .Setup(m => m.SendMail(
                    It.IsAny<string>(),
                    It.IsAny<string>(),
                    It.IsAny<string>()))
                .Returns(true);

            var customerComm = new CustomerComm(mockMailSender.Object);

            // Act
            bool result = customerComm.SendWelcomeMail("test@example.com");

            // Assert
            Assert.That(result, Is.True);
        }
    }
}