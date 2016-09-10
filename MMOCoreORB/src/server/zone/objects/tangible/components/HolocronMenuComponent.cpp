/*
 * HolocronMenuComponent.cpp
 *
 *  Created on: 01/23/2012
 *      Author: xyborn
 */

#include "HolocronMenuComponent.h"
#include "server/zone/objects/creature/CreatureObject.h"
#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/player/PlayerObject.h"
#include "server/zone/ZoneServer.h"
#include "server/zone/managers/player/PlayerManager.h"
#include "server/zone/managers/jedi/JediManager.h"
#include "server/chat/ChatManager.h"
#include "server/zone/managers/visibility/VisibilityManager.h"
#include "server/zone/objects/player/sui/callbacks/BountyHuntSuiCallback.h"
#include "server/zone/objects/player/sui/inputbox/SuiInputBox.h"


int HolocronMenuComponent::handleObjectMenuSelect(SceneObject* sceneObject, CreatureObject* creature, byte selectedID) const {
	if (selectedID != 20)
		return 0;

	if (!sceneObject->isASubChildOf(creature))
		return 0;

	JediManager::instance()->useItem(sceneObject, JediManager::ITEMHOLOCRON, creature);
        creature->playEffect("clienteffect/pl_force_absorb_hit.cef");
        sceneObject->destroyObjectFromWorld(true);
	//Broadcast to Server
	String playerName = creature->getFirstName();
	StringBuffer zBroadcast;
	zBroadcast << "\\#00E604" << playerName << " \\#63C8F9 Has Used A Holocron";
	creature->getZoneServer()->getChatManager()->broadcastGalaxy(NULL, zBroadcast.toString());

	return 0;
}