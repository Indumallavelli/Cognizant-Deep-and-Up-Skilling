namespace CustomerCommLib
{
    public interface IMailSender
    {
        bool SendMail(string to, string subject, string body);
    }
}