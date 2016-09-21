/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef PvpCOMMAND_H_
#define PvpCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "server/zone/objects/tangible/terminal/characterbuilder/CharacterBuilderTerminal.h"
#include "server/zone/objects/player/sui/callbacks/BountyHuntSuiCallback.h"
#include "server/zone/objects/player/sui/inputbox/SuiInputBox.h"
#include "server/zone/packets/player/PlayMusicMessage.h"

class PvpCommand : public QueueCommand {
public:

	PvpCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;
		
		PlayerObject* targetGhost = creature->getPlayerObject();
		Zone* zone = creature->getZone();
		
		if (targetGhost == NULL)
					return GENERALERROR;

		if(targetGhost->getFactionStatus() == FactionStatus::ONLEAVE || targetGhost->getFactionStatus() == FactionStatus::COVERT){
			targetGhost->setFactionStatus(FactionStatus::OVERT);
		}else{
			targetGhost->setFactionStatus(FactionStatus::ONLEAVE);
		}
			//Broadcast to Server
 			String playerName = creature->getFirstName();
 			StringBuffer zBroadcast;
 			zBroadcast << "\\#00E604" << playerName << " \\#63C8F9 Is Now ";
			if(targetGhost->getFactionStatus() == FactionStatus::ONLEAVE){
				zBroadcast << "Onleave";
			}else{
				zBroadcast << "Overt";
			}
			creature->getZoneServer()->getChatManager()->broadcastGalaxy(NULL, zBroadcast.toString());
		
		return SUCCESS;
	}

};

#endif //PvpCOMMAND_H_
