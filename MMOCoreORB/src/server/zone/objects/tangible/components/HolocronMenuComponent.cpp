/*
 * HolocronMenuComponent.cpp
 *
 *  Created on: 01/23/2012
 *      Author: xyborn
 *  Modified on: 10/22/2016
 *	Author: Skyyyr Death
 */

#include "HolocronMenuComponent.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/ZoneServer.h"
#include "server/zone/managers/jedi/JediManager.h"
#include "server/chat/ChatManager.h"
#include "server/zone/packets/player/PlayMusicMessage.h"
#include "server/zone/managers/visibility/VisibilityManager.h"
#include "server/zone/objects/player/sui/callbacks/BountyHuntSuiCallback.h"
#include "server/zone/objects/player/sui/inputbox/SuiInputBox.h"


int HolocronMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* creature, byte selectedID) const {
	
	/*
		@param If timer is up - Holocron will refil force bar and remove itself
		@param If timer is down - Holoron will not refil force bar and stay in your inventory
		
		If player has !cooldown then
			refil force bar
			galactic message (player, "used holocron")
			player message "your visibility is: #"
		else
			player message "your still under cooldown"
			player message "your visibility is: #"
	*/
	
	if (selectedID != 20)
		return 0;

	if (!sceneObject->isASubChildOf(creature))
		return 0;

	ManagedReference<PlayerObject*> ghost = creature->getPlayerObject();
	if (ghost == NULL)
		return 0;

	//We will check for the holocron cooldown
	if (!creature->checkCooldownRecovery("used_holocron"))
		//Message player + visibilty message
		creature->sendSystemMessage("@jedi_spam:holocron_no_effect");
		//Visibility message
		int jediVis1 = ghost->getVisibility();
		StringBuffer messageVis;
		messageVis << "\\#00CC00 Your Visibility is at: " << jediVis1;
		creature->sendSystemMessage(messageVis.toString());
		return 0;
	
	//If you're not a Jedi, don't let them use it.
	if (playerObject != NULL && playerObject->getJediState() < 2)
		creature->sendSystemMessage("@jedi_spam:holocron_no_effect");
		return 0;
	
	//full force ? visibility : fillForce
	if (playerObject->getForcePower() >= playerObject->getForcePowerMax()) {
		//Message player
		creature->sendSystemMessage("@jedi_spam:holocron_force_max");
	} else {
		//Refil force + Message player
		creature->sendSystemMessage("@jedi_spam:holocron_force_replenish");
		playerObject->setForcePower(playerObject->getForcePowerMax(), true);
		//Set cooldown
		creature->addCooldown("used_holocron", 1 * 3600000); //3,600,000 = 1 hr
		//Destroy object
		sceneObject->destroyObjectFromWorld(true);
		//Music + Effect
		creature->playEffect("clienteffect/pl_force_absorb_hit.cef");
		PlayMusicMessage* pmm = new PlayMusicMessage("sound/music_become_light_jedi.snd");
  		ghost->sendMessage(pmm);
		//Broadcast to Server
		Zone* zone = creature->getZone();
 		String playerName = creature->getFirstName();
 		StringBuffer zBroadcast;
 		zBroadcast << "\\#00E604" << playerName << " \\#63C8F9 Has Used A Holocron";
		creature->getZoneServer()->getChatManager()->broadcastGalaxy(NULL, zBroadcast.toString());
	}
	
	//After the holocron fills, or doesn't fill your force bar it will tell you your visibility
	int jediVis1 = ghost->getVisibility();
	StringBuffer messageVis;
	messageVis << "\\#00CC00 Your Visibility is at: " << jediVis1;
	creature->sendSystemMessage(messageVis.toString());
	return 0;
}
