//Shadow-Game Duel Reset Script 3.3.5a
#include "ScriptPCH.h"
 
class Shadow_Reset : public PlayerScript
{
        public:
                Shadow_Reset() : PlayerScript("Shadow_Reset"){}
 
                void OnDuelEnd(Player* pWinner, Player* pLoser, DuelCompleteType /*type*/)
                {
                        pWinner->RemoveAllSpellCooldown();
                        pLoser->RemoveAllSpellCooldown();
                        pWinner->SetHealth(pWinner->GetMaxHealth());
                        if ( pWinner->getPowerType() == POWER_MANA )
                                pWinner->SetPower(POWER_MANA, pWinner->GetMaxPower(POWER_MANA));
                        pLoser->SetHealth(pLoser->GetMaxHealth());
                        if ( pLoser->getPowerType() == POWER_MANA )
                                pLoser->SetPower(POWER_MANA,  pLoser->GetMaxPower(POWER_MANA));
                }
};
 
void AddSC_Shadow_Reset()
{
        new Shadow_Reset();
}