#include "ScriptPCH.h"
#include "ScriptedGossip.h"

uint32 buffIdstools[] = { 43223, 5862, 33377, 33779, 31305, 70692, 42995 };

class npc_tools : public CreatureScript
{
public:
	npc_tools() : CreatureScript("npc_tool_spawn") { }

	bool OnGossipHello(Player *player, Creature *creature)
	{
		player->PlayerTalkClass->ClearMenus();

		if (player->IsInCombat())
		 {
			player->PlayerTalkClass->SendCloseGossip();
			 creature->MonsterSay("You are in combat!", LANG_UNIVERSAL, NULL);
			 return true;
		}
		if (player->GetMap()->IsBattlegroundOrArena())
		{
			player->PlayerTalkClass->SendCloseGossip();
			creature->MonsterSay("You can't summon trainers while in battleground or Arena!", LANG_UNIVERSAL, NULL);
			return true;
		}
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "PVP"                  , GOSSIP_SENDER_MAIN, 14);
		player->ADD_GOSSIP_ITEM(ICON_POI_BLUETOWER, "Mall"                 , GOSSIP_SENDER_MAIN, 11);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Events Mall"             , GOSSIP_SENDER_MAIN, 22);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Trolling tavern"         , GOSSIP_SENDER_MAIN, 25);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "World Bosses"            , GOSSIP_SENDER_MAIN, 24);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "Gearing Dungeons"     , GOSSIP_SENDER_MAIN, 15);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "Starter area"         , GOSSIP_SENDER_MAIN, 23);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Tools"                   , GOSSIP_SENDER_MAIN, 12);
		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Nevermind."             , GOSSIP_SENDER_MAIN, 2);
		player->PlayerTalkClass->SendGossipMenu(85004, creature->GetGUID());
		return true;
	}

	bool OnGossipSelect(Player *player, Creature *creature, uint32 sender, uint32 action)
	{
      player->PlayerTalkClass->ClearMenus();

		switch(action)
		{
		case 1:
			switch(player->getClass())
			{
			case CLASS_DEATH_KNIGHT:
				if(player->GetTeam() == HORDE)
				{
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(28474,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
				creature->MonsterWhisper("You got your trainer, i must say farewell..", false);
				creature->DisappearAndDie();
				}
				else
				{
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(28474,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
				creature->MonsterWhisper("You got your trainer, i must say farewell..", false);
				creature->DisappearAndDie();
				}
				break;

			case CLASS_DRUID: // 5505
				if(player->GetTeam() == HORDE)
				{
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(12042,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
				creature->MonsterWhisper("You got your trainer, i must say farewell..", false);
				creature->DisappearAndDie();
			    }
			    else
			    {
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(5505,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
				creature->MonsterWhisper("You got your trainer, i must say farewell..", false);
				creature->DisappearAndDie();
				}
				break;

			case CLASS_HUNTER:// 5516
				if(player->GetTeam() == HORDE)
				{
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(3406,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
				creature->MonsterWhisper("You got your trainer, i must say farewell..", false);
				creature->DisappearAndDie();
				}
				else
				{
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(5516,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
				creature->MonsterWhisper("You got your trainer, i must say farewell..", false);
				creature->DisappearAndDie();
				}
				break;

			case CLASS_MAGE: // 5497
				if(player->GetTeam() == HORDE)
				{
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(5882,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
				creature->MonsterWhisper("You got your trainer, i must say farewell..", false);
				creature->DisappearAndDie();
				}
				else
				{
                player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(5497,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
				creature->MonsterWhisper("You got your trainer, i must say farewell..", false);
				creature->DisappearAndDie();
				}
				break;

			case CLASS_PALADIN: // 5492
				if(player->GetTeam() == HORDE)
				{
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(20406,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
				creature->MonsterWhisper("You got your trainer, i must say farewell..", false);
				creature->DisappearAndDie();
				}
				else
				{
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(5492,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
				creature->MonsterWhisper("You got your trainer, i must say farewell..", false);
				creature->DisappearAndDie();
				}
				break;

			case CLASS_PRIEST: // 11397
				if(player->GetTeam() == HORDE)
				{
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(6018,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
				creature->MonsterWhisper("You got your trainer, i must say farewell..", false);
				creature->DisappearAndDie();
				}
				else
				{
			    player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(11397,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
				creature->MonsterWhisper("You got your trainer, i must say farewell..", false);
				creature->DisappearAndDie();
				}
				break;

			case CLASS_ROGUE://918
				if(player->GetTeam() == HORDE)
				{
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(3327,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
				creature->MonsterWhisper("You got your trainer, i must say farewell..", false);
				creature->DisappearAndDie();
				}
				else
				{
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(918,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
				creature->MonsterWhisper("You got your trainer, i must say farewell..", false);
				creature->DisappearAndDie();
				}
				break;

			case CLASS_SHAMAN:// 20407
				if(player->GetTeam() == HORDE)
				{
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(3344,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
				creature->MonsterWhisper("You got your trainer, i must say farewell..", false);
				creature->DisappearAndDie();
				}
				else
				{
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(20407,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
				creature->MonsterWhisper("You got your trainer, i must say farewell..", false);
				creature->DisappearAndDie();
				}
				break;

			case CLASS_WARLOCK:// 5495
				if(player->GetTeam() == HORDE)
				{
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(3325,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
				creature->MonsterWhisper("You got your trainer, i must say farewell..", false);
				creature->DisappearAndDie();
				}
				else
				{
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(5495,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
				creature->MonsterWhisper("You got your trainer, i must say farewell..", false);
				creature->DisappearAndDie();
				}
				break;

			case CLASS_WARRIOR:
				if(player->GetTeam() == HORDE)
				{
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(4593,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
				creature->MonsterWhisper("You got your trainer, i must say farewell..", false);
				creature->DisappearAndDie();
                }

				else
				{
				player->PlayerTalkClass->SendCloseGossip();
				player->SummonCreature(5479,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
				creature->MonsterWhisper("You got your trainer, i must say farewell..", false);
				creature->DisappearAndDie();
				}
				break;
			}
			break;
		case 3:
			player->GetSession()->SendShowBank(creature->GetGUID());
			break;
		case 4:
			for (int i = 0; i < sizeof(buffIdstools) / sizeof(*buffIdstools); i++)
            player->CastSpell(player, buffIdstools[i]);
			player->CLOSE_GOSSIP_MENU();
			break;
        case 5: // Reset Instances
                for (uint8 i = 0; i < MAX_DIFFICULTY; ++i)
                {
                        Player::BoundInstancesMap &binds = player->GetBoundInstances(Difficulty(i));
                        for (Player::BoundInstancesMap::iterator itr = binds.begin(); itr != binds.end();)
                        {
                                player->UnbindInstance(itr, Difficulty(i));
                        }
                }
                player->CLOSE_GOSSIP_MENU();
            break;
        case 7: // Reset Combat
                player->CombatStop();
                player->CLOSE_GOSSIP_MENU();
            break;
        case 8: // Remove Sickness
                if(player->HasAura(15007))
                player->RemoveAura(15007);
                player->CLOSE_GOSSIP_MENU();
            break;
        case 9: // Repair Items
            player->DurabilityRepairAll(false, 0, false);
            player->CLOSE_GOSSIP_MENU();
            break;
		case 2:
			creature->MonsterWhisper("Please come again.", false);
			player->CLOSE_GOSSIP_MENU();
			creature->DisappearAndDie();
		    break;
		case 10:
			// teleport to home location
			player->TeleportTo(player->m_homebindMapId, player->m_homebindX, player->m_homebindY, player->m_homebindZ, player->GetOrientation());
			player->CLOSE_GOSSIP_MENU();
			break;
		case 11:
			//mall
			player->TeleportTo(530, -2720.090088f, 8333.089844f, -80.789803f, 4.684850f);
			player->CLOSE_GOSSIP_MENU();
			break;
		case 12:
			player->PlayerTalkClass->SendCloseGossip();
			player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "Transmog Me!"                  , GOSSIP_SENDER_MAIN, 28);
		    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "Buff Me"                       , GOSSIP_SENDER_MAIN, 4);
		    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "Reset Instances"               , GOSSIP_SENDER_MAIN, 5);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "Reset Combat"                  , GOSSIP_SENDER_MAIN, 7);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "Remove Sickness"               , GOSSIP_SENDER_MAIN, 8);
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_INTERACT_1, "Repair Items"                  , GOSSIP_SENDER_MAIN, 9);
		    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "Spawn Class Trainer" 	            , GOSSIP_SENDER_MAIN, 1);
			player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "Spawn Titles npc" 	            , GOSSIP_SENDER_MAIN, 20);
			player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TRAINER, "Spawn Enchate npcr" 	            , GOSSIP_SENDER_MAIN, 21);
		    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_TAXI, "Go to Home location"                 , GOSSIP_SENDER_MAIN, 10);
		    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Bank"                           , GOSSIP_SENDER_MAIN, 3);
		    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "<- Back <-"                          , GOSSIP_SENDER_MAIN, 13);
		    player->PlayerTalkClass->SendGossipMenu(85005, creature->GetGUID());
		    break;
		case 13:
			//main menu
		    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "PVP"                  , GOSSIP_SENDER_MAIN, 14);
		    player->ADD_GOSSIP_ITEM(ICON_POI_BLUETOWER, "Mall"                 , GOSSIP_SENDER_MAIN, 11);
		    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Events Mall"             , GOSSIP_SENDER_MAIN, 22);
	    	player->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Trolling tavern"         , GOSSIP_SENDER_MAIN, 25);
		    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "World Bosses"            , GOSSIP_SENDER_MAIN, 24);
		    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "Gearing Dungeons"     , GOSSIP_SENDER_MAIN, 15);
		    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "Starter area"         , GOSSIP_SENDER_MAIN, 23);
    		player->ADD_GOSSIP_ITEM(GOSSIP_ICON_DOT, "Tools"                   , GOSSIP_SENDER_MAIN, 12);
		    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Nevermind."             , GOSSIP_SENDER_MAIN, 2);
			break;
		case 14:
			if (player->GetTeam() == HORDE)
			{
			// add horde pvp stuff here...
			player->PlayerTalkClass->SendCloseGossip();
			player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "DireMaul"                      , GOSSIP_SENDER_MAIN, 16);
			player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "Gurubashi"                     , GOSSIP_SENDER_MAIN, 17);
	        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "Horde Duel area"               , GOSSIP_SENDER_MAIN, 18);
	        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Nevermind."               	    , GOSSIP_SENDER_MAIN, 2);
	        player->PlayerTalkClass->SendGossipMenu(85007, creature->GetGUID());
			}
			else
			{
			// add alliance pvp stuff here...
			player->PlayerTalkClass->SendCloseGossip();
		    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "DireMaul"                      , GOSSIP_SENDER_MAIN, 16);
		    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "Gurubashi"                     , GOSSIP_SENDER_MAIN, 17);
	        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_BATTLE, "Ally Duel area"                , GOSSIP_SENDER_MAIN, 19);
	        player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "Nevermind."               	    , GOSSIP_SENDER_MAIN, 2);
	        player->PlayerTalkClass->SendGossipMenu(85008, creature->GetGUID());
			}
			break;
		case 15:
			// gearing dunegons/raids 
		    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Gearing Instances" , GOSSIP_SENDER_MAIN, 26);
		    player->ADD_GOSSIP_ITEM(GOSSIP_ICON_MONEY_BAG, "Gearing Raids" , GOSSIP_SENDER_MAIN, 27);
			player->CLOSE_GOSSIP_MENU();
			break;
		case 16:
			// diremaul
			player->TeleportTo(1, -3760.586670f, 1216.040161f, 127.433846f, 4.7f);
			player->CLOSE_GOSSIP_MENU();
			break;
		case 17:
			// Gurubashi
			player->TeleportTo(0, -13235.965820f, 213.581497f, 31.188322f, 1.1f);
			player->CLOSE_GOSSIP_MENU();
			break;
		case 18:
			// horde duel area
			player->TeleportTo(1, -6983.771484f, 1178.834961f, 9.181019f, 0.75f);
			player->CLOSE_GOSSIP_MENU();
			break;
		case 19:
			// ally duel area -6151.108 3338.358 62.4
			player->TeleportTo(1, -6151.108f, 3338.358f, 62.4f, 0.22f);
			player->CLOSE_GOSSIP_MENU();
			break;
		case 20:
			// summon titles npc
			player->PlayerTalkClass->SendCloseGossip();
			player->SummonCreature(100026,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
			creature->MonsterWhisper("You got your titles npc, i must say farewell..", false);
			creature->DisappearAndDie();
			break;
		case 21:
			// summon enchanter npc
			player->PlayerTalkClass->SendCloseGossip();
			player->SummonCreature(100025,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
			creature->MonsterWhisper("You got your titles npc, i must say farewell..", false);
			creature->DisappearAndDie();
			break;
		case 22:
			//events mall
			player->CLOSE_GOSSIP_MENU();
			break;
		case 23:
			// Starter area
			player->CLOSE_GOSSIP_MENU();
			break;
		case 24:
			// World Bosses
			player->CLOSE_GOSSIP_MENU();
			break;
		case 25:
			// Trolling tavern
			player->CLOSE_GOSSIP_MENU();
			break;
		case 26:
			// Gearing Instances
			player->CLOSE_GOSSIP_MENU();
			break;
		case 27:
			// Gearing Raids
			player->CLOSE_GOSSIP_MENU();
			break;
		case 28:
			player->PlayerTalkClass->SendCloseGossip();
			player->SummonCreature(190010,player->GetPositionX() ,player->GetPositionY()+1, player->GetPositionZ(), 0,TEMPSUMMON_TIMED_DESPAWN,65000);
			creature->MonsterWhisper("You got your Transmog npc, i must say farewell..", false);
			creature->DisappearAndDie();
			break;
		}
		return true;
	}
};

void AddSC_npc_tools()
{
	new npc_tools();
}