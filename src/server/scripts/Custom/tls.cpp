#pragma once
#include "ScriptPCH.h"

     
enum spells 
{
	POWER_WORD_FORTITUDE = 48162,
	PRAYER_OF_SPRITE = 48074,
	SHADOW_BUFF = 48170,
	KINGS_BUFF = 43223,
	ARCANE_BUFF = 36880,
	MARK_OF_THE_WILD = 48469
};
     
class buff_npc : public CreatureScript
{
        public:
                buff_npc() : CreatureScript("buff_npc"){}
     
                bool OnGossipHello(Player * player, Creature * pCreature)
                {
                        player->ADD_GOSSIP_ITEM(4, "Buff me!", GOSSIP_SENDER_MAIN, 1);
						player->ADD_GOSSIP_ITEM(4, "Nevermind", GOSSIP_SENDER_MAIN, 100);
                        player->PlayerTalkClass->SendGossipMenu(9425, pCreature->GetGUID());
									
                        return true;
                }
     
                bool OnGossipSelect(Player * player, Creature * pCreature, uint32 /*uiSender*/, uint32 uiAction)
                {
					player->PlayerTalkClass->ClearMenus();
                if (player->IsInCombat())
		      {
			ChatHandler(player->GetSession()).PSendSysMessage("|cffffffff[|r|cFFFF4500Combat Check|r|cffffffff]:|r |cffffffffYou're in combat!|r");
			return false;
		     }
					
					    switch(player->getClass())
                        {
                                case CLASS_WARRIOR:
									{
                                        player->CastSpell(player, POWER_WORD_FORTITUDE, true);
										player->CastSpell(player, KINGS_BUFF, true);
										player->CastSpell(player, MARK_OF_THE_WILD, true);
										player->CastSpell(player, PRAYER_OF_SPRITE, true);
										player->CastSpell(player, SHADOW_BUFF, true);
                                        pCreature->MonsterWhisper("You are now buffed!", player->GetGUID(), true);
									}break;

								case CLASS_PALADIN:
									{
										 player->CastSpell(player, POWER_WORD_FORTITUDE, true);
										 player->CastSpell(player, KINGS_BUFF, true);
										 player->CastSpell(player, MARK_OF_THE_WILD, true);
										 player->CastSpell(player, PRAYER_OF_SPRITE, true);
										 player->CastSpell(player, ARCANE_BUFF, true);
										 player->CastSpell(player, SHADOW_BUFF, true);
										 pCreature->MonsterWhisper("You are now buffed!", player->GetGUID(), true);
									}break;

								case CLASS_HUNTER:
										{
											 player->CastSpell(player, POWER_WORD_FORTITUDE, true);
											 player->CastSpell(player, KINGS_BUFF, true);
											 player->CastSpell(player, MARK_OF_THE_WILD, true);
											 player->CastSpell(player, PRAYER_OF_SPRITE, true);
											 player->CastSpell(player, ARCANE_BUFF, true);
											 player->CastSpell(player, SHADOW_BUFF, true);
											 pCreature->MonsterWhisper("You are now buffed!", player->GetGUID(), true);
										}break;

								case CLASS_ROGUE:
									{
										 player->CastSpell(player, POWER_WORD_FORTITUDE, true);
										 player->CastSpell(player, KINGS_BUFF, true);
										 player->CastSpell(player, MARK_OF_THE_WILD, true);
										 player->CastSpell(player, PRAYER_OF_SPRITE, true);
										 player->CastSpell(player, SHADOW_BUFF, true);
										 pCreature->MonsterWhisper("You are now buffed!", player->GetGUID(), true);
									}break;

								case CLASS_PRIEST:
									{
										 player->CastSpell(player, POWER_WORD_FORTITUDE, true);
										 player->CastSpell(player, KINGS_BUFF, true);
										 player->CastSpell(player, MARK_OF_THE_WILD, true);
										 player->CastSpell(player, PRAYER_OF_SPRITE, true);
										 player->CastSpell(player, ARCANE_BUFF, true);
										 player->CastSpell(player, SHADOW_BUFF, true);
										 pCreature->MonsterWhisper("You are now buffed!", player->GetGUID(), true);
									}break;

								case CLASS_DEATH_KNIGHT:
									{
										 player->CastSpell(player, POWER_WORD_FORTITUDE, true);
										 player->CastSpell(player, KINGS_BUFF, true);
										 player->CastSpell(player, MARK_OF_THE_WILD, true);
										 player->CastSpell(player, PRAYER_OF_SPRITE, true);
										 player->CastSpell(player, SHADOW_BUFF, true);
										 pCreature->MonsterWhisper("You are now buffed!", player->GetGUID(), true);
									}break;

								case CLASS_SHAMAN:
									{
										 player->CastSpell(player, POWER_WORD_FORTITUDE, true);
										 player->CastSpell(player, KINGS_BUFF, true);
										 player->CastSpell(player, MARK_OF_THE_WILD, true);
										 player->CastSpell(player, PRAYER_OF_SPRITE, true);
										 player->CastSpell(player, ARCANE_BUFF, true);
										 player->CastSpell(player, SHADOW_BUFF, true);
										 pCreature->MonsterWhisper("You are now buffed!", player->GetGUID(), true);
									}break;

								case CLASS_MAGE:
									{
										 player->CastSpell(player, POWER_WORD_FORTITUDE, true);
										 player->CastSpell(player, KINGS_BUFF, true);
										 player->CastSpell(player, MARK_OF_THE_WILD, true);
										 player->CastSpell(player, PRAYER_OF_SPRITE, true);
										 player->CastSpell(player, ARCANE_BUFF, true);
										 player->CastSpell(player, SHADOW_BUFF, true);
										 pCreature->MonsterWhisper("You are now buffed!", player->GetGUID(), true);
									}break;

								case CLASS_WARLOCK:
									{
										 player->CastSpell(player, POWER_WORD_FORTITUDE, true);
										 player->CastSpell(player, KINGS_BUFF, true);
										 player->CastSpell(player, MARK_OF_THE_WILD, true);
										 player->CastSpell(player, PRAYER_OF_SPRITE, true);
										 player->CastSpell(player, ARCANE_BUFF, true);
										 player->CastSpell(player, SHADOW_BUFF, true);
										 pCreature->MonsterWhisper("You are now buffed!", player->GetGUID(), true);
									}break;

								case CLASS_DRUID:
									{
										 player->CastSpell(player, POWER_WORD_FORTITUDE, true);
										 player->CastSpell(player, KINGS_BUFF, true);
										 player->CastSpell(player, MARK_OF_THE_WILD, true);
										 player->CastSpell(player, PRAYER_OF_SPRITE, true);
										 player->CastSpell(player, ARCANE_BUFF, true);
										 player->CastSpell(player, SHADOW_BUFF, true);
										 pCreature->MonsterWhisper("You are now buffed!", player->GetGUID(), true);
									}break;

								case 100:
								{
										player->CLOSE_GOSSIP_MENU();
								}
								break;
			return false;
		}
				break;

			}
		}
		return true;
}
};
     
void AddSC_buff_npc()
{
        new buff_npc();
}