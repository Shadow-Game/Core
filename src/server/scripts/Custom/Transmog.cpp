class ArenaVender_npc : public CreatureScript
{
public:
    ArenaVender_npc() : CreatureScript("ArenaVender") { }
	
	bool OnGossipHello(Player* player, Creature* creature)
	{
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Arena Tier 1", GOSSIP_SENDER_MAIN, 1);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Arena Tier 2", GOSSIP_SENDER_MAIN, 2);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Arena Tier 3", GOSSIP_SENDER_MAIN, 3);
        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Arena Weapons", GOSSIP_SENDER_MAIN, 4);
        player->SEND_GOSSIP_MENU(1, creature->GetGUID());
	    return true;
	}
	
	bool OnGossipSelect(Player* player, Creature* creature, uint32 /* sender */, uint32 actions)
	{
	    player->PlayerTalkClass->ClearMenus();
		
		switch (actions)
		{
            /* put venders here */
            case 1: // Rinse and Repeat
                player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "19739", GOSSIP_SENDER_MAIN, 1);// derpo
                player->SEND_GOSSIP_MENU(1, creature->GetGUID());
                break;
            case 2:
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "500047", GOSSIP_SENDER_MAIN, 1);
                player->SEND_GOSSIP_MENU(1, creature->GetGUID());
                break;
			case 3:
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "500042", GOSSIP_SENDER_MAIN, 1);
                player->SEND_GOSSIP_MENU(1, creature->GetGUID());
				break;
			case 4:
				player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "50094", GOSSIP_SENDER_MAIN, 1);
                player->SEND_GOSSIP_MENU(1, creature->GetGUID());
				break;
        }
        return true;
    }
};

void AddSC_ArenaVender_npc()
{
    new ArenaVender_npc();
}