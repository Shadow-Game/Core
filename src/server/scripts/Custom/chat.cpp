//by SymbolixDEV https://github.com/SymbolixDEV
//GLobal chat for players...
#include "ScriptPCH.h"
#include "Chat.h"

/* Colors */
#define MSG_COLOR_WHITE  "|cffffffff"
#define MSG_COLOR_LIGHTBLUE "|cffADD8E6"

class chatcommand : public CommandScript
{
public:
    chatcommand() : CommandScript("Chat") { }
 
        ChatCommand* GetCommands() const
    {
        static ChatCommand IngameCommandTable[] =
        {
        { "Chat",           SEC_GAMEMASTER,         true,  &HandleChatCommand,                "", NULL },
        { NULL,             0,                  false, NULL,                              "", NULL }
        };
                 return IngameCommandTable;
    }
        static bool HandleChatCommand(ChatHandler * handler, const char * args)
    {
   if(!*args)
                        return false;
        char message[1024];
 
                if(handler->GetSession()->GetSecurity() >= SEC_PLAYER)
                {
                                  snprintf(message, 1024, "[Shadow-Game Chat][%s%s|r]: %s%s|r", MSG_COLOR_WHITE, handler->GetSession()->GetPlayer()->GetName().c_str(), MSG_COLOR_LIGHTBLUE, args);
                                sWorld->SendServerMessage(SERVER_MSG_STRING, message, NULL);
    }
  return true;
  }
};

void AddSC_chatcommand()
{
        new chatcommand;
}
