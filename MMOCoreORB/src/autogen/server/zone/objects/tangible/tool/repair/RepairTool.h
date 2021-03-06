/*
 *	autogen/server/zone/objects/tangible/tool/repair/RepairTool.h generated by engine3 IDL compiler 0.60
 */

#ifndef REPAIRTOOL_H_
#define REPAIRTOOL_H_

#include "engine/core/Core.h"

#include "engine/core/ManagedReference.h"

#include "engine/core/ManagedWeakReference.h"

#ifndef likely
#ifdef __GNUC__
#define likely(x)       __builtin_expect(!!(x), 1)
#define unlikely(x)     __builtin_expect(!!(x), 0)
#else
#define likely(x)       (x)
#define unlikely(x)     (x)
#endif
#endif
namespace server {
namespace zone {
namespace objects {
namespace scene {

class SceneObject;

} // namespace scene
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::scene;

namespace server {
namespace zone {

class Zone;

} // namespace zone
} // namespace server

using namespace server::zone;

namespace server {
namespace zone {
namespace packets {
namespace scene {

class AttributeListMessage;

} // namespace scene
} // namespace packets
} // namespace zone
} // namespace server

using namespace server::zone::packets::scene;

namespace server {
namespace zone {
namespace packets {
namespace object {

class ObjectMenuResponse;

} // namespace object
} // namespace packets
} // namespace zone
} // namespace server

using namespace server::zone::packets::object;

namespace server {
namespace zone {
namespace objects {
namespace creature {

class CreatureObject;

} // namespace creature
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::creature;

namespace server {
namespace zone {

class ZoneServer;

} // namespace zone
} // namespace server

using namespace server::zone;

#include "server/zone/objects/player/PlayerObject.h"

#include "server/zone/objects/tangible/TangibleObject.h"

#include "engine/lua/LuaObject.h"

namespace server {
namespace zone {
namespace objects {
namespace tangible {
namespace tool {
namespace repair {

class RepairTool : public TangibleObject {
public:
	RepairTool();

	/**
	 * Reads and sets the template data from a SharedTangibleObjectTemplate LuaObject
	 * @pre { templateData is a valid pointer }
	 * @post { TangibleObject members are initialized }
	 * @param templateData templateData points to the SharedTangibleObjectTemplate LuaObject that is used to initialize the TangibleObject members
	 */
	void loadTemplateData(SharedObjectTemplate* templateData);

	/**
	 * Fills the attribute list message options that are sent to player creature
	 * @pre { }
	 * @post { }
	 * @param msg attribute list message with the attributes
	 * @param object player creature to which the message is sent
	 */
	void fillAttributeList(AttributeListMessage* msg, CreatureObject* object);

	void updateCraftingValues(CraftingValues* values, bool firstUpdate);

	float getQuality();

	DistributedObjectServant* _getImplementation();
	DistributedObjectServant* _getImplementationForRead() const;

	void _setImplementation(DistributedObjectServant* servant);

protected:
	RepairTool(DummyConstructorParameter* param);

	virtual ~RepairTool();

	friend class RepairToolHelper;
};

} // namespace repair
} // namespace tool
} // namespace tangible
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::tangible::tool::repair;

namespace server {
namespace zone {
namespace objects {
namespace tangible {
namespace tool {
namespace repair {

class RepairToolImplementation : public TangibleObjectImplementation {
protected:
	float quality;

public:
	RepairToolImplementation();

	RepairToolImplementation(DummyConstructorParameter* param);

	/**
	 * Reads and sets the template data from a SharedTangibleObjectTemplate LuaObject
	 * @pre { templateData is a valid pointer }
	 * @post { TangibleObject members are initialized }
	 * @param templateData templateData points to the SharedTangibleObjectTemplate LuaObject that is used to initialize the TangibleObject members
	 */
	void loadTemplateData(SharedObjectTemplate* templateData);

	/**
	 * Fills the attribute list message options that are sent to player creature
	 * @pre { }
	 * @post { }
	 * @param msg attribute list message with the attributes
	 * @param object player creature to which the message is sent
	 */
	void fillAttributeList(AttributeListMessage* msg, CreatureObject* object);

	void updateCraftingValues(CraftingValues* values, bool firstUpdate);

	float getQuality();

	WeakReference<RepairTool*> _this;

	operator const RepairTool*();

	DistributedObjectStub* _getStub();
	virtual void readObject(ObjectInputStream* stream);
	virtual void writeObject(ObjectOutputStream* stream);
protected:
	virtual ~RepairToolImplementation();

	void finalize();

	void _initializeImplementation();

	void _setStub(DistributedObjectStub* stub);

	void lock(bool doLock = true);

	void lock(ManagedObject* obj);

	void rlock(bool doLock = true);

	void wlock(bool doLock = true);

	void wlock(ManagedObject* obj);

	void unlock(bool doLock = true);

	void runlock(bool doLock = true);

	void _serializationHelperMethod();
	bool readObjectMember(ObjectInputStream* stream, const uint32& nameHashCode);
	int writeObjectMembers(ObjectOutputStream* stream);

	friend class RepairTool;
};

class RepairToolAdapter : public TangibleObjectAdapter {
public:
	RepairToolAdapter(RepairTool* impl);

	void invokeMethod(sys::uint32 methid, DistributedMethod* method);

	float getQuality();

};

class RepairToolHelper : public DistributedObjectClassHelper, public Singleton<RepairToolHelper> {
	static RepairToolHelper* staticInitializer;

public:
	RepairToolHelper();

	void finalizeHelper();

	DistributedObject* instantiateObject();

	DistributedObjectServant* instantiateServant();

	DistributedObjectAdapter* createAdapter(DistributedObjectStub* obj);

	friend class Singleton<RepairToolHelper>;
};

} // namespace repair
} // namespace tool
} // namespace tangible
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::tangible::tool::repair;

#endif /*REPAIRTOOL_H_*/
