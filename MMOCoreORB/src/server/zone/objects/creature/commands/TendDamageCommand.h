/*
				Copyright <SWGEmu>
		See file COPYING for copying conditions.*/

#ifndef TENDDAMAGECOMMAND_H_
#define TENDDAMAGECOMMAND_H_

#include "server/zone/objects/scene/SceneObject.h"
#include "TendCommand.h"

class TendDamageCommand : public TendCommand {
public:

	TendDamageCommand(const String& name, ZoneProcessServer* server)
			: TendCommand(name, server) {
		effectName = "clienteffect/healing_healdamage.cef";

		mindCost = 1;
		mindWoundCost = 40;

		tendDamage = true;

		healthHealed = 750;
		actionHealed = 750;
		mindHealed = 750;

		//defaultTime = 5.0;
		range = 11.0;
	}

};

#endif //TENDDAMAGECOMMAND_H_
