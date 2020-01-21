--[[----------------------------------------------------------------------------

----------------------------------------------------------------------------]]--

local MWP = MountWaypoints

MWP.MapWaypointList = {
    -- Arathi Highlands
    [14] = {
        {
            check = function ()
                    return UnitFactionGroup('player') == 'Horde'
                        and not IsQuestFlaggedCompleted(53088)
                        and MWP:MissingMounts(1173)
                end,
            { 49.27, 40.05, "Knight-Captain Aldrin (Broken Highland Mustang)" },
        },
        {
            check = function ()
                    return MWP:MissingMounts(1183)
                        and not IsQuestFlaggedCompleted(53022)
                        and not IsQuestFlaggedCompleted(53526)
                end,
            { 57.15, 45.75, "Skullripper" },
        },
        {
            check = function ()
                    return UnitFactionGroup('player') == 'Alliance'
                        and not IsQuestFlaggedCompleted(53085)
                        and MWP:MissingMounts(1174)
                end,
            { 53.97, 56.96, "Doomrider Helgrim (Highland Mustang)" },
        },
        {
            check = function ()
                    return MWP:MissingMounts(1185)
                        and not IsQuestFlaggedCompleted(53091)
                        and not IsQuestFlaggedCompleted(53517)
                end,
            { 67.48, 60.58, "Nimar the Slayer (Witherbark Direwing)" },
        },
        {
            check = function ()
                    return MWP:MissingMounts(1180)
                        and not IsQuestFlaggedCompleted(53083)
                        and not IsQuestFlaggedCompleted(53504)
                end,
            { 67.06, 65.89, "Beastrider Kama (Swift Albino Raptor)" },
        },
        {
            check = function ()
                    return UnitFactionGroup('player') == 'Alliance'
                        and not IsQuestFlaggedCompleted(53014)
                        and MWP:MissingMounts(1182)
                end,
            { 33.44, 36.94, "Overseer Krix (Lil' Donkey - In Cave)" },
        },
        {
            check = function ()
                    return UnitFactionGroup('player') == 'Horde'
                        and MWP:MissingMounts(1182)
                        and not IsQuestFlaggedCompleted(53518)
                end,
            { 27.46, 55.89, "Overseer Krix (Lil' Donkey - In Cave)" },
        },
    },

    -- Darkshore
    [62] = {
        {
            check = function ()
                    return UnitFactionGroup('player') == 'Alliance'
                        and not IsQuestFlaggedCompleted(54883)
                        and MWP:MissingMounts(1199)
                end,
            { 49.66, 24.93, "Agathe Wyrmwood (Blackpaw)" },
        },
        {
            check = function ()
                    return UnitFactionGroup('player') == 'Horde'
                        and not IsQuestFlaggedCompleted(54890)
                        and MWP:MissingMounts(1199)
                end,
            { 49.66, 24.93, "Blackpaw" },
        },
        {
            check = function ()
                    return MWP:MissingMounts(1200)
                        and not IsQuestFlaggedCompleted(54695)
                        and not IsQuestFlaggedCompleted(54696)
                end,
            { 56.44, 30.77, "Alash'anir (Ashenvale Chimaera)" },
        },
        {
            check = function ()
                    return MWP:MissingMounts(1201)
                end,
            namePlateScan = function (unit)
                    return UnitName(unit) == 'Frightened Kodo'
                end,
            { 41, 65, "Frightened Kodo" },
        },
        {
            check = function ()
                    return UnitFactionGroup('player') == 'Alliance'
                        and not IsQuestFlaggedCompleted(54427)
                        and MWP:MissingMounts(1203)
                end,
            { 65, 20, "Moxo the Beheader (Captured Umber Nightsaber)" },
        },
        {
            check = function ()
                    return UnitFactionGroup('player') == 'Horde'
                        and not IsQuestFlaggedCompleted(54431) -- 54427?
                        and MWP:MissingMounts(1203)
                end,
            { 41.66, 75.33, "Athil Dewfire (Captured Umber Nightsaber)" },
        },
        {
            check = function ()
                    return UnitFactionGroup('player') == 'Horde'
                        and not IsQuestFlaggedCompleted(54892)
                        and MWP:MissingMounts(1205)
                end,
            { 39.77, 32.91, "Shadowclaw (Kaldorei Nightsaber)" },
        },
        {
            check = function ()
                    return UnitFactionGroup('player') == 'Alliance'
                        and not IsQuestFlaggedCompleted(54886)
                        and MWP:MissingMounts(1205)
                end,
            { 50.6, 32.4, "Croz Bloodrage (Kaldorei Nightsaber)" },
        },
    },

    -- Storm Peaks
    [120] = {
        {
            check = function () return MWP:MissingMounts(265) end,
            { 31.6, 69.7, "TLPD Bor's Breath" },
            { 35.3, 76.8, "TLPD Bor's Fall" },
            { 51.1, 71.2, "TLPD Brunnhildar" },
            { 52.2, 35.0, "TLPD Ulduar" },
        }
    },


    -- Abyssal Depths, Vashj'ir
    [204] = {
        {
            check = function () return MWP:MissingMounts(420) end,
            {  41.0, 74.0, "Poseidus Spawn" },
        },
    },

    -- Shimmering Expanse, Vashj'ir
    [205] = {
        {
            check = function () return MWP:MissingMounts(420) end,
            {  66.0, 43.0, "Poseidus Spawn" },
            {  58.0, 83.0, "Poseidus Spawn" },
            {  46.0, 50.0, "Poseidus Spawn" },
            {  40.0, 67.0, "Poseidus Spawn" },
        }
    },

    -- Deepholm
    [207] = {
        {
            check = function () return MWP:MissingMounts(393) end,
            { 42.6, 48.2, "Aeonaxx Spawn W" },
            { 45.4, 43.4, "Aeonaxx Spawn NW" },
            { 51.6, 42.8, "Aeonaxx Spawn NE" },
            { 43.0, 59.0, "Aeonaxx Spawn SW" },
            { 51.8, 63.4, "Aeonaxx Spawn S" },
        }
    },

    -- The Jade Forest
    [371] = {
        {
            check = function () return MWP:MissingMounts(534, 535, 536) end,
            vignetteScan = function (n) return n:match("Warbringer") end,
            { 52.73, 18.99, "Zandalari Warbringer" },
        }
    },

    -- Kun-Lai Summit
    [379] = {
        {
            check = function () return MWP:MissingMounts(534, 535, 536) end,
            vignetteScan = function (n) return n:match("Warbringer") end,
            { 75.09, 67.65, "Zandalari Warbringer" },
        }
    },

    -- Townlong Steppes
    [388] = {
        {
            check = function () return MWP:MissingMounts(534, 535, 536) end,
            vignetteScan = function (n) return n:match("Warbringer") end,
            { 36.53, 85.67, "Zandalari Warbringer" },
        }
    },

    -- Krasarang Wilds, only Slate spawns there
    [418] = {
        {
            check = function () return MWP:MissingMounts(535) end,
            vignetteScan = function (n) return n:match("Warbringer") end,
            { 39.08, 67.13, "Zandalari Warbringer" },
        }
    },

    -- Dread Wastes
    [422] = {
        {
            check = function () return MWP:MissingMounts(534, 535, 536) end,
            vignetteScan = function (n) return n:match("Warbringer") end,
            { 47.47, 61.32, "Zandalari Warbringer" },
        }
    },

    -- Frostfire Ridge --
    [525] = {
        {
            check = function () return MWP:MissingMounts(627) end,
            vignetteScan = function (n) return n:match("Gorok") end,
            { 63.4, 79.4, "Gorok Spawn" },
            { 22.8, 66.4, "Gorok Spawn" },
            { 64.8, 53.0, "Gorok Spawn" },
            { 51.8, 50.6, "Gorok Spawn" },
            { 58.0, 18.4, "Gorok Spawn" },
        },
        {
            check = function () return MWP:MissingMounts(682) end,
            { 51.10, 19.86, "Edge of Reality" },
            { 52.40, 18.18, "Edge of Reality" },
            { 53.80, 17.46, "Edge of Reality" },
            { 47.70, 27.57, "Edge of Reality" },
        }
    },

    -- Talador --
    [535] = {
        {
            check = function () return MWP:MissingMounts(630) end,
            vignetteScan = function (n) return n:match("Silthide") end,
            { 78.9, 55.4, "Silthide Spawn" },
            { 67.4, 60.0, "Silthide Spawn" },
            { 61.8, 32.2, "Silthide Spawn" },
            { 62.0, 45.0, "Silthide Spawn" },
            { 55.6, 80.6, "Silthide Spawn" },
        },
        {
            check = function () return MWP:MissingMounts(682) end,
            { 39.88, 55.61, "Edge of Reality" },
            { 46.26, 52.56, "Edge of Reality" },
            { 47.16, 48.82, "Edge of Reality" },
            { 52.14, 41.13, "Edge of Reality" },
            { 52.30, 25.00, "Edge of Reality" },
            { 52.62, 34.62, "Edge of Reality" },
            { 50.96, 32.41, "Edge of Reality" },
        }
    },

    -- Shadowmoon Valley (Draenor) --
    [539] = {
        {
            check = function () return MWP:MissingMounts(636) end,
            vignetteScan = function (n) return n:match("Pathrunner") end,
            { 54.0, 30.4, "Pathrunner Spawn" },
            { 43.0, 32.2, "Pathrunner Spawn" },
            { 39.6, 36.6, "Pathrunner Spawn" },
            { 44.6, 43.8, "Pathrunner Spawn" },
            { 56.2, 52.4, "Pathrunner Spawn" },
            { 45.8, 68.2, "Pathrunner Spawn" },
        },
        {
            check = function () return MWP:MissingMounts(682) end,
            { 41.90, 75.70, "Edge of Reality" },
            { 43.79, 70.96, "Edge of Reality" },
            { 48.95, 70.26, "Edge of Reality" },
            { 50.33, 71.53, "Edge of Reality" },
            { 50.90, 72.50, "Edge of Reality" },
            { 51.68, 74.85, "Edge of Reality" },
        }
    },

    -- Spires of Arak
    [542] = {
        {
            check = function () return MWP:MissingMounts(682) end,
            { 36.43, 18.3, "Edge of Reality" },
            { 47.0, 20.1, "Edge of Reality" },
            { 50.4,  6.1, "Edge of Reality" },
            { 60.8, 11.23, "Edge of Reality" },
        },
    },

    -- Gorgrond
    [543] = {
        {
            check = function () return MWP:MissingMounts(655) end,
            vignetteScan = function (n) return n:match("Poundfist") end,
            { 47.0, 54.1, "Poundfist Spawn" },
            { 43.2, 55.5, "Poundfist Spawn" },
            { 45.4, 47.5, "Poundfist Spawn" },
            { 51.4, 43.1, "Poundfist Spawn" },
            { 42.0, 25.0, "Poundfist Spawn" },
        },
        {
            check = function () return MWP:MissingMounts(682) end,
            { 51.6, 38.8, "Edge of Reality" },
            { 54.0, 45.8, "Edge of Reality" },
            { 56.0, 40.7, "Edge of Reality" },
            { 43.3, 34.2, "Edge of Reality" },
        }
    },

    -- Nagrand (Draenor)
    [550] = {
        {
            check = function () return MWP:MissingMounts(612) end,
            vignetteScan = function (n) return n:match("Nakk") end,
            { 62.8, 15.4, "Nakk the Thunderer Spawn" },
            { 62.4, 17.0, "Nakk the Thunderer Spawn" },
            { 64.6, 19.6, "Nakk the Thunderer Spawn" },
            { 55.0, 35.0, "Nakk the Thunderer Spawn" },
            { 50.0, 34.4, "Nakk the Thunderer Spawn" },
        },
        {
            check = function () return MWP:MissingMounts(614) end,
            vignetteScan = function (n) return n:match("Luk'hok") end,
            { 66.6, 44.0, "Luk'hok Spawn" },
            { 76.2, 31.8, "Luk'hok Spawn" },
            { 72.8, 53.6, "Luk'hok Spawn" },
            { 79.2, 56.0, "Luk'hok Spawn" },
            { 84.6, 63.6, "Luk'hok Spawn" },
            { 83.8, 63.6, "Luk'hok Spawn" },
        },
        {
            check = function () return MWP:MissingMounts(682) end,
            { 40.5, 47.6, "Edge of Reality" },
            { 44.0, 30.7, "Edge of Reality" },
            { 57.3, 26.7, "Edge of Reality" },
        }
    },

    -- Aszuna (Long-Forgotten Hippogryph)
    [630] = {
        {
            check = function () return MWP:MissingMounts(802) end,
            { 29.90, 26.55, "(on island)" },
            { 30.30, 23.95, "(In the cave)" },
            { 29.85, 35.87, "(Between some dead trees)" },
            { 30, 36, "(in the corner crack between the hills on an island)" },
            { 34.91, 17.15, "(Behind the ruins)" },
            { 34.8, 35.3, "(on another cliff edge)" },
            { 34.6, 35.7, "(in cave at the bottom of the hill)" },
            { 35, 22, "(beachside near the water)" },
            { 35.72, 25.07, "(Beside the tree with the lantern and fence, to the left of the path)" },
            { 36.6, 12.2, "(out in the open)" },
            { 36, 23, "(between 2 trees on the road)" },
            { 35.6, 37.8, "(Next to tree - Llothien Highlands)" },
            { 36, 36, "(on cliff edge)" },
            { 37, 21.75, "(By the tree)" },
            { 37.5, 32.9, "(nor'danil wellspring - behind the wall next to bush and tree)" },
            { 38.69, 9.31, "(on green land next to bush)" },
            { 40.3, 32.8, "(next to tree)" },
            { 40.55, 37.6, "(center of road - beside tree)" },
            { 40.72, 35.90, "(next to tree)" },
            { 41.4, 31, "(inside Llothien Grizzly Cave to the right)" },
            { 41.50, 31.00, "(Inside the cave)" },
            { 42.2, 8.5, "(on hillside)" },
            { 42.66, 18.06, "(inside Runa’s Hovel Cave on rock between spine and skull)" },
            { 42.2, 62.3, "(on the hill near the Cove Skrog)" },
            { 43, 28, "(behind tree next to Doomlord Kazrok)" },
            { 44.1, 59.8, "(on the tiny hill next to the ship)" },
            { 45.5, 17.2, "(next to the lake, where lake turns to river)" },
            { 45.42, 45.42, "(Next to tree, east of Illidari Stand flight path)" },
            { 45, 53.6, "(at the coast, inside the broken half of a ship (hard to see from almost every angle)" },
            { 46.56, 8.53, "(in the lost Orchard next to tree)" },
            { 46.90, 17.75, "(At the top of the slope)" },
            { 46.9, 49, "(up on hill (above the neutral giants - behind tree)" },
            { 46.58, 53.60, "(Between some rocks, by the sleeping bears)" },
            { 47.1, 25.8, "(Next to the blue crystal lake where Senegos lies)" },
            { 47.2, 33, "(next to the river)" },
            { 47.30, 61.90, "(Between 2 rocks)" },
            { 48.88, 45.61, "(On a rock)" },
            { 48, 48, "(next to the two neutral giants at the bottom of the valley)" },
            { 48.05, 52.70, "(In the cave next to some piles of gold)" },
            { 48.57, 57.28, "(inside broken ship inside Giant’s cave)" },
            { 49, 8, "(on little rock inside Lair of the Deposed cave)" },
            { 49.4, 24, "(inside bushes, behind shrine, up on a hill (overlooking Azurewing Repose)" },
            { 49.39, 27.70, "(next to tree - a little hidden)" },
            { 49.3, 31.5, "(a bit south from Azurewing Repose, Corner of hill behind bush)" },
            { 49.30, 50.55, "(Behind the sleeping giant)" },
            { 49.18, 53.54, "(On a cliff just above the bridge where Warbringer Mox'na patrols)" },
            { 49.28, 58.03, "(By the broken pillar right next to bride and groom)" },
            { 50.5, 16.4, "(between 3 trees on the left with one of those unicorn horses)" },
            { 50.5, 20.3, "(inside Inside Layhallow (crystal) cave at 47.9, 24.8)" },
            { 50, 33.1, "(Next to shells and hut in murloc area)" },
            { 50.73, 49.89, "(inside the cave with some neutral NPCs at Shipwreck Arena)" },
            { 50.48, 56.99, "(in the cave to the left, close to eternal bride and groom)" },
            { 51.4, 37.6, "(underwater closer to Mrrgrl rare elite)" },
            { 51, 65, "(next to the tied rope around the poles)" },
            { 51, 75, "(island of watchers cave by roots)" },
            { 51.8, 57.6, "(Corner next to broken ship in Oceanus Cove)" },
            { 52.4, 13.4, "(next to tree - Rhut'van Passage)" },
            { 52.29, 25.10, "(off road, next to tree (a little hidden)" },
            { 52.15, 31.85, "(By the shrine)" },
            { 52.96, 35.94, "(Under the water next to Narthalas Academy)" },
            { 52.7, 57.9, "(Up on hill around giants)" },
            { 53.36, 26.08, "(Between the 3 trees, to the left of the path)" },
            { 53.70, 28.05, "(In the cave by the river)" },
            { 53.61, 63.36, "(By torch inside alcove)" },
            { 54.33, 26.03, "(next to roots of tree)" },
            { 54.8, 28, "(behind tree next to lake)" },
            { 54.1, 27.6, "(behind cement hut in bushes)" },
            { 54.8, 28, "(behind tree next to lake)" },
            { 54.5, 33.5, "(In lake next to basilisks)" },
            { 54.85, 52.25, "(Inside cave where Cole neutral mob is)" },
            { 55.55, 10.30, "(Up the side of the cliff)" },
            { 55.9, 29.4, "(inside the three pillars to the right of the building where Pridelord Meowl is)" },
            { 55.56, 32.72, "(Bottom of cliff, next to tree)" },
            { 55, 55, "(bottom of hill)" },
            { 56, 12, "(By the pink flower)" },
            { 56.9, 38.84, "(at the edge of land and water)" },
            { 56.92, 26, "(inside the cave in Llothein, entrance is at 55.74, 25.46)" },
            { 56, 40, "(in the lake under the bridge)" },
            { 57.40, 16.79, "(At Ley-Ruins of Zarkhenar on edge of hill)" },
            { 57.5, 26.6, "(next to the road)" },
            { 57, 31, "(next to tree in the middle of circle)" },
            { 57.69, 42.31, "(Inside cave with big giant)" },
            { 58.22, 24.65, "(By tree on the top of cliff)" },
            { 58.81, 45.02, "(In cave at Ruins of Nar’thalas on rock between spine and skull (Commander Eksis mob in there)" },
            { 59.75, 27.84, "(behind tree)" },
            { 59.7, 37.7, "(on edge of hill next to tree)" },
            { 59.06, 37.48, "(near the female NE statue)" },
            { 59.3, 38.3, "(behind naga tent)" },
            { 60, 17, "(next to tree)" },
            { 60, 27.8, "(behind tree)" },
            { 60.1, 35, "(Next to broken pillar next to the middle of the road split)" },
            { 60.2, 54.6, "(near the shadowfiends under little half tent)" },
            { 60.4, 46.7, "(to the right of the blue teleporter cave)" },
            { 60, 49, "(bottom edge of the hill in Olivian Veil)" },
            { 61.1, 30.4, "(in the cave on the rock to the right)" },
            { 61.9, 30.9, "(behind tree up on hill)" },
            { 61.6, 40.1, "(next to tree near eye of Azshara portal)" },
            { 62.25, 35.90, "(By the trees)" },
            { 62.3, 40.5, "(next to naga tent)" },
            { 62.65, 52.46, "(Olivian Veil next to tree)" },
            { 62.2, 54.7, "(next to the tree)" },
            { 63.38, 46.14, "(Under tree)" },
            { 63.48, 54, "(Gloombound Barrow 63.48, 54.00 in the cave that you fight an eradar for the imps quest)" },
            { 64, 34, "(near the crossroads near the table in The Empyrean Society Enclave)" },
            { 65.4, 29.5, "(at felblaze inside stump of big tree)" },
            { 65.4, 38.4, "(On the hill)" },
            { 65.5, 42.4, "(next to water, near bridge in the corner of Hatecoil Warcamp)" },
            { 65.15, 50.82, "(Under tree)" },
            { 67.7, 32.8, "(Felblaze Ingress - down hill near water)" },
            { 67, 46, "(next to the log)" },
            { 67.1, 52, "(outside doorway to building -The Ruined Sanctum)" },
            { 68.2, 24.3, "(Farondale- north of the demon camp; very much visible from a great distance)" },
        }
    },
    -- Korkrun
    [830] = {
        {
            check = function () return MWP:MissingMounts(906, 974, 975, 976) and not IsQuestFlaggedCompleted(48667) end,
            { 70.5, 33.7, "Naroua (Fel-Spotted Egg)" },
        },
    },
    -- Vol'dun
    [864] = {
        {
            check = function () return MWP:MissingMounts(1329) end,
            namePlateScan = function (unit)
                    return UnitName(unit) == 'Elusive Quickhoof'
                end,
            { 26.4, 52.5, "Elusive Quickhoof 10" },
            { 28.0, 65.0, "Elusive Quickhoof 1" },
            { 31.1, 67.3, "Elusive Quickhoof 9" },
            { 42.0, 60.0, "Elusive Quickhoof 6" },
            { 43.0, 69.0, "Elusive Quickhoof 7" },
            { 51.1, 85.9, "Elusive Quickhoof 2" },
            { 52.5, 89.0, "Elusive Quickhoof 3" },
            { 54.6, 53.2, "Elusive Quickhoof 4" },
            { 54.0, 83.0, "Elusive Quickhoof 8" },
            { 55.0, 73.0, "Elusive Quickhoof 5" },
        },
    },
    -- Mac'aree
    [882] = {
        {
            check = function () return MWP:MissingMounts(906, 974, 975, 976) and not IsQuestFlaggedCompleted(48697) end,
            { 38.7, 55.8, "Kaara the Pale (Fel-Spotted Egg)" },
        },
        {
            check = function () return MWP:MissingMounts(906, 974, 975, 976) and not IsQuestFlaggedCompleted(48712) end,
            { 44.2, 49.8, "Sabuul (Fel-Spotted Egg)" },
        },
        {
            check = function () return MWP:MissingMounts(973) and not IsQuestFlaggedCompleted(48705) end,
            { 33.7, 47.5, "Venomtail Skyfin (Lambent Mana Ray)" },
        },
        {
            check = function () return MWP:MissingMounts(970) and not IsQuestFlaggedCompleted(48695) end,
            { 55.7, 59.9, "Wrangler Kravos (Maddened Chaosrunner)" },
        },
        {
            check = function () return MWP:MissingMounts(980) and not IsQuestFlaggedCompleted(48721) end,
            { 49.7, 9.9, "Skreeg the Devourer (Acid Belcher)" },
        },
    },
    -- Antoran Wastes
    [885] = {
        {
            check = function () return MWP:MissingMounts(906, 974, 975, 976) and not IsQuestFlaggedCompleted(48812) end,
            { 64.3, 48.2, "Varga (Fel-Spotted Egg)" },
        },
        {
            check = function () return MWP:MissingMounts(979) and not IsQuestFlaggedCompleted(49183) end,
            { 61.7, 37.2, "Blistermaw (Crimson Slavermaw)" },
        },
        {
            check = function () return MWP:MissingMounts(955) and not IsQuestFlaggedCompleted(48821) end,
            { 63.1, 25.2, "Houndmaster Kerrax (Vile Fiend)" },
        },
        {
            check = function () return MWP:MissingMounts(981) and not IsQuestFlaggedCompleted(48810) end,
            { 53.1, 35.8, "Vrax'thul (Biletooth Gnasher)" },
        },
        {
            check = function () return MWP:MissingMounts(981) and not IsQuestFlaggedCompleted(48809) end,
            { 65.6, 26.6, "Puscilla (Biletooth Gnasher)" },
        },
    },
    -- Nazjatar
    [1355] = {
        {
            check = function () return MWP:MissingMounts(1258) end,
            vignetteScan = function (n) return n:match("Fabious") end,
            { 25.6, 29.3, "Fabious, Bloodfin Village" },
            { 38.5, 13.0, "Fabious, Chitterspine Caverns" },
            { 47.5, 83.0, "Fabious, Tide's Fall" },
            { 78.0, 52.9, "Fabious, Drowned Market" },
        },
        {
            check = function () return MWP:MissingMounts(1257) and not IsQuestFlaggedCompleted(56298) end,
            vignetteScan = function (n) return n:match("Soundless") and not IsQuestFlaggedCompleted(56298) end,
            { 53.8, 42.2, "Soundless (Silent Glider)" },
            { 54.6, 50.4, "Soundless (Silent Glider)" },
            { 58.2, 52.4, "Soundless (Silent Glider)" },
        },
        {
            namePlateScan = function (unit)
                local guid = UnitGUID(unit)
                if guid and select(6, strsplit('-', guid)) == '152361' then
                    return true
                end
            end
        },
    },
    -- Mechagon
    [1462] = {
        {
            check = function () return MWP:MissingMounts(1248) and not IsQuestFlaggedCompleted(55811) end,
            vignetteScan = function (n) return n:match("Rustfeather") and not IsQuestFlaggedCompleted(55811) end,
            { 65.7, 78.3, "Rustfeather (Junkheap Drifter)" },
        },
        {
            check = function () return MWP:MissingMounts(1229) and not IsQuestFlaggedCompleted(55512) end,
            vignetteScan = function (n) return n:match("Arachnoid Harvester") and not IsQuestFlaggedCompleted(55512) end,
            { 52.0, 41.4, "Arachnoid Harvester (Rusty Mechanocrawler)" },
        },
    },
    -- Uldum (BfA)
    [1527] = {
        {
            check = function () return MWP:MissingMounts(1317) and not IsQuestFlaggedCompleted(57273) end,
            vignetteScan = function (n) return n:match("Rotfeaster") end,
            { 68.23, 31.97, "Rotfeaster (Waste Marauder)" },
        },
        {
            check = function () return MWP:MissingMounts(1314) and not IsQuestFlaggedCompleted(57259) end,
            vignetteScan = function (n) return n:match("Ishak of the Four Winds ") end,
            { 73.8, 83.6, "Ishak of the Four Winds" },
        },
        {
            check = function () return MWP:MissingMounts(1319) and not IsQuestFlaggedCompleted(58696) end,
            vignetteScan = function (n) return n:match("Corpse Eater") end,
            { 30.8, 49.7, "Corpse Eater (Malevolent Drone)" },
        },
    },
    -- Vale of Eternal Blossoms (BfA)
    [1530] = {
        {
            check = function () return MWP:MissingMounts(1328) end,
            vignetteScan = function (n) return n:match("Anh-De the Loyal") end,
            { 34.1, 68.0, "Anh-De the Loyal (Xinlao)" }
        },
        {
            check = function () return MWP:MissingMounts(1327) end,
            vignetteScan = function (n) return n:match("Houndlord Ren") end,
            { 9.0, 37.5, "Houndlord Ren (Ren's Stalwart Hound)" }
        },
        {
            check = function () return MWP:MissingMounts(1297) end,
            vignetteScan = function (n) return n:match("Ha-Li") end,
            { 36.6, 37.6, "Ha-Li (Clutch of Ha-Li)" }
        },
    },
}
