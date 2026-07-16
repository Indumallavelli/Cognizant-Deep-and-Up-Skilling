namespace CustomerCommLib
{
    public class CustomerComm
    {
        private readonly IMailSender _mailSender;

        public CustomerComm(IMailSender mailSender)
        {
            _mailSender = mailSender;
        }

        public bool SendWelcomeMail(string email)
        {
            return _mailSender.SendMail(
                email,
                "Welcome",
                "Welcome to our application."
            );
        }
    }
}