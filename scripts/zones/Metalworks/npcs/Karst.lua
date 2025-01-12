-----------------------------------
-- Area: Metalworks
--  NPC: Karst
-- Type: President
-- Involved in Bastok Missions 5-2
-- !pos 106 -21 0 237
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local currentMission = player:getCurrentMission(BASTOK)

    if (currentMission == xi.mission.id.bastok.XARCABARD_LAND_OF_TRUTHS and player:getMissionStatus(player:getNation()) == 0) then
        player:startEvent(602)
    elseif (currentMission == xi.mission.id.bastok.XARCABARD_LAND_OF_TRUTHS and player:hasKeyItem(xi.ki.SHADOW_FRAGMENT)) then
        player:startEvent(603)
    elseif (currentMission == xi.mission.id.bastok.ON_MY_WAY) and (player:getMissionStatus(player:getNation()) == 0) then
        player:startEvent(765)
    elseif (currentMission == xi.mission.id.bastok.ON_MY_WAY) and (player:getMissionStatus(player:getNation()) == 3) then
        player:startEvent(766)
    else
        player:startEvent(601)
    end
end

entity.onEventUpdate = function(player, csid, option)
end

entity.onEventFinish = function(player, csid, option)
    if (csid == 602) then
        player:setMissionStatus(player:getNation(), 2)
    elseif (csid == 765) then
        player:setMissionStatus(player:getNation(), 1)
    elseif (csid == 766 or csid == 603) then
        finishMissionTimeline(player, 1, csid, option)
    end
end

return entity
