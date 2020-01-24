--[[----------------------------------------------------------------------------

  MountWaypoints

  Look for rare spawns that drop mounts. Put TomTom waypoints down for
  their spawn points. Alert on their Vignette's appearing.

  Copyright 2016-2020 Mike Battersby

  Released under the terms of the GNU General Public License version 2 (GPLv2).
  See the file LICENSE.txt.

----------------------------------------------------------------------------]]--

MountWaypoints = CreateFrame("Frame", "MountWaypoints", UIParent)

local MWP = MountWaypoints
MWP:SetScript("OnEvent", function (f, e, ...) if f[e] then f[e](f, ...) end end)

-- TomTom requires HereBeDragons so we must have it already
local HereBeDragons = LibStub("HereBeDragons-2.0")

function MWP:CollectedMount(id)
    if self.db.forceCollected.all ~= nil then
        return self.db.forceCollected.all
    end
    if self.db.forceCollected[id] ~= nil then
        return self.db.forceCollected[id]
    end
    local collected = select(11, C_MountJournal.GetMountInfoByID(id))
    return collected
end

-- Missing at least one of the argument mountIDs
function MWP:MissingMounts(...)
    local id
    for i = 1, select('#', ...) do
        id = select(i, ...)
        if self:CollectedMount(id) == false then
            return true
        end
    end
    return false
end

local defaults = { ['forceCollected'] = {} }

function MWP:PLAYER_LOGIN()
    MountWaypointsDB = MountWaypointsDB or CopyTable(defaults)

    self.db = MountWaypointsDB
    self.currentWaypoints = { }
    self.currentVignetteScans = { }
    self.currentNamePlateScans = { }

    self:RegisterEvent("PLAYER_ENTERING_WORLD")
    self:RegisterEvent("ZONE_CHANGED")
    self:RegisterEvent("ZONE_CHANGED_INDOORS")
    self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
    self:RegisterEvent("VIGNETTES_UPDATED")
    self:RegisterEvent("VIGNETTE_MINIMAP_UPDATED")
    self:RegisterEvent("NAME_PLATE_UNIT_ADDED")

    self:UpdateZone()

    SlashCmdList["MountWaypoints"] = function (...) self:SlashCommand(...) end
    SLASH_MountWaypoints1 = "/mwp"
end

function MWP:PLAYER_ENTERING_WORLD() self:UpdateZone() end
function MWP:ZONE_CHANGED() self:UpdateZone() end
function MWP:ZONE_CHANGED_INDOORS() self:UpdateZone() end
function MWP:ZONE_CHANGED_NEW_AREA() self:UpdateZone() end

function MWP:NAME_PLATE_UNIT_ADDED(unit)
    local alert = false

    for _, checkFunc in ipairs(self.currentNamePlateScans) do
        if checkFunc(unit) then
            alert = true
        end
    end

    if alert == true then
        local msg = format("MWP %s found", n)

        self:Print(msg)
        SendChatMessage(msg, "WHISPER", nil, UnitName("player"))
        PlaySound(11466)
        if not GetRaidTargetIndex(unit) then
            SetRaidTarget(unit, 6)
        end
    end
end

function MWP:PruneDeadWaypoints()
    for i = #self.currentWaypoints, 1, -1 do
        local wp = self.currentWaypoints[i]
        if not TomTom:IsValidWaypoint(wp) then
            table.remove(self.currentWaypoints, i)
        end
    end
end

function MWP:UpdateZone()

    self::PruneDeadWaypoints()

    local mapID = C_Map.GetBestMapForUnit('player')

    if mapID ~= self.currentMapID then

        while #self.currentWaypoints > 0 do
            TomTom:RemoveWaypoint(table.remove(self.currentWaypoints))
        end

        wipe(self.currentVignetteScans)
        wipe(self.currentNamePlateScans)

        self.currentMapID = mapID

        if not self.MapWaypointList[mapID] then
            return
        end

        for _,set in ipairs(self.MapWaypointList[mapID]) do
            if not set.check or set.check() then
                if set.vignetteScan then
                    tinsert(self.currentVignetteScans, set.vignetteScan)
                end
                if set.namePlateScan then
                    tinsert(self.currentNamePlateScans, set.namePlateScan)
                end
                for _,p in ipairs(set) do
                    local opts = { title = p[3], cleardistance = 20 }
                    if set.dontclear then opts.cleardistance = 0 end
                    local uid = TomTom:AddWaypoint(
                            mapID, p[1]/100.0, p[2]/100.0, opts
                        )
                    tinsert(self.currentWaypoints, uid)
                end
            end
        end 
    end

    -- On login HBD hasn't fired a timer event yet. Force an update so that
    -- the TomTom call doesn't error.

    HereBeDragons.UpdateCurrentPosition()
    local wp = TomTom:GetClosestWaypoint()
    if wp then
        TomTom:SetCrazyArrow(wp, 15, wp.title)
    end
end

function MWP:Print(...)
    local msg = format(...)
    local f = SELECTED_CHAT_FRAME or DEFAULT_CHAT_FRAME
    f:AddMessage(msg)
end

function MWP:VIGNETTE_MINIMAP_UPDATED(id)
    local info = C_VignetteInfo.GetVignetteInfo(id)

    if not info then return end

    local alert = false

    for _, checkFunc in ipairs(self.currentVignetteScans) do
        if checkFunc(info.name) then
            alert = true
            tDeleteItem(self.currentVignetteScans, checkFunc)
            break
        end
    end

    if alert == true then
        local msg = format("MWP %s found", info.name)

        self:Print(msg)
        SendChatMessage(msg, "WHISPER", nil, UnitName("player"))
        PlaySound(11466)
    end
end

function MWP:VIGNETTES_UPDATED()
    for _, id in ipairs(C_VignetteInfo.GetVignettes()) do
        self:VIGNETTE_MINIMAP_UPDATED(id)
    end
end

function MWP:Reset()
    self.currentMapID = nil
    self:UpdateZone()
end

function MWP:ShowAvailable()
    for mapID, mapData in pairs(self.MapWaypointList) do
        for _, data in ipairs(mapData) do
            if data.check() then
                local info = C_Map.GetMapInfo(mapID)
                local txt = format('%s: %s', info.name, data[1][3])
                SELECTED_CHAT_FRAME:AddMessage(txt)
            end
        end
    end
end

function MWP:SlashCommand(argstr)
    local args = { strsplit(" ", argstr) }
    local cmd = table.remove(args, 1)

    if cmd == "show" then
        if args[1] ~= 'all' then
            args[1] = tonumber(args[1])
        end
        if args[1] then
            self.db.forceCollected[args[1]] = false
        end
        self:Reset()
    elseif cmd == "hide" then
        if args[1] ~= 'all' then
            args[1] = tonumber(args[1])
        end
        if args[1] then
            self.db.forceCollected[args[1]] = true
        end
        self:Reset()
    elseif cmd == "show" then
        if args[1] == 'all' then
            wipe(self.db.forceCollected)
        else
            self.db.forceCollected[args[1]] = nil
        end
        self:Reset()
    elseif cmd == "refresh" then
        self:Reset()
    elseif cmd == "" then
        self:ShowAvailable()
    end
    return true
end

MWP:RegisterEvent("PLAYER_LOGIN")
