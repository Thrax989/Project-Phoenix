/*
 *	autogen/server/zone/objects/building/tutorial/TutorialBuildingObject.h generated by engine3 IDL compiler 0.60
 */

#ifndef TUTORIALBUILDINGOBJECT_H_
#define TUTORIALBUILDINGOBJECT_H_

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
namespace creature {

class CreatureObject;

} // namespace creature
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::creature;

namespace server {
namespace zone {
namespace objects {
namespace building {
namespace tutorial {
namespace events {

class UnloadBuildingTask;

} // namespace events
} // namespace tutorial
} // namespace building
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::building::tutorial::events;

namespace server {
namespace zone {
namespace objects {
namespace building {
namespace tutorial {
namespace events {

class StartTutorialTask;

} // namespace events
} // namespace tutorial
} // namespace building
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::building::tutorial::events;

namespace server {
namespace zone {

class Zone;

} // namespace zone
} // namespace server

using namespace server::zone;

namespace server {
namespace zone {
namespace objects {
namespace cell {

class CellObject;

} // namespace cell
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::cell;

namespace server {
namespace zone {
namespace managers {
namespace director {

class DirectorManager;

} // namespace director
} // namespace managers
} // namespace zone
} // namespace server

using namespace server::zone::managers::director;

#include "server/zone/objects/building/BuildingObject.h"

#include "engine/lua/LuaObject.h"

namespace server {
namespace zone {
namespace objects {
namespace building {
namespace tutorial {

class TutorialBuildingObject : public BuildingObject {
public:
	TutorialBuildingObject();

	void notifyRemoveFromZone();

	void initializeTransientMembers();

	void onEnter(CreatureObject* player);

	void onExit(CreatureObject* player);

	void clearUnloadEvent();

	DistributedObjectServant* _getImplementation();
	DistributedObjectServant* _getImplementationForRead() const;

	void _setImplementation(DistributedObjectServant* servant);

protected:
	TutorialBuildingObject(DummyConstructorParameter* param);

	virtual ~TutorialBuildingObject();

	friend class TutorialBuildingObjectHelper;
};

} // namespace tutorial
} // namespace building
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::building::tutorial;

namespace server {
namespace zone {
namespace objects {
namespace building {
namespace tutorial {

class TutorialBuildingObjectImplementation : public BuildingObjectImplementation {
protected:
	Reference<UnloadBuildingTask* > unloadTask;

public:
	TutorialBuildingObjectImplementation();

	TutorialBuildingObjectImplementation(DummyConstructorParameter* param);

	void notifyRemoveFromZone();

	void initializeTransientMembers();

	void onEnter(CreatureObject* player);

	void onExit(CreatureObject* player);

	void clearUnloadEvent();

protected:
	void dequeueUnloadEvent();

	void enqueueUnloadEvent();

public:
	WeakReference<TutorialBuildingObject*> _this;

	operator const TutorialBuildingObject*();

	DistributedObjectStub* _getStub();
	virtual void readObject(ObjectInputStream* stream);
	virtual void writeObject(ObjectOutputStream* stream);
protected:
	virtual ~TutorialBuildingObjectImplementation();

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

	friend class TutorialBuildingObject;
};

class TutorialBuildingObjectAdapter : public BuildingObjectAdapter {
public:
	TutorialBuildingObjectAdapter(TutorialBuildingObject* impl);

	void invokeMethod(sys::uint32 methid, DistributedMethod* method);

	void notifyRemoveFromZone();

	void initializeTransientMembers();

	void onEnter(CreatureObject* player);

	void onExit(CreatureObject* player);

	void clearUnloadEvent();

};

class TutorialBuildingObjectHelper : public DistributedObjectClassHelper, public Singleton<TutorialBuildingObjectHelper> {
	static TutorialBuildingObjectHelper* staticInitializer;

public:
	TutorialBuildingObjectHelper();

	void finalizeHelper();

	DistributedObject* instantiateObject();

	DistributedObjectServant* instantiateServant();

	DistributedObjectAdapter* createAdapter(DistributedObjectStub* obj);

	friend class Singleton<TutorialBuildingObjectHelper>;
};

} // namespace tutorial
} // namespace building
} // namespace objects
} // namespace zone
} // namespace server

using namespace server::zone::objects::building::tutorial;

#endif /*TUTORIALBUILDINGOBJECT_H_*/
