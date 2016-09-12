--PLEASE DO NOT STEAL OUR WORK
--ASK BEFOR USING
--Contact Me Here http://projectphoenix.com.shivtr.com/
--Created on: 9/12/2016
--Authors: Falacy , TOXIC
-- Legend of Hondo
-- Bread Crumb Quest: Help the player find the profession trainers.
-- Created by R. Bassett Jr. (Tatwi aka Falacy) 2016 www.tpot.ca
-- Documentation: doc/features/add-breadcrumbquest.md

local ObjectManager = require("managers.object.object_manager")

HelperTrainersScreenPlay = ScreenPlay:new {
    numberOfActs = 1,
    screenplayName = "HelperTrainersScreenPlay",
    states = {
        active = 1,
        complete = 2,
        cooldown = 4,
    }, 
    questConfig={
        planetName = "tatooine",
        questName = "HelperTrainers",  -- Internal quest , should be unique to the quest
        className = "HelperTrainersScreenPlay", -- Class name of this class
        questGiverName ="Wherma Traynr",
        timeResolution = 0, -- number of decimal places to use for the time updates 0 = none
        expiryTime = 1800, -- (30 minutes) Amount of time in SECONDS that the player has to finish the quest 
        cooldown = 3600, -- (1 hour) Amount of time in SECONDS until the player can repeat the quest
        waypointRadius = 6, -- size of the waypoint observer. 3 is good for on foot, 10 for when in a vehicle. 1 makes it kind of annoying to trigger.
        cashReward = 25000, -- set to 0 for no cash reward
        giveItems = "true", -- set false if there isn't an item reward.
        rewardType = "lootgroup", -- Pick One: myListAll = give whole list, myListRNG = pick one item from the list, lootgroup = item from the lootGroups
        lootGroups = {"armor_attachments", "clothing_attachments"}, -- loot groups
        lootQuantity = 2, -- number of items to give
        lootLevelMin = 1, -- range 1 - 300. Set same as lootLevelMax for highest chance of good loot.
        lootLevelMax = 300, -- range 1 - 300. This is not a gaurantee the player will always get top end loot.
        lootMaxCondition = "true", -- set true for item to have full hitpoints
        myList = {
            "",
            "",
        },
    },
    waypointSpecialType = 14, -- Any int 14 and up will do. Use a unique number per quest so they don't over-write eachother if the player takes more than one quest at time. 
    waypoints = { 
        {x = 1488, y = 3013, wpName = "Zone A", wpDesc = ""},
        {x = 1674, y = 3062, wpName = "Zone B", wpDesc = ""},
        {x = 1726, y = 3182, wpName = "Zone C", wpDesc = ""},
        {x = 1614, y = 3317, wpName = "Zone D", wpDesc = ""},
        {x = 1553, y = 3490, wpName = "Zone E", wpDesc = ""},
        {x = 1352, y = 3447, wpName = "Zone F", wpDesc = ""},
        {x = 1388, y = 3172, wpName = "Zone G", wpDesc = ""},
        {x = 1245, y = 3257, wpName = "Zone H", wpDesc = ""},
        {x = 1305, y = 3102, wpName = "Return To Wherma Traynr", wpDesc = ""}, -- Quest Giver
    },
}

registerScreenPlay("HelperTrainersScreenPlay", true)

function HelperTrainersScreenPlay:start()
    if (isZoneEnabled(self.questConfig.planetName)) then
        -- Spawn character
        local pCoord = spawnMobile(self.questConfig.planetName, "helper_trainers", 1, 1304.62, 7, 3101.93, 187, 0) 
    end
end

-- Start Quest
function HelperTrainersScreenPlay:startQuesting(pObject)
    ObjectManager.withCreatureAndPlayerObject(pObject, function(creatureObject, playerObject)
        -- Set quest active
        creatureObject:setScreenPlayState(HelperTrainersScreenPlay.states.active, HelperTrainersScreenPlay.screenplayName)
        
        -- Create first waypoint
        self:createPoint(pObject, 1)
        
        -- Set start and expiry time
        local time = getTimestampMilli()
        writeScreenPlayData(pObject, self.questConfig.questName, "starttime", time)
        createEvent(self.questConfig.expiryTime*1000, self.questConfig.className, "resetPlayerUnfinishedEventHandler", playerObject, "")
        
        -- Inform player
        creatureObject:sendSystemMessage("You have " .. (self:roundNumber(self.questConfig.expiryTime/60)) .. " minutes to complete your mission.")
        creatureObject:playMusicMessage("sound/music_themequest_acc_criminal.snd")
    end)
end

-- Create active area and waypoint
function HelperTrainersScreenPlay:createPoint(pObject, wpIndex)
    ObjectManager.withCreatureAndPlayerObject(pObject, function(creatureObject, playerObject)
        -- Create active area
        local pWaypointAA = spawnActiveArea(self.questConfig.planetName, "object/active_area.iff", self.waypoints[wpIndex].x, 0, self.waypoints[wpIndex].y, self.questConfig.waypointRadius, 0)
        if (pWaypointAA ~= nil) then
          createObserver(ENTEREDAREA, self.questConfig.className, "triggerPoint" , pWaypointAA)
          writeScreenPlayData(pObject, self.questConfig.questName, "activeAreaID", SceneObject(pWaypointAA):getObjectID())
        end
        
        -- Create waypoint
		local waypointID = playerObject:addWaypoint(self.questConfig.planetName, self.waypoints[wpIndex].wpName, "", self.waypoints[wpIndex].x, self.waypoints[wpIndex].y, WAYPOINTGREEN, true, true, self.waypointSpecialType, 0)
        writeScreenPlayData(pObject, self.questConfig.questName, "activeWaypoint", tostring(wpIndex))
    end)
end

-- Process arrival at waypoint
function HelperTrainersScreenPlay:triggerPoint(pActiveArea, pObject)
-- START VERIFICATION STEPS
    if not SceneObject(pObject):isPlayerCreature() then
        -- Object is not a player
        return 0
    end

    return ObjectManager.withCreatureAndPlayerObject(pObject, function(creatureObject, playerObject)
        local questActive = creatureObject:hasScreenPlayState(HelperTrainersScreenPlay.states.active, HelperTrainersScreenPlay.screenplayName)
        if not (questActive) then
            -- Player is not on the quest
            return 0
        end
        
        local wpIndex =  tonumber(readScreenPlayData(pObject, self.questConfig.questName, "activeWaypoint"))
        if (wpIndex == nil) then
            -- Shouldn't happen, but if it does it will crash server without this check.
            self:resetQuest(pObject, 2)
            return 0
        end
-- END VERIFICATION STEPS
    
        -- Remove current active area
        SceneObject(pActiveArea):destroyObjectFromWorld()
        
        -- Remove current waypoint
        playerObject:removeWaypointBySpecialType(self.waypointSpecialType) 
        
        if (wpIndex == #self.waypoints) then
            -- Final waypoint
            creatureObject:removeScreenPlayState(HelperTrainersScreenPlay.states.active, HelperTrainersScreenPlay.screenplayName)
            creatureObject:setScreenPlayState(HelperTrainersScreenPlay.states.complete, HelperTrainersScreenPlay.screenplayName)
            
            -- Inform player
            creatureObject:sendSystemMessage("Final step complete!")
            creatureObject:sendSystemMessage("Speak to " .. self.questConfig.questGiverName .. " again to complete your mission.")
            creatureObject:playMusicMessage("sound/ui_select_info.snd")
        else
            -- Ongoing waypoints
            
            -- Create next waypoint
            wpIndex = wpIndex + 1
            self:createPoint(pObject, wpIndex)
            
            -- Update player on quest status 
            local startTime = readScreenPlayData(pObject, self.questConfig.questName, "starttime")
            local timePassed = (getTimestampMilli() - tonumber(startTime)) / 1000 -- miliseconds to seconds
            local timeLeft = self.questConfig.expiryTime - timePassed
            local timeType = " minutes"
            if (timeLeft < 60) then
              timeType = " seconds"
            else
              if (timeLeft < 120) then
                timeType = " minute" -- because pluralization matters people! :)
              end
              timeLeft = timeLeft / 60 -- show time in minutes
            end
            timeLeft = self:roundNumber(timeLeft) -- drop the decimal places
            
            creatureObject:sendSystemMessage("You have " .. timeLeft .. timeType .. " to complete " .. self.questConfig.questGiverName .. "'s mission.")
            
            -- Describe the waypoint the player arrived at...
            if (self.waypoints[wpIndex].wpDesc ~= nil) then
                creatureObject:sendSystemMessage(self.waypoints[wpIndex-1].wpDesc) -- remove -1 to describe the next waypoint instead of the one the player arrived at.
            end
            
            --creatureObject:playMusicMessage("sound/ui_select_info.snd")
            creatureObject:playEffect("clienteffect/survey_tool_gas.cef", "")
        end
        
        return 0
    end)
end

-- Reset quest
function HelperTrainersScreenPlay:resetQuest(pObject, reason)
  ObjectManager.withCreatureAndPlayerObject(pObject, function(creatureObject, playerObject)
    -- Remove current active area
    local activeAreaID = readScreenPlayData(pObject, self.questConfig.questName, "activeAreaID")
    local pActiveArea = getSceneObject(activeAreaID)
    if (pActiveArea ~= nil) then
        SceneObject(pActiveArea):destroyObjectFromWorld()
    end
  
    -- Remove current waypoint
    playerObject:removeWaypointBySpecialType(self.waypointSpecialType)

    -- Clear screenplay data
    clearScreenPlayData(pObject,self.questConfig.questName)
    creatureObject:removeScreenPlayState(HelperTrainersScreenPlay.states.active, HelperTrainersScreenPlay.screenplayName)
    creatureObject:removeScreenPlayState(HelperTrainersScreenPlay.states.complete, HelperTrainersScreenPlay.screenplayName)
    
    -- Inform player
    if (reason == 1) then
        creatureObject:sendSystemMessage("You have succesfullly abandoned " .. self.questConfig.questGiverName .. "'s mission.")
    elseif (reason == 2) then
        creatureObject:sendSystemMessage("Something has broken " .. self.questConfig.questGiverName .. "'s mission. It has automatically been abandoned for you.")
    else
        creatureObject:sendSystemMessage("You were unable to finish " .. self.questConfig.questGiverName .. "'s mission in time.")
    end
    creatureObject:playMusicMessage("sound/music_themequest_fail_imperial.snd")
  end)
end

-- Timeout quest
function HelperTrainersScreenPlay:resetPlayerUnfinishedEventHandler(pObject)
    ObjectManager.withCreatureAndPlayerObject(pObject, function(creatureObject, playerObject)
        local questActive = creatureObject:hasScreenPlayState(HelperTrainersScreenPlay.states.active, HelperTrainersScreenPlay.screenplayName)
        if not (questActive) then
            -- Player has already completed the quest
            return
        end
        
        self:resetQuest(pObject, 0)
    end)
end

-- End quest and start cooldown
function HelperTrainersScreenPlay:endQuest(pObject)
    ObjectManager.withCreatureAndPlayerObject(pObject, function(creatureObject, playerObject)
        -- Reset quest state
        creatureObject:removeScreenPlayState(HelperTrainersScreenPlay.states.active, HelperTrainersScreenPlay.screenplayName)
        creatureObject:removeScreenPlayState(HelperTrainersScreenPlay.states.complete, HelperTrainersScreenPlay.screenplayName)
        
        -- Start cooldown
        createEvent(self.questConfig.cooldown*1000, self.questConfig.className, "cooldownEventHandler", playerObject, "")
        creatureObject:setScreenPlayState(HelperTrainersScreenPlay.states.cooldown, HelperTrainersScreenPlay.screenplayName)
        
        -- Inform player
        creatureObject:playMusicMessage("sound/music_combat_bfield_vict.snd")
    end)
end

-- End cooldown
function HelperTrainersScreenPlay:cooldownEventHandler(pObject)
    ObjectManager.withCreatureAndPlayerObject(pObject, function(creatureObject, playerObject)
        clearScreenPlayData(pObject,self.questConfig.questName)
        creatureObject:removeScreenPlayState(HelperTrainersScreenPlay.states.cooldown, HelperTrainersScreenPlay.screenplayName)
        
        -- Inform player
        creatureObject:sendSystemMessage("Something gives you the feeling that " .. self.questConfig.questGiverName .. " might need your help again...")
    end)
end

-- Failsafe end cooldown
function HelperTrainersScreenPlay:failsafeEndCooldown(pObject)
    ObjectManager.withCreatureAndPlayerObject(pObject, function(creatureObject, playerObject)
        local onCooldown = creatureObject:hasScreenPlayState(HelperTrainersScreenPlay.states.cooldown, HelperTrainersScreenPlay.screenplayName)
        if not (onCooldown) then
            -- Player is not on the quest or it's not on cooldown
            return
        end
        
        local startTime = readScreenPlayData(pObject, self.questConfig.questName, "starttime")
        local timePassed = (getTimestampMilli() - tonumber(startTime)) / 1000 -- miliseconds to seconds
    
        if (timePassed > self.questConfig.cooldown) then
            clearScreenPlayData(pObject,self.questConfig.questName)
            creatureObject:removeScreenPlayState(HelperTrainersScreenPlay.states.cooldown, HelperTrainersScreenPlay.screenplayName)
        end
    end)
end


-- Helper functions

function HelperTrainersScreenPlay:roundNumber(num)
	local mult = 10 ^ (self.questConfig.timeResolution or 0 )
	num = math.floor(num * mult + 0.5) / mult
	
	-- Remove the .0
	local numString = tostring(num)
	numString = string.format("%.0f", numString)
	num = tonumber(numString)
	
	return num
end


-- Handle Rewards 

function HelperTrainersScreenPlay:checkSpace(creature)
    if (HelperTrainersScreenPlay.questConfig.giveItems == "false") then
        return true -- always enough room for nothing!
    end
    
    local pInventory = creature:getSlottedObject("inventory")
    local inventory = LuaSceneObject(pInventory)
    local pieces = 0
    
    if (HelperTrainersScreenPlay.questConfig.rewardType == "lootgroup") then
        pieces = HelperTrainersScreenPlay.questConfig.lootQuantity
    else
        pieces = #HelperTrainersScreenPlay.questConfig.myList -- gets # of items in the reward list
    end
    
    -- Check for room in inventory
    local numberOfItems = inventory:getContainerObjectsSize()
    local freeSpace = 80 - numberOfItems
    
    if (freeSpace < pieces) then
        -- Bail if the player doesn't have enough space in their inventory.
        creature:sendSystemMessage("You do not have enough inventory space to complete this quest. Please free up " .. pieces .. " space(s) and speak to the quest giver again.")
        return false
    end
    
    return true
end

function HelperTrainersScreenPlay:giveReward(creature)
    local pInventory = creature:getSlottedObject("inventory")
    local inventory = LuaSceneObject(pInventory)
    local pieces = 0
    
    if (HelperTrainersScreenPlay.questConfig.rewardType == "lootgroup") then
        pieces = HelperTrainersScreenPlay.questConfig.lootQuantity
    else
        pieces = #HelperTrainersScreenPlay.questConfig.myList -- gets # of items in the reward list
    end
    
    -- Grant cash reward, if there is one
    if (HelperTrainersScreenPlay.questConfig.cashReward ~= 0) then
        creature:addCashCredits(HelperTrainersScreenPlay.questConfig.cashReward, true)
        creature:sendSystemMessage("You have earned " .. HelperTrainersScreenPlay.questConfig.cashReward .. " credits.")
    end

    -- Grant item rewards, if there are any
    if (HelperTrainersScreenPlay.questConfig.giveItems == "true") then
        if (HelperTrainersScreenPlay.questConfig.rewardType == "myListRNG") then
            -- Give 1 random list item
            local rndNum = getRandomNumber(1, pieces)
            local pItem = giveItem(pInventory, HelperTrainersScreenPlay.questConfig.myList[rndNum], -1)
            creature:sendSystemMessage("A reward was placed into your inventory!") 
        elseif (HelperTrainersScreenPlay.questConfig.rewardType == "myListAll") then
            -- Give all list items
            for itemCount = 1, pieces do
                local pItem = giveItem(pInventory, HelperTrainersScreenPlay.questConfig.myList[itemCount], -1)
            end
            creature:sendSystemMessage("Rewards were placed into your inventory!") 
        elseif (HelperTrainersScreenPlay.questConfig.rewardType == "lootgroup") then
            -- Give loot group items
            local levelRNG = 0
            local groupRNG  = 0
            local usedGroups = ""
            local usedGroupCount = 0
            local uniqueGroup = 0
            
            for itemCount = 1, pieces do
                -- if we haven't already used all the loot groups, pick a unique one
                if (usedGroupCount < #HelperTrainersScreenPlay.questConfig.lootGroups) then
                    while (uniqueGroup == 0) do
                        groupRNG = getRandomNumber(1, #HelperTrainersScreenPlay.questConfig.lootGroups)
                        
                        if not (string.find(usedGroups, groupRNG)) then
                            -- if the generated group isn't in the string, then it's unique!
                            uniqueGroup = 1
                            usedGroupCount = usedGroupCount + 1 -- prevent infinite loop
                        end
                    end
                    uniqueGroup = 0 -- reset for next item
                    usedGroups = usedGroups .. groupRNG .. " " -- add this loot group to the ones that have been used.
                else
                    groupRNG = getRandomNumber(1, #HelperTrainersScreenPlay.questConfig.lootGroups)
                end

                if (HelperTrainersScreenPlay.questConfig.lootLevelMin == HelperTrainersScreenPlay.questConfig.lootLevelMax) then
                    levelRNG = HelperTrainersScreenPlay.questConfig.lootLevelMax
                else 
                    levelRNG = getRandomNumber(HelperTrainersScreenPlay.questConfig.lootLevelMin, HelperTrainersScreenPlay.questConfig.lootLevelMax)
                end
                
                createLoot(pInventory, HelperTrainersScreenPlay.questConfig.lootGroups[groupRNG], levelRNG, HelperTrainersScreenPlay.questConfig.lootMaxCondition)
            end
            creature:sendSystemMessage("Loot was placed into your inventory!")
        end
    end
end


-- Handle Conversation

helpertrainers_convo_handler = Object:new {
  tstring = "myconversation"
 }
 

function helpertrainers_convo_handler:getNextConversationScreen(conversationTemplate, conversingPlayer, selectedOption)
    local creature = LuaCreatureObject(conversingPlayer)
    local convosession = creature:getConversationSession()

    lastConversation = nil

    local conversation = LuaConversationTemplate(conversationTemplate)

    local nextConversationScreen 
    
    -- Player clicked NPC
    if ( conversation ~= nil ) then 
        if ( convosession ~= nil ) then 
            local session = LuaConversationSession(convosession)

            if ( session ~= nil ) then
                lastConversationScreen = session:getLastConversationScreen()
            end 
        end 
        
        
        if ( lastConversationScreen == nil ) then 
            -- Player clicked NPC for first time to start conversation
            HelperTrainersScreenPlay:failsafeEndCooldown(conversingPlayer) -- in case of server crash before cooldown state was removed
            local questActive = creature:hasScreenPlayState(HelperTrainersScreenPlay.states.active, HelperTrainersScreenPlay.screenplayName)
            local questComplete = creature:hasScreenPlayState(HelperTrainersScreenPlay.states.complete, HelperTrainersScreenPlay.screenplayName)
            local questCooldown = creature:hasScreenPlayState(HelperTrainersScreenPlay.states.cooldown, HelperTrainersScreenPlay.screenplayName)

            if (questActive) then 
                -- Quest is active
                nextConversationScreen = conversation:getScreen("quest_active")
            elseif (questComplete) then
                -- Quest completed
                nextConversationScreen = conversation:getScreen("quest_complete")
            elseif (questCooldown) then
                -- Quest completed
                nextConversationScreen = conversation:getScreen("quest_cooldown")  
            else
                -- Start the quest
                nextConversationScreen = conversation:getInitialScreen()
            end 
        else
            -- Player is already talking to NPC
            local luaLastConversationScreen = LuaConversationScreen(lastConversationScreen)
            local optionLink = luaLastConversationScreen:getOptionLink(selectedOption)

            if (optionLink == "give_rewards") then
                -- If on the reward step, give reward or bail if player doesn't have enough inventory space for it.
                local enoughSpace = HelperTrainersScreenPlay:checkSpace(creature)
                
                if (enoughSpace) then
                    HelperTrainersScreenPlay:giveReward(creature)
                    HelperTrainersScreenPlay:endQuest(conversingPlayer)
                else
                    nextConversationScreen = conversation:getScreen("no_space")
                end 
            end
            
            -- Just play the next step in the conversation 
            nextConversationScreen = conversation:getScreen(optionLink)
        end 
    end  
    
    return nextConversationScreen
end


function helpertrainers_convo_handler:runScreenHandlers(conversationTemplate, conversingPlayer, conversingNPC, selectedOption, conversationScreen)
  -- Plays the screens of the conversation.
  local player = LuaSceneObject(conversingPlayer)
  local screen = LuaConversationScreen(conversationScreen)
  local screenID = screen:getScreenID()
  
  if ( screenID == "quest_accept" ) then
    HelperTrainersScreenPlay:startQuesting(conversingPlayer)
  end
  
  if ( screenID == "quest_reset" ) then
    HelperTrainersScreenPlay:resetQuest(conversingPlayer, 1)
  end

  return conversationScreen
end