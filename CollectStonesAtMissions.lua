-- Copyright MaDDogLV

CollectStonesAtMissions = {};

function CollectStonesAtMissions:loadMap(name)
    MissionManager.getIsMissionWorkAllowed = Utils.overwrittenFunction(MissionManager.getIsMissionWorkAllowed, CollectStonesAtMissions.getIsMissionWorkAllowed);
end; 

function CollectStonesAtMissions:getIsMissionWorkAllowed(superFunc, farmId, x, z, workAreaType)
    return superFunc(self, farmId, x, z, workAreaType) or ((workAreaType == WorkAreaType.STONEPICKER) and (superFunc(self, farmId, x, z, WorkAreaType.CULTIVATOR) or superFunc(self, farmId, x, z, WorkAreaType.PLOW)));
end

addModEventListener(CollectStonesAtMissions);

