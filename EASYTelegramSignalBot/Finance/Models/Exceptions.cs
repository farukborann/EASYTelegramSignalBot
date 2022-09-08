using System;
using System.Runtime.Serialization;

namespace EASYTelegramSignalBot.Finance.Models
{
    public class Exceptions
    {
        [Serializable]
        public class SymbolNotFoundException : Exception
        {
            public SymbolNotFoundException(string message) : base(message)
            {

            }

            protected SymbolNotFoundException(SerializationInfo info, StreamingContext context) : base(info, context)
            {

            }
        }
    }
}
