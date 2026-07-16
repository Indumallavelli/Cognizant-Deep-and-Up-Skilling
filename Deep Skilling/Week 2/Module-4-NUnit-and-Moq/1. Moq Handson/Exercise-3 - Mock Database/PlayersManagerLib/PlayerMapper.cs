namespace PlayersManagerLib
{
    public class PlayerMapper : IPlayerMapper
    {
        public bool IsPlayerNameExistsInDb(string name)
        {
            return false;
        }

        public void AddNewPlayerIntoDb(string name)
        {
            // Database logic would normally go here.
        }
    }
}