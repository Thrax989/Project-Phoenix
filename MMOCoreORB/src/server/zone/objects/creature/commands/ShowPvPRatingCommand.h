/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/
/*
  * PLEASE DO NOT STEAL OUR WORK
  * ASK BEFOR USING
  * Contact Me Here http://projectphoenix.com.shivtr.com/
  * Created on: 9/21/2016
  * Authors: TOXIC , Kurdtkobain
  */
  

#ifndef SHOWPVPRATINGCOMMAND_H_
#define SHOWPVPRATINGCOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"

class ShowPvPRatingCommand : public QueueCommand {
public:

	ShowPvPRatingCommand(const String& name, ZoneProcessServer* server)
		: QueueCommand(name, server) {

	}

	int doQueueCommand(CreatureObject* creature, const uint64& target, const UnicodeString& arguments) const {

		if (!checkStateMask(creature))
			return INVALIDSTATE;

		if (!checkInvalidLocomotions(creature))
			return INVALIDLOCOMOTION;

		PlayerManager* playerManager = server->getZoneServer()->getPlayerManager();
		ManagedReference<CreatureObject*> targetObj = NULL;
		StringTokenizer args(arguments.toString());

		if (creature->getTargetID() != 0) {
			targetObj = server->getZoneServer()->getObject(creature->getTargetID()).castTo<CreatureObject*>();
		} else {
			if (args.hasMoreTokens()) {
				String targetName = "";
				args.getStringToken(targetName);
				targetObj = playerManager->getPlayer(targetName);
			}
		}

		if (targetObj != NULL) {
			PlayerObject* targetGhost = targetObj->getPlayerObject();

			if (targetGhost != NULL) {
				StringIdChatParameter ratingMsg;
				ratingMsg.setStringId("pvp_rating", "pvp_rating_target");
				ratingMsg.setTT(targetObj->getFirstName());
				ratingMsg.setDI(targetGhost->getPvpRating());

				creature->sendSystemMessage(ratingMsg);
				return SUCCESS;
			}
		}

		PlayerObject* ghost = creature->getPlayerObject();

		if (ghost != NULL) {
			StringIdChatParameter ratingMsg;
			ratingMsg.setStringId("pvp_rating", "pvp_rating");
			ratingMsg.setDI(ghost->getPvpRating());
			creature->sendSystemMessage(ratingMsg);
		}

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

#endif //SHOWPVPRATINGCOMMAND_H_