// Super Metroid autosplitter, hosted at:
// https://github.com/notwa/AutoSplitters/tree/rewrite
//
// Basic format of the script is based on:
// https://github.com/Spiraster/ASLScripts/tree/master/LiveSplit.SMW
// https://github.com/UNHchabo/AutoSplitters
//
// Most of the RAM values taken from:
// https://jathys.zophar.net/supermetroid/kejardon/RAMMap.txt

state("higan"){}
state("bsnes"){}
state("snes9x"){}
state("snes9x-x64"){}
state("emuhawk"){}
state("retroarch"){}
state("lsnes-bsnes"){}

startup
{
    string activeCategory = null; // null is valid, it means no categorization

    Action<string, bool, string, string> MakeSetting =
    (settingName, defaultState, displayName, description) => {
        settings.Add(settingName, defaultState, displayName, activeCategory);
        settings.SetToolTip(settingName, description);
    };

    Action<string, bool, string, string, string> MakeSubcategory =
    (categoryName, defaultState, parent, displayName, description) => {
        activeCategory = parent;
        MakeSetting(categoryName, defaultState, displayName, description);
        activeCategory = categoryName;
    };

    Action<string, bool, string, string> MakeCategory =
    (categoryName, defaultState, displayName, description) => {
        MakeSubcategory(categoryName, defaultState, null, displayName, description);
    };

    MakeCategory("ammoPickups", true,
                 "Ammo Pickups", "Split on Missiles, Super Missiles, and Power Bombs");
    MakeSetting("firstMissile", false,
                "First Missiles", "Split on the first Missile pickup");
    MakeSetting("firstSuper", false,
                "First Supers", "Split on the first Super Missile pickup");
    MakeSetting("firstPowerBomb", true,
                "First Power Bomb", "Split on the first Power Bomb pickup");
    MakeSetting("allMissiles", false,
                "All Missiles", "Split on each Missile upgrade");
    MakeSetting("allSupers", false,
                "All Super Missiles", "Split on each Super Missile upgrade");
    MakeSetting("allPowerBombs", false,
                "All Power Bombs", "Split on each Power Bomb upgrade");

    MakeSubcategory("specificMissiles", false, "ammoPickups",
                    "Specific Missile Packs", "Split on specific Missile Pack locations");

    MakeSubcategory("crateriaMissiles", false, "specificMissiles",
                    "Crateria Missile Packs", "Split on Crateria Missile Pack locations");
    MakeSetting("oceanBottomMissiles", false,
                "Ocean Bottom Missile Pack", "Split on picking up the Missile Pack located at the bottom left of the West Ocean");
    MakeSetting("oceanTopMissiles", false,
                "Ocean Top Missile Pack", "Split on picking up the Missile Pack located in the ceiling tile in West Ocean");
    MakeSetting("oceanMiddleMissiles", false,
                "Ocean Middle Missile Pack", "Split on picking up the Missile Pack located in the Morphball maze section of West Ocean");
    MakeSetting("moatMissiles", false,
                "Moat Missile Pack", "Split on picking up the Missile Pack in The Moat, also known as The Lake");
    MakeSetting("oldTourianMissiles", false,
                "Old Tourian Missile Pack", "Split on picking up the Missile Pack in the Pit Room");
    MakeSetting("gauntletRightMissiles", false,
                "Gauntlet Right Missile Pack", "Split on picking up the right side Missile Pack at the end of Gauntlet(Green Pirates Shaft)");
    MakeSetting("gauntletLeftMissiles", false,
                "Gauntlet Left Missile Pack", "Split on picking up the left side Missile Pack at the end of Gauntlet(Green Pirates Shaft)");
    MakeSetting("dentalPlan", false,
                "Dental Plan Missile Pack", "Split on picking up the Missile Pack located in The Final Missile");

    MakeSubcategory("brinstarMissiles", false, "specificMissiles",
                    "Brinstar Missile Packs", "Split on Brinstar Missile Pack locations");
    MakeSetting("earlySuperBridgeMissiles", false,
                "Early Supers Under Bridge Missile Pack", "Split on picking up the Missile Pack located below the crumble bridge in the Early Supers Room");
    MakeSetting("greenBrinstarReserveMissiles", false,
                "Brinstar Reserve Missile Pack", "Split on picking up the first Missile Pack behind the Brinstar Reserve Tank");
    MakeSetting("greenBrinstarExtraReserveMissiles", false,
                "Brinstar Reserve Missile Pack 2", "Split on picking up the second Missile Pack behind the Brinstar Reserve Tank Room");
    MakeSetting("bigPinkTopMissiles", false,
                "Big Pink Top Missile Pack", "Split on picking up the Missile Pack located left of center in Big Pink");
    MakeSetting("chargeMissiles", false,
                "Charge Missile Pack", "Split on picking up the Missile Pack located at the bottom left of Big Pink");
    MakeSetting("greenHillsMissiles", false,
                "Green Hills Missile Pack", "Split on picking up the Missile Pack in Green Hill Zone");
    MakeSetting("blueBrinstarETankMissiles", false,
                "Classic Brinstar East Missile Pack", "Split on picking up the Missile Pack in the Blue Brinstar Energy Tank Room");
    MakeSetting("alphaMissiles", false,
                "Alpha Missile Pack", "Split on picking up the first Missile Pack of the game(First Missile Room)");
    MakeSetting("billyMaysMissiles", false,
                "Billy Mays Missile Pack", "Split on picking up the Missile Pack located on the pedestal in Billy Mays' Room");
    MakeSetting("butWaitTheresMoreMissiles", false,
                "But Wait... There's MORE! Missile Pack", "Split on picking up the Missile Pack located in the floor of Billy Mays' Room");
    MakeSetting("redBrinstarMissiles", false,
                "Red Brinstar Missile Pack", "Split on picking up the Missile Pack in the Alpha Power Bombs Room");
    MakeSetting("warehouseMissiles", false,
                "Warehouse Missile Pack", "Split on picking up the Missile Pack in the Warehouse Kihunter Room");

    MakeSubcategory("norfairMissiles", false, "specificMissiles",
                    "Norfair Missile Packs", "Split on Norfair Missile Pack locations");
    MakeSetting("cathedralMissiles", false,
                "Cathedral Missile Pack", "Split on picking up the Missile Pack in Cathedral");
    MakeSetting("crumbleShaftMissiles", false,
                "Crumble Shaft Missile Pack", "Split on picking up the Missile Pack in Crumble Shaft");
    MakeSetting("crocomireEscapeMissiles", false,
                "Crocomire Escape Missile Pack", "Split on picking up the Missile Pack in Crocomire Escape");
    MakeSetting("hiJumpMissiles", false,
                "Hi Jump Missile Pack", "Split on picking up the Missile Pack in the Hi Jump Energy Tank Room");
    MakeSetting("postCrocomireMissiles", false,
                "Post Crocomire Missile Pack", "Split on picking up the Missile Pack in the Post Crocomire Missile Room, also known as Cosine Room");
    MakeSetting("grappleMissiles", false,
                "Grapple Missile Pack", "Split on picking up the Missile Pack in the Post Crocomire Jump Room");
    MakeSetting("norfairReserveMissiles", false,
                "Norfair Reserve Missile Pack", "Split on picking up the Missile Pack in the Norfair Reserve Tank Room");
    MakeSetting("greenBubblesMissiles", false,
                "Green Bubbles Missile Pack", "Split on picking up the Missile Pack in the Green Bubbles Missile Room");
    MakeSetting("bubbleMountainMissiles", false,
                "Bubble Mountain Missile Pack", "Split on picking up the Missile Pack in Bubble Mountain");
    MakeSetting("speedBoostMissiles", false,
                "Speed Booster Missile Pack", "Split on picking up the Missile Pack in Speed Booster Hall");
    MakeSetting("waveMissiles", false,
                "Wave Beam Missile Pack", "Split on picking up the Wave Missile Pack in Double Chamber");
    MakeSetting("goldTorizoMissiles", false,
                "Golden Torizo Missile Pack", "Split on picking up the Missile Pack in the Golden Torizo's Room");
    MakeSetting("mickeyMouseMissiles", false,
                "Mickey Mouse Missile Pack", "Split on picking up the Missile Pack in the Mickey Mouse Room");
    MakeSetting("lowerNorfairSpringMazeMissiles", false,
                "Lower Norfair Springball Maze Missile Pack", "Split on picking up the Missile Pack in the Lower Norfair Springball Maze Room");
    MakeSetting("threeMusketeersMissiles", false,
                "Three Musketeers Missile Pack", "Split on picking up the Missile Pack in the The Musketeers' Room");

    MakeSubcategory("wreckedShipMissiles", false, "specificMissiles",
                    "Wrecked Ship Missile Packs", "Split on Wrecked Ship Missile Pack locations");
    MakeSetting("wreckedShipMainShaftMissiles", false,
                "Wrecked Ship Main Shaft Missile Pack", "Split on picking up the Missile Pack in Wrecked Ship Main Shaft");
    MakeSetting("bowlingMissiles", false,
                "Bowling Alley Missile Pack", "Split on picking up the Missile Pack in Bowling Alley");
    MakeSetting("atticMissiles", false,
                "Attic Missile Pack", "Split on picking up the Missile Pack in the Wrecked Ship East Missile Room");

    MakeSubcategory("maridiaMissiles", false, "specificMissiles",
                    "Maridia Missile Packs", "Split on Maridia Missile Pack locations");
    MakeSetting("mainStreetMissiles", false,
                "Main Street Missile Pack", "Split on picking up the Missile Pack in Main Street");
    MakeSetting("mamaTurtleMissiles", false,
                "Mama Turtle Missile Pack", "Split on picking up the Missile Pack in the Mama Turtle Room");
    MakeSetting("wateringHoleMissiles", false,
                "Watering Hole Missile Pack", "Split on picking up the Missile Pack in Watering Hole");
    MakeSetting("beachMissiles", false,
                "Beach Missile Pack", "Split on picking up the Missile Pack in the Pseudo Plasma Spark Room");
    MakeSetting("leftSandPitMissiles", false,
                "Left Sand Pit Missile Pack", "Split on picking up the Missile Pack in West Sand Hole");
    MakeSetting("rightSandPitMissiles", false,
                "Right Sand Pit Missile Pack", "Split on picking up the Missile Pack in East Sand Hole");
    MakeSetting("aqueductMissiles", false,
                "Aqueduct Missile Pack", "Split on picking up the Missile Pack in Aqueduct");
    MakeSetting("preDraygonMissiles", false,
                "Pre Draygon Missile Pack", "Split on picking up the Missile Pack in The Precious Room");

    MakeSubcategory("specificSupers", false, "ammoPickups",
                    "Specific Super Missile Packs", "Split on specific Super Missile Pack locations");
    MakeSetting("climbSupers", false,
                "Crateria Super Missile Pack", "Split on picking up the Super Missile Pack in the Crateria Super Room");
    MakeSetting("sporeSpawnSupers", false,
                "Spore Spawn Super Missile Pack", "Split on picking up the Super Missile Pack in the Spore Spawn Super Room (NOTE: SSTRA splits when the dialogue box disappears, not on touch. Use Spore Spawn RTA Finish for SSTRA runs.)");
    MakeSetting("earlySupers", false,
                "Early Super Missile Pack", "Split on picking up the Super Missile Pack in the Early Supers Room");
    MakeSetting("etacoonSupers", false,
                "Etacoon Super Missile Pack", "Split on picking up the Super Missile Pack in the Etacoon Super Room");
    MakeSetting("goldTorizoSupers", false,
                "Golden Torizo Super Missile Pack", "Split on picking up the Super Missile Pack in the Golden Torizo's Room");
    MakeSetting("wreckedShipLeftSupers", false,
                "Wrecked Ship Left Super Missile Pack", "Split on picking up the Super Missile Pack in the Wrecked Ship West Super Room");
    MakeSetting("wreckedShipRightSupers", false,
                "Wrecked Ship Right Super Missile Pack", "Split on picking up the Super Missile Pack in the Wrecked Ship East Super Room");
    MakeSetting("crabSupers", false,
                "Crab Super Missile Pack", "Split on picking up the Super Missile Pack in Main Street");
    MakeSetting("wateringHoleSupers", false,
                "Watering Hole Super Missile Pack", "Split on picking up the Super Missile Pack in Watering Hole");
    MakeSetting("aqueductSupers", false,
                "Aqueduct Super Missile Pack", "Split on picking up the Super Missile Pack in Aqueduct");

    MakeSubcategory("specificBombs", false, "ammoPickups",
                    "Specific Power Bomb Packs", "Split on specific Power Bomb Pack locations");
    MakeSetting("landingSiteBombs", false,
                "Crateria Power Bomb Pack", "Split on picking up the Power Bomb Pack in the Crateria Power Bomb Room");
    MakeSetting("etacoonBombs", false,
                "Etacoon Power Bomb Pack", "Split on picking up the Power Bomb Pack in the Etacoon Room section of Green Brinstar Main Shaft");
    MakeSetting("pinkBrinstarBombs", false,
                "Pink Brinstar Power Bomb Pack", "Split on picking up the Power Bomb Pack in the Pink Brinstar Power Bomb Room");
    MakeSetting("blueBrinstarBombs", false,
                "Classic Brinstar Power Bomb Pack", "Split on picking up the Power Bomb Pack in the Morph Ball Room");
    MakeSetting("alphaBombs", false,
                "Alpha Power Bomb Pack", "Split on picking up the Power Bomb Pack in the Alpha Power Bomb Room");
    MakeSetting("betaBombs", false,
                "Beta Power Bomb Pack", "Split on picking up the Power Bomb Pack in the Beta Power Bomb Room");
    MakeSetting("crocomireBombs", false,
                "Crocomire Power Bomb Pack", "Split on picking up the Power Bomb Pack in the Post Crocomire Power Bomb Room");
    MakeSetting("lowerNorfairEscapeBombs", false,
                "Lower Norfair Escape Power Bomb Pack", "Split on picking up the Power Bomb Pack in the Lower Norfair Escape Power Bomb Room");
    MakeSetting("shameBombs", false,
                "Power Bombs of Shame Pack", "Split on picking up the Power Bomb Pack in Wasteland");
    MakeSetting("rightSandPitBombs", false,
                "Maridia Power Bomb Pack", "Split on picking up the Power Bomb Pack in East Sand Hall");

    MakeCategory("suitUpgrades", true,
                 "Suit Pickups", "Split on Varia and Gravity pickups");
    MakeSetting("variaSuit", true,
                "Varia Suit", "Split on picking up the Varia Suit");
    MakeSetting("gravSuit", true,
                "Gravity Suit", "Split on picking up the Gravity Suit");

    MakeCategory("beamUpgrades", true,
                 "Beam Upgrades", "Split on beam upgrades");
    MakeSetting("chargeBeam", false,
                "Charge Beam", "Split on picking up the Charge Beam");
    MakeSetting("spazer", false,
                "Spazer", "Split on picking up the Spazer");
    MakeSetting("wave", true,
                "Wave Beam", "Split on picking up the Wave Beam");
    MakeSetting("ice", false,
                "Ice Beam", "Split on picking up the Ice Beam");
    MakeSetting("plasma", false,
                "Plasma Beam", "Split on picking up the Plasma Beam");

    MakeCategory("bootUpgrades", false,
                 "Boot Upgrades", "Split on boot upgrades");
    MakeSetting("hiJump", false,
                "Hi-Jump Boots", "Split on picking up the Hi-Jump Boots");
    MakeSetting("spaceJump", false,
                "Space Jump", "Split on picking up Space Jump");
    MakeSetting("speedBooster", false,
                "Speed Booster", "Split on picking up the Speed Booster");

    MakeCategory("energyUpgrades", false,
                 "Energy Upgrades", "Split on Energy Tanks and Reserve Tanks");
    MakeSetting("firstETank", false,
                "First Energy Tank", "Split on picking up the first Energy Tank");
    MakeSetting("allETanks", false,
                "All Energy Tanks", "Split on picking up each Energy Tank");
    MakeSetting("reserveTanks", false,
                "All Reserve Tanks", "Split on picking up each Reserve Tank");

    MakeSubcategory("specificETanks", false, "energyUpgrades",
                    "Specific Energy Tanks", "Split on specific Energy Tank locations");
    MakeSetting("gauntletETank", false,
                "Gauntlet Energy Tank", "Split on picking up the Energy Tank in the Gauntlet Energy Tank Room");
    MakeSetting("terminatorETank", false,
                "Terminator Energy Tank", "Split on picking up the Energy Tank in the Terminator Room");
    MakeSetting("ceilingETank", false,
                "Classic Brinstar Energy Tank", "Split on picking up the Energy Tank in the Blue Brinstar Energy Tank Room");
    MakeSetting("etecoonsETank", false,
                "Etacoon Energy Tank", "Split on picking up the Energy Tank in the Etacoon Energy Tank Room");
    MakeSetting("waterwayETank", false,
                "Waterway Energy Tank", "Split on picking up the Energy Tank in Waterway");
    MakeSetting("waveGateETank", false,
                "Pink Brinstar Wave Gate Energy Tank", "Split on picking up the Energy Tank in the Hopper Energy Tank Room");
    MakeSetting("kraidETank", false,
                "Warehouse Energy Tank", "Split on picking up the Kraid Energy Tank in the Warehouse Energy Tank Room");
    MakeSetting("crocomireETank", false,
                "Crocomire Energy Tank", "Split on picking up the Energy Tank in Crocomire's Room");
    MakeSetting("hiJumpETank", false,
                "Hi Jump Energy Tank", "Split on picking up the Energy Tank in the Hi Jump Energy Tank Room");
    MakeSetting("ridleyETank", false,
                "Ridley Energy Tank", "Split on picking up the Energy Tank in the Ridley Tank Room");
    MakeSetting("firefleaETank", false,
                "Fireflea Energy Tank", "Split on picking up the Energy Tank in the Lower Norfair Fireflea Room");
    MakeSetting("wreckedShipETank", false,
                "Wrecked Ship Energy Tank", "Split on picking up the Energy Tank in the Wrecked Ship Energy Tank Room");
    MakeSetting("tatoriETank", false,
                "Mama Turtle Energy Tank", "Split on picking up the Energy Tank in the Mama Turtle Room");
    MakeSetting("botwoonETank", false,
                "Botwoon Energy Tank", "Split on picking up the Energy Tank in the Botwoon Energy Tank Room");

    MakeSubcategory("specificRTanks", false, "energyUpgrades",
                "Specific Reserve Tanks", "Split on specific Reserve Tank locations");
    MakeSetting("brinstarReserve", false,
                "Brinstar Reserve Tank", "Split on picking up the Reserve Tank in the Brinstar Reserve Tank Room");
    MakeSetting("norfairReserve", false,
                "Norfair Reserve Tank", "Split on picking up the Reserve Tank in the Norfair Reserve Tank Room");
    MakeSetting("wreckedShipReserve", false,
                "Wrecked Ship Reserve Tank", "Split on picking up the Reserve Tank in Bowling Alley");
    MakeSetting("maridiaReserve", false,
                "Maridia Reserve Tank", "Split on picking up the Reserve Tank in West Sand Hole");

    MakeCategory("miscUpgrades", false,
                 "Misc Upgrades", "Split on the miscellaneous upgrades");
    MakeSetting("morphBall", false,
                "Morphing Ball", "Split on picking up the Morphing Ball");
    MakeSetting("bomb", false,
                "Bomb", "Split on picking up the Bomb");
    MakeSetting("springBall", false,
                "Spring Ball", "Split on picking up the Spring Ball");
    MakeSetting("screwAttack", false,
                "Screw Attack", "Split on picking up the Screw Attack");
    MakeSetting("grapple", false,
                "Grapple Beam", "Split on picking up the Grapple Beam");
    MakeSetting("xray", false,
                "X-Ray Scope", "Split on picking up the X-Ray Scope");

    MakeCategory("areaTransitions", true,
                 "Area Transitions", "Split on transitions between areas");
    MakeSetting("miniBossRooms", false,
                "Miniboss Rooms", "Split on entering miniboss rooms (except Bomb Torizo)");
    MakeSetting("bossRooms", false,
                "Boss Rooms", "Split on entering major boss rooms");
    MakeSetting("elevatorTransitions", false,
                "Elevator transitions", "Split on elevator transitions between areas (except Statue Room to Tourian)");
    MakeSetting("ceresEscape", false,
                "Ceres Escape", "Split on leaving Ceres Station");
    MakeSetting("wreckedShipEntrance", false,
                "Wrecked Ship Entrance", "Split on entering the Wrecked Ship Entrance from the lower door of West Ocean");
    MakeSetting("redTowerMiddleEntrance", false,
                "Red Tower Middle Entrance", "Split on entering Red Tower from Noob Bridge");
    MakeSetting("redTowerBottomEntrance", false,
                "Red Tower Bottom Entrance", "Split on entering Red Tower from Skree Boost room");
    MakeSetting("kraidsLair", false,
                "Kraid's Lair", "Split on entering Kraid's Lair");
    MakeSetting("risingTideEntrance", false,
                "Rising Tide Entrance", "Split on entering Rising Tide from Cathedral");
    MakeSetting("atticExit", false,
                "Attic Exit", "Split on exiting Attic");
    MakeSetting("tubeBroken", false,
                "Tube Broken", "Split on blowing up the tube to enter Maridia");
    MakeSetting("cacExit", false,
                "Cacatack Alley Exit", "Split on exiting West Cacattack Alley");
    MakeSetting("toilet", false,
                "Toilet Bowl", "Split on entering Toilet Bowl from either direction");
    MakeSetting("kronicBoost", false,
                "Kronic Boost Room", "Split on entering Kronic Boost room");
    MakeSetting("lowerNorfairEntrance", false,
                "Lower Norfair Entrance", "Split on the elevator down to Lower Norfair");
    MakeSetting("writg", false,
                "Worst Room in the Game", "Split on entering Worst Room in the Game");
    MakeSetting("redKiShaft", false,
                "Red Kihunter Shaft", "Split on entering Red Kihunter Shaft from either Amphitheatre or Wastelands (NOTE: will split twice)");
    MakeSetting("metalPirates", false,
                "Metal Pirates Room", "Split on entering Metal Pirates Room from Wasteland");
    MakeSetting("lowerNorfairSpringMaze", false,
                "Lower Norfair Springball Maze Room", "Split on entering Lower Norfair Springball Maze Room");
    MakeSetting("lowerNorfairExit", false,
                "Lower Norfair Exit", "Split on moving from the Three Musketeers' Room to the Single Chamber");
    MakeSetting("goldenFour", true,
                "Golden Four", "Split on entering the Statues Room with all four major bosses defeated");
    MakeSetting("tourianEntrance", false,
                "Tourian Entrance", "Split on the elevator down to Tourian");
    MakeSetting("metroids", false,
                "Tourian Metroid Rooms", "Split on exiting each of the Metroid rooms in Tourian");
    MakeSetting("babyMetroidRoom", false,
                "Baby Metroid Room", "Split on moving from the Dust Torizo Room to the Big Boy Room");
    MakeSetting("escapeClimb", false,
                "Tourian Exit", "Split on moving from Tourian Escape Room 4 to The Climb");

    MakeCategory("miniBosses", false,
                 "Minibosses", "Split on defeating minibosses");
    MakeSetting("ceresRidley", false,
                "Ceres Ridley", "Split on starting the Ceres Escape");
    MakeSetting("bombTorizo", false,
                "Bomb Torizo", "Split on Bomb Torizo's drops appearing");
    MakeSetting("sporeSpawn", false,
                "Spore Spawn", "Split on the last hit to Spore Spawn");
    MakeSetting("crocomire", false,
                "Crocomire", "Split on Crocomire's drops appearing");
    MakeSetting("botwoon", false,
                "Botwoon", "Split on Botwoon's vertical column being fully destroyed");
    MakeSetting("goldenTorizo", false,
                "Golden Torizo", "Split on Golden Torizo's drops appearing");

    MakeCategory("bosses", true,
                 "Bosses", "Split on defeating major bosses");
    MakeSetting("kraid", false,
                "Kraid", "Split shortly after Kraid's drops appear");
    MakeSetting("phantoon", false,
                "Phantoon", "Split on Phantoon's drops appearing");
    MakeSetting("draygon", false,
                "Draygon", "Split on Draygon's drops appearing");
    MakeSetting("ridley", true,
                "Ridley", "Split on Ridley's drops appearing");
    MakeSetting("mb1", false,
                "Mother Brain 1", "Split on Mother Brain's head hitting the ground at the end of the first phase");
    MakeSetting("mb2", true,
                "Mother Brain 2", "Split on the Baby Metroid detaching from Mother Brain's head");
    MakeSetting("mb3", false,
                "Mother Brain 3", "Split on the start of the Zebes Escape");

    MakeCategory("finishes", true,
                 "Final Splits", "Split at the end of the run for various categories");
    MakeSetting("rtaFinish", true,
                "RTA Finish", "Split on facing forward at the end of Zebes Escape");
    MakeSetting("igtFinish", false,
                "IGT Finish", "Split on In-Game Time finalizing, when the end cutscene starts");
    MakeSetting("sporeSpawnRTAFinish", false,
                "Spore Spawn RTA Finish", "Split on the end of a Spore Spawn RTA run, when the text box clears after collecting the Super Missiles");
    MakeSetting("hundredMissileRTAFinish", false,
                "100 Missile RTA Finish", "Split on the end of a 100 Missile RTA run, when the text box clears after collecting the hundredth missile");

    // RoomIDs compiled here:
    // https://wiki.supermetroid.run/List_of_rooms_by_SMILE_ID
    vars.roomIDEnum = new Dictionary<string, int> {
        { "landingSite",                    0x91F8 },
        { "crateriaPowerBombRoom",          0x93AA },
        { "westOcean",                      0x93FE },
        { "elevatorToMaridia",              0x94CC },
        { "crateriaMoat",                   0x95FF },
        { "elevatorToCaterpillar",          0x962A },
        { "gauntletETankRoom",              0x965B },
        { "climb",                          0x96BA },
        { "pitRoom",                        0x975C },
        { "elevatorToMorphBall",            0x97B5 },
        { "bombTorizo",                     0x9804 },
        { "terminator",                     0x990D },
        { "elevatorToGreenBrinstar",        0x9938 },
        { "greenPirateShaft",               0x99BD },
        { "crateriaSupersRoom",             0x99F9 },
        { "theFinalMissile",                0x9A90 },
        { "greenBrinstarMainShaft",         0x9AD9 },
        { "sporeSpawnSuper",                0x9B5B },
        { "earlySupers",                    0x9BC8 },
        { "brinstarReserveRoom",            0x9C07 },
        { "bigPink",                        0x9D19 },
        { "sporeSpawnKeyhunter",            0x9D9C },
        { "sporeSpawn",                     0x9DC7 },
        { "pinkBrinstarPowerBombRoom",      0x9E11 },
        { "greenHills",                     0x9E52 },
        { "noobBridge",                     0x9FBA },
        { "morphBall",                      0x9E9F },
        { "blueBrinstarETankRoom",          0x9F64 },
        { "etacoonETankRoom",               0xA011 },
        { "etacoonSuperRoom",               0xA051 },
        { "waterway",                       0xA0D2 },
        { "alphaMissileRoom",               0xA107 },
        { "hopperETankRoom",                0xA15B },
        { "billyMays",                      0xA1D8 },
        { "redTower",                       0xA253 },
        { "xRay",                           0xA2CE },
        { "caterpillar",                    0xA322 },
        { "betaPowerBombRoom",              0xA37C },
        { "alphaPowerBombsRoom",            0xA3AE },
        { "bat",                            0xA3DD },
        { "spazer",                         0xA447 },
        { "warehouseETankRoom",             0xA4B1 },
        { "warehouseZeela",                 0xA471 },
        { "warehouseKiHunters",             0xA4DA },
        { "kraidEyeDoor",                   0xA56B },
        { "kraid",                          0xA59F },
        { "statuesHallway",                 0xA5ED },
        { "statues",                        0xA66A },
        { "warehouseEntrance",              0xA6A1 },
        { "varia",                          0xA6E2 },
        { "cathedral",                      0xA788 },
        { "businessCenter",                 0xA7DE },
        { "iceBeam",                        0xA890 },
        { "crumbleShaft",                   0xA8F8 },
        { "crocomireSpeedway",              0xA923 },
        { "crocomire",                      0xA98D },
        { "hiJump",                         0xA9E5 },
        { "crocomireEscape",                0xAA0E },
        { "hiJumpShaft",                    0xAA41 },
        { "postCrocomirePowerBombRoom",     0xAADE },
        { "cosineRoom",                     0xAB3B },
        { "preGrapple",                     0xAB8F },
        { "grapple",                        0xAC2B },
        { "norfairReserveRoom",             0xAC5A },
        { "greenBubblesRoom",               0xAC83 },
        { "bubbleMountain",                 0xACB3 },
        { "speedBoostHall",                 0xACF0 },
        { "speedBooster",                   0xAD1B },
        { "singleChamber",                  0xAD5E }, // Exit room from Lower Norfair, also on the path to Wave
        { "doubleChamber",                  0xADAD },
        { "waveBeam",                       0xADDE },
        { "volcano",                        0xAE32 },
        { "kronicBoost",                    0xAE74 },
        { "magdolliteTunnel",               0xAEB4 },
        { "lowerNorfairElevator",           0xAF3F },
        { "risingTide",                     0xAFA3 },
        { "spikyAcidSnakes",                0xAFFB },
        { "acidStatue",                     0xB1E5 },
        { "mainHall",                       0xB236 }, // First room in Lower Norfair
        { "goldenTorizo",                   0xB283 },
        { "ridley",                         0xB32E },
        { "lowerNorfairFarming",            0xB37A },
        { "mickeyMouse",                    0xB40A },
        { "pillars",                        0xB457 },
        { "writg",                          0xB4AD },
        { "amphitheatre",                   0xB4E5 },
        { "lowerNorfairSpringMaze",         0xB510 },
        { "lowerNorfairEscapePowerBombRoom",0xB55A },
        { "redKiShaft",                     0xB585 },
        { "wasteland",                      0xB5D5 },
        { "metalPirates",                   0xB62B },
        { "threeMusketeers",                0xB656 },
        { "ridleyETankRoom",                0xB698 },
        { "screwAttack",                    0xB6C1 },
        { "lowerNorfairFireflea",           0xB6EE },
        { "bowling",                        0xC98E },
        { "wreckedShipEntrance",            0xCA08 },
        { "attic",                          0xCA52 },
        { "atticWorkerRobotRoom",           0xCAAE },
        { "wreckedShipMainShaft",           0xCAF6 },
        { "wreckedShipETankRoom",           0xCC27 },
        { "basement",                       0xCC6F }, // Basement of Wrecked Ship
        { "phantoon",                       0xCD13 },
        { "wreckedShipLeftSuperRoom",       0xCDA8 },
        { "wreckedShipRightSuperRoom",      0xCDF1 },
        { "gravity",                        0xCE40 },
        { "glassTunnel",                    0xCEFB },
        { "mainStreet",                     0xCFC9 },
        { "mamaTurtle",                     0xD055 },
        { "wateringHole",                   0xD13B },
        { "beach",                          0xD1DD },
        { "plasmaBeam",                     0xD2AA },
        { "maridiaElevator",                0xD30B },
        { "plasmaSpark",                    0xD340 },
        { "toiletBowl",                     0xD408 },
        { "oasis",                          0xD48E },
        { "leftSandPit",                    0xD4EF },
        { "rightSandPit",                   0xD51E },
        { "aqueduct",                       0xD5A7 },
        { "butterflyRoom",                  0xD5EC },
        { "botwoonHallway",                 0xD617 },
        { "springBall",                     0xD6D0 },
        { "precious",                       0xD78F },
        { "botwoonETankRoom",               0xD7E4 },
        { "botwoon",                        0xD95E },
        { "spaceJump",                      0xD9AA },
        { "westCactusAlley",                0xD9FE },
        { "draygon",                        0xDA60 },
        { "tourianElevator",                0xDAAE },
        { "metroidOne",                     0xDAE1 },
        { "metroidTwo",                     0xDB31 },
        { "metroidThree",                   0xDB7D },
        { "metroidFour",                    0xDBCD },
        { "dustTorizo",                     0xDC65 },
        { "tourianHopper",                  0xDC19 },
        { "tourianEyeDoor",                 0xDDC4 },
        { "bigBoy",                         0xDCB1 },
        { "motherBrain",                    0xDD58 },
        { "rinkaShaft",                     0xDDF3 },
        { "tourianEscape4",                 0xDEDE },
        { "ceresElevator",                  0xDF45 },
        { "flatRoom",                       0xE06B }, // Placeholder name for the flat room in Ceres Station
        { "ceresRidley",                    0xE0B5 }
    };

    vars.mapInUseEnum = new Dictionary<string, int>{
        { "crateria",   0x0 },
        { "brinstar",   0x1 },
        { "norfair",    0x2 },
        { "wreckedShip",0x3 },
        { "maridia",    0x4 },
        { "tourian",    0x5 },
        { "ceres",      0x6 }
    };

    vars.gameStateEnum = new Dictionary<string, int> {
        { "normalGameplay",         0x8 },
        { "doorTransition",         0xB },
        { "startOfCeresCutscene",   0x20 },
        { "preEndCutscene",         0x26 }, // briefly at this value during the black screen transition after the ship fades out
        { "endCutscene",            0x27 }
    };

    vars.unlockFlagEnum = new Dictionary<string, int>{
        // First item byte
        { "variaSuit",      0x1 },
        { "springBall",     0x2 },
        { "morphBall",      0x4 },
        { "screwAttack",    0x8 },
        { "gravSuit",       0x20},
        // Second item byte
        { "hiJump",         0x1 },
        { "spaceJump",      0x2 },
        { "bomb",           0x10},
        { "speedBooster",   0x20},
        { "grapple",        0x40},
        { "xray",           0x80},
        // Beams
        { "wave",           0x1 },
        { "ice",            0x2 },
        { "spazer",         0x4 },
        { "plasma",         0x8 },
        // Charge
        { "chargeBeam",     0x10}
    };

    vars.motherBrainMaxHPEnum = new Dictionary<string, int>{
        { "phase1", 0xBB8 },    // 3000
        { "phase2", 0x4650 },   // 18000
        { "phase3", 0x8CA0 }    // 36000
    };

    vars.eventFlagEnum = new Dictionary<string, int>{
        { "zebesAblaze",    0x40 },
        { "tubeBroken",     0x8 }
    };

    vars.bossFlagEnum = new Dictionary<string, int>{
        // Crateria
        { "bombTorizo",     0x4 },
        // Brinstar
        { "sporeSpawn",     0x2 },
        { "kraid",          0x1 },
        // Norfair
        { "ridley",         0x1 },
        { "crocomire",      0x2 },
        { "goldenTorizo",   0x4 },
        // Wrecked Ship
        { "phantoon",       0x1 },
        // Maridia
        { "draygon",        0x1 },
        { "botwoon",        0x2 },
        // Tourian
        { "motherBrain",    0x2 },
        // Ceres
        { "ceresRidley",    0x1 }
    };

    vars.pickedUpSporeSpawnSuper = false;
    vars.pickedUpHundredthMissile = false;
    vars.frameRate = 60.0;

    Action<string> DebugOutput = (text) => {
        print("[Super Metroid Autosplitter] "+text);
    };
    vars.DebugOutput = DebugOutput;
}

init
{
    IntPtr memoryOffset = IntPtr.Zero;

    IntPtr start = modules.First().BaseAddress;
    long exeSize = modules.First().ModuleMemorySize;
    bool is32bit = false, is64bit = false; // if neither are set then this isn't x86
    uint timestamp = 0; // not reliable, many stripped exes just say 0
    uint codeSize = 0, dataSize = 0;

    { // parse the PE header from the executable loaded in memory (the first module)
        ushort stubMagic = game.ReadValue<ushort>(start);
        uint signOffset = game.ReadValue<uint>(start + 0x3C);
        if (stubMagic == 0x5A4D && signOffset >= 64 && signOffset <= 1024) {
            IntPtr coffStart = start + (Int32)signOffset + 4;
            uint signature = game.ReadValue<uint>(coffStart - 4);
            ushort machine = game.ReadValue<ushort>(coffStart);
            timestamp = game.ReadValue<uint>(coffStart + 4);
            ushort optionalSize = game.ReadValue<ushort>(coffStart + 16);
            is32bit = machine == 0x014C;
            is64bit = machine == 0x8664;
            if (signature == 0x00004550 && (is32bit || is64bit) && optionalSize >= 0xE0) {
                IntPtr optStart = coffStart + 20;
                ushort optMagic = game.ReadValue<ushort>(optStart);
                if (optMagic == 0x10B || optMagic == 0x20B) {
                    codeSize = game.ReadValue<uint>(optStart + 4);
                    dataSize = game.ReadValue<uint>(optStart + 8);
                }
            }
        }
    }

    // create a unique hash out of the code size and data size.
    Func<ulong,ulong,ulong> Cantor = (x, y) => (x + y) * (x + y + 1) / 2 + y;
    Func<ulong,ulong,ulong> Sizes = (code, data) => Cantor(code / 512, data / 512);
    //ulong sizeHash = Cantor(codeSize / 512, dataSize / 512);
    ulong sizeHash = Sizes(codeSize, dataSize);
    vars.DebugOutput("Cantor Hash: 0x" + sizeHash.ToString("X8"));

    Func<long, bool, bool, Tuple<long, bool, bool>> At = (a, b, c) => Tuple.Create(a, b, c);

    var processName = game.ProcessName.ToLower();
    if (processName.Contains("retroarch")) {
        // RetroArch stores a pointer to the emulated WRAM inside itself (it
        // can get this pointer via the Core API). This happily lets this work
        // on any variant of Snes9x cores, depending only on the RA version.

        var retroarchVersions = new Dictionary<int, int>{
            { 18649088, 0x608EF0 }, // Retroarch 1.7.5 (x64)
        };
        IntPtr wramPointer = IntPtr.Zero;
        int ptrOffset;
        if (retroarchVersions.TryGetValue(modules.First().ModuleMemorySize, out ptrOffset)) {
            wramPointer = memory.ReadPointer(modules.First().BaseAddress + ptrOffset);
        }

        if (wramPointer != IntPtr.Zero) {
            memoryOffset = wramPointer;
        } else {
            // Unfortunately, Higan doesn't support that API. So if the address
            // is missing, try to grab the memory from the higan core directly.

            var higanModule = modules.FirstOrDefault(m => m.ModuleName.ToLower() == "higan_sfc_libretro.dll");
            if (higanModule != null) {
                var versions = new Dictionary<int, int>{
                    { 4980736, 0x1F3AC4 }, // higan 106 (x64)
                };
                int wramOffset;
                if (versions.TryGetValue(higanModule.ModuleMemorySize, out wramOffset)) {
                    memoryOffset = higanModule.BaseAddress + wramOffset;
                }
            }
        }
    } else {
        var versions = new Dictionary<ulong, Tuple<long, bool, bool>>{
            /*
            { CantorHash, At(Address, IsAbsolute, IsPointer) }, // Emulator X.YY
            */
            //{ 10330112, At(0x389414, false, true) }, // Snes9x 1.52-rr
            //{ 7729152,  At(0x490EE4, false, true) }, // Snes9x 1.54-rr
            //{ 9646080,  At(0x57EE04, false, true) }, // Snes9x-rr 1.60
            { 0x14E33557, At(0x925118, false, true) }, // Snes9x-rr 1.60 (x64)
            { 0x01324086, At(0x2EFBA4, false, true) }, // Snes9x 1.53
            { 0x01FB975D, At(0x405EC8, false, true) }, // Snes9x 1.53 (x64)
            { 0x04B29C5E, At(0x3410D4, false, true) }, // Snes9x 1.54/1.54.1
            { 0x0722CF9C, At(0x4DAF18, false, true) }, // Snes9x 1.54/1.54.1 (x64)
            { 0x04ED290A, At(0x362874, false, true) }, // Snes9x 1.55
            { 0x07E61275, At(0x5BFDB8, false, true) }, // Snes9x 1.55 (x64)
            { 0x055332BD, At(0x38528C, false, true) }, // Snes9x 1.56
            { 0x09300063, At(0x5D8C68, false, true) }, // Snes9x 1.56 (x64)
            { 0x054EB6FD, At(0x3811B4, false, true) }, // Snes9x 1.56.1
            { 0x09129F8C, At(0x5C80A8, false, true) }, // Snes9x 1.56.1 (x64)
            { 0x0552FE88, At(0x38528C, false, true) }, // Snes9x 1.56.2
            { 0x09362AEF, At(0x5D9298, false, true) }, // Snes9x 1.56.2 (x64)
            { 0x0589C94F, At(0x3A6EE4, false, true) }, // Snes9x 1.57
            { 0x09482DC8, At(0x5ACC58, false, true) }, // Snes9x 1.57 (x64)
            { 0x058B3E28, At(0x3A7EE4, false, true) }, // Snes9x 1.58
            { 0x094BAE4C, At(0x5AE848, false, true) }, // Snes9x 1.58 (x64)
            { 0x0917F50E, At(0x575A54, false, true) }, // Snes9x 1.59.2
            { 0x11D5B02A, At(0x8D86F8, false, true) }, // Snes9x 1.59.2 (x64)
            { 0x093E3C13, At(0x54DB54, false, true) }, // Snes9x 1.60
            { 0x12B060B6, At(0x8D8BE8, false, true) }, // Snes9x 1.60 (x64)
            { 0x098115FC, At(0x507BC4, false, true) }, // Snes9x 1.61
            { 0x130C26E9, At(0x883158, false, true) }, // Snes9x 1.61 (x64)
            // versions from 1.62 onward don't allocate WRAM on heap.
            { 0x41CACAF8, At(0x608C24, false, false) }, // Snes9x 1.62
            { 0x5FF7A971, At(0xAA0B04, false, false) }, // Snes9x 1.62 (x64)
            { 0x0C444AF7, At(0x587494, false, false) }, // Snes9x 1.62.2/1.62.3
            { 0x1B2C72A6, At(0xA32314, false, false) }, // Snes9x 1.62.2/1.62.3 (x64)
            { 0x0E08F3CE, At(0x633DB4, false, false) }, // Snes9x 1.63
            { 0x20C6294E, At(0xB91C24, false, false) }, // Snes9x 1.63 (x64)
            { 0x06EBFFA0, At(0xB15D7C, false, false) }, // bsnes v113
            { 0x06F24866, At(0x716D7C, false, false) }, // bsnes v115
            // bsnes-as uses ASLR. not a problem for LiveSplit, but keep it in mind.
            { 0x1211A9B8, At(0x996490, false, false) }, // bsnes-as v20240115
            { 0x12405E88, At(0x9A0470, false, false) }, // bsnes-as v20240512
            { 0x1260856D, At(0x9A5470, false, false) }, // bsnes-as v20250202/v20250301
            { 0x12681A36, At(0x9A6470, false, false) }, // bsnes-as v20250308
        };

        // some notes about Windows stuff:
        // 32-bit programs are typically loaded to a virtual address of 0x00400000
        // 64-bit programs are typically loaded to a virtual address of 0x000140000000
        // when ASLR is enabled, the virtual address is random, near to 0x7FF000000000

        if (versions.ContainsKey(sizeHash)) {
            var versionInfo = versions[sizeHash];
            // whichever version of C# this is, it has very limited Tuple support.
            var addresslike = versionInfo.Item1;
            var isAbsolute = versionInfo.Item2;
            var isPointer = versionInfo.Item3;
            if (!isAbsolute) {
                addresslike = (long)start + addresslike;
            }
            if (isPointer) {
                memoryOffset = memory.ReadPointer((IntPtr)addresslike);
            } else {
                memoryOffset = (IntPtr)addresslike;
            }
        }
    }

    if (memoryOffset == IntPtr.Zero) {
        vars.DebugOutput("Unsupported emulator version");
        var interestingModules = modules.Where(m =>
            m.ModuleName.ToLower().EndsWith(".exe") ||
            m.ModuleName.ToLower().EndsWith("_libretro.dll"));
        foreach (var module in interestingModules) {
            vars.DebugOutput("Module '" + module.ModuleName + "' sized " + module.ModuleMemorySize.ToString());
        }
        vars.watchers = new MemoryWatcherList{};
        // Throwing prevents initialization from completing. LiveSplit will
        // retry it until it eventually works. (Which lets you load a core in
        // RA for example.)
        throw new InvalidOperationException("Unsupported emulator version");
    }

    vars.DebugOutput("Found WRAM address: 0x" + memoryOffset.ToString("X8"));
    vars.watchers = new MemoryWatcherList
    {
        new MemoryWatcher<ushort>(memoryOffset + 0x079B) { Name = "roomID" },
        new MemoryWatcher<byte>(memoryOffset + 0x079F) { Name = "mapInUse" },
        new MemoryWatcher<byte>(memoryOffset + 0x0998) { Name = "gameState" },
        new MemoryWatcher<byte>(memoryOffset + 0x09A4) { Name = "unlockedEquips2" },
        new MemoryWatcher<byte>(memoryOffset + 0x09A5) { Name = "unlockedEquips" },
        new MemoryWatcher<byte>(memoryOffset + 0x09A8) { Name = "unlockedBeams" },
        new MemoryWatcher<byte>(memoryOffset + 0x09A9) { Name = "unlockedCharge" },
        new MemoryWatcher<ushort>(memoryOffset + 0x09C4) { Name = "maxEnergy" },
        new MemoryWatcher<byte>(memoryOffset + 0x09C8) { Name = "maxMissiles" },
        new MemoryWatcher<byte>(memoryOffset + 0x09CC) { Name = "maxSupers" },
        new MemoryWatcher<byte>(memoryOffset + 0x09D0) { Name = "maxPowerBombs" },
        new MemoryWatcher<ushort>(memoryOffset + 0x09D4) { Name = "maxReserve" },
        new MemoryWatcher<byte>(memoryOffset + 0x09DA) { Name = "igtFrames" },
        new MemoryWatcher<byte>(memoryOffset + 0x09DC) { Name = "igtSeconds" },
        new MemoryWatcher<byte>(memoryOffset + 0x09DE) { Name = "igtMinutes" },
        new MemoryWatcher<byte>(memoryOffset + 0x09E0) { Name = "igtHours" },
        new MemoryWatcher<byte>(memoryOffset + 0x0A28) { Name = "playerState" },
        new MemoryWatcher<ushort>(memoryOffset + 0x0F8C) { Name = "enemyHP" },
        new MemoryWatcher<ushort>(memoryOffset + 0x0FB2) { Name = "shipAI" },
        new MemoryWatcher<ushort>(memoryOffset + 0x0FCC) { Name = "motherBrainHP" },
        new MemoryWatcher<byte>(memoryOffset + 0xD821) { Name = "eventFlags" },
        new MemoryWatcher<byte>(memoryOffset + 0xD828) { Name = "crateriaBosses" },
        new MemoryWatcher<byte>(memoryOffset + 0xD829) { Name = "brinstarBosses" },
        new MemoryWatcher<byte>(memoryOffset + 0xD82A) { Name = "norfairBosses" },
        new MemoryWatcher<byte>(memoryOffset + 0xD82B) { Name = "wreckedShipBosses" },
        new MemoryWatcher<byte>(memoryOffset + 0xD82C) { Name = "maridiaBosses" },
        new MemoryWatcher<byte>(memoryOffset + 0xD82D) { Name = "tourianBosses" },
        new MemoryWatcher<byte>(memoryOffset + 0xD82E) { Name = "ceresBosses" },
        new MemoryWatcher<byte>(memoryOffset + 0xD870) { Name = "crateriaItems" },
        new MemoryWatcher<byte>(memoryOffset + 0xD871) { Name = "brinteriaItems" },
        new MemoryWatcher<byte>(memoryOffset + 0xD872) { Name = "brinstarItems2" },
        new MemoryWatcher<byte>(memoryOffset + 0xD873) { Name = "brinstarItems3" },
        new MemoryWatcher<byte>(memoryOffset + 0xD874) { Name = "brinstarItems4" },
        new MemoryWatcher<byte>(memoryOffset + 0xD875) { Name = "brinstarItems5" },
        new MemoryWatcher<byte>(memoryOffset + 0xD876) { Name = "norfairItems1" },
        new MemoryWatcher<byte>(memoryOffset + 0xD877) { Name = "norfairItems2" },
        new MemoryWatcher<byte>(memoryOffset + 0xD878) { Name = "norfairItems3" },
        new MemoryWatcher<byte>(memoryOffset + 0xD879) { Name = "norfairItems4" },
        new MemoryWatcher<byte>(memoryOffset + 0xD87A) { Name = "norfairItems5" },
        new MemoryWatcher<byte>(memoryOffset + 0xD880) { Name = "wreckedShipItems" },
        new MemoryWatcher<byte>(memoryOffset + 0xD881) { Name = "maridiaItems1" },
        new MemoryWatcher<byte>(memoryOffset + 0xD882) { Name = "maridiaItems2" },
        new MemoryWatcher<byte>(memoryOffset + 0xD883) { Name = "maridiaItems3" },
    };
}

update
{
    vars.watchers.UpdateAll(game);
}

start
{
    var normalStart   = vars.watchers["gameState"].Old == 2    && vars.watchers["gameState"].Current == 0x1F;
    // Allow for a cutscene start, even though it's not normally used for speedrunning
    var cutsceneEnded = vars.watchers["gameState"].Old == 0x1E && vars.watchers["gameState"].Current == 0x1F;
    // Some categories start from Zebes, such as Spore Spawn RTA
    var zebesStart    = vars.watchers["gameState"].Old == 5    && vars.watchers["gameState"].Current == 6;
    if (normalStart || cutsceneEnded || zebesStart) {
        vars.DebugOutput("Timer started");
    }
    return normalStart || cutsceneEnded || zebesStart;
}

reset
{
    return vars.watchers["roomID"].Old != 0 && vars.watchers["roomID"].Current == 0;
}

split
{
    // Ammo pickup section
    var firstMissile = settings["firstMissile"] && vars.watchers["maxMissiles"].Old == 0 && vars.watchers["maxMissiles"].Current == 5;
    var allMissiles = settings["allMissiles"] && (vars.watchers["maxMissiles"].Old + 5) == (vars.watchers["maxMissiles"].Current);
    var oceanBottomMissiles = settings["oceanBottomMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["westOcean"] && (vars.watchers["crateriaItems"].Old + 2) == (vars.watchers["crateriaItems"].Current);
    var oceanTopMissiles = settings["oceanTopMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["westOcean"] && (vars.watchers["crateriaItems"].Old + 4) == (vars.watchers["crateriaItems"].Current);
    var oceanMiddleMissiles = settings["oceanMiddleMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["westOcean"] && (vars.watchers["crateriaItems"].Old + 8) == (vars.watchers["crateriaItems"].Current);
    var moatMissiles = settings["moatMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["crateriaMoat"] && (vars.watchers["crateriaItems"].Old + 16) == (vars.watchers["crateriaItems"].Current);
    var oldTourianMissiles = settings["oldTourianMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["pitRoom"] && (vars.watchers["crateriaItems"].Old + 64) == (vars.watchers["crateriaItems"].Current);
    var gauntletRightMissiles = settings["gauntletRightMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["greenPirateShaft"] && (vars.watchers["brinteriaItems"].Old + 2) == (vars.watchers["brinteriaItems"].Current);
    var gauntletLeftMissiles = settings["gauntletLeftMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["greenPirateShaft"] && (vars.watchers["brinteriaItems"].Old + 4) == (vars.watchers["brinteriaItems"].Current);
    var dentalPlan = settings["dentalPlan"] && vars.watchers["roomID"].Current == vars.roomIDEnum["theFinalMissile"] && (vars.watchers["brinteriaItems"].Old + 16) == (vars.watchers["brinteriaItems"].Current);
    var earlySuperBridgeMissiles = settings["earlySuperBridgeMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["earlySupers"] && (vars.watchers["brinteriaItems"].Old + 128) == (vars.watchers["brinteriaItems"].Current);
    var greenBrinstarReserveMissiles = settings["greenBrinstarReserveMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["brinstarReserveRoom"] && (vars.watchers["brinstarItems2"].Old + 8) == (vars.watchers["brinstarItems2"].Current);
    var greenBrinstarExtraReserveMissiles = settings["greenBrinstarExtraReserveMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["brinstarReserveRoom"] && (vars.watchers["brinstarItems2"].Old + 4) == (vars.watchers["brinstarItems2"].Current);
    var bigPinkTopMissiles = settings["bigPinkTopMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["bigPink"] && (vars.watchers["brinstarItems2"].Old + 32) == (vars.watchers["brinstarItems2"].Current);
    var chargeMissiles = settings["chargeMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["bigPink"] && (vars.watchers["brinstarItems2"].Old + 64) == (vars.watchers["brinstarItems2"].Current);
    var greenHillsMissiles = settings["greenHillsMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["greenHills"] && (vars.watchers["brinstarItems3"].Old + 2) == (vars.watchers["brinstarItems3"].Current);
    var blueBrinstarETankMissiles = settings["blueBrinstarETankMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["blueBrinstarETankRoom"] && (vars.watchers["brinstarItems3"].Old + 16) == (vars.watchers["brinstarItems3"].Current);
    var alphaMissiles = settings["alphaMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["alphaMissileRoom"] && (vars.watchers["brinstarItems4"].Old + 4) == (vars.watchers["brinstarItems4"].Current);
    var billyMaysMissiles = settings["billyMaysMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["billyMays"] && (vars.watchers["brinstarItems4"].Old + 16) == (vars.watchers["brinstarItems4"].Current);
    var butWaitTheresMoreMissiles = settings["butWaitTheresMoreMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["billyMays"] && (vars.watchers["brinstarItems4"].Old + 32) == (vars.watchers["brinstarItems4"].Current);
    var redBrinstarMissiles = settings["redBrinstarMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["alphaPowerBombsRoom"] && (vars.watchers["brinstarItems5"].Old + 2) == (vars.watchers["brinstarItems5"].Current);
    var warehouseMissiles = settings["warehouseMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["warehouseKiHunters"] && (vars.watchers["brinstarItems5"].Old + 16) == (vars.watchers["brinstarItems5"].Current);
    var cathedralMissiles = settings["cathedralMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["cathedral"] && (vars.watchers["norfairItems1"].Old + 2) == (vars.watchers["norfairItems1"].Current);
    var crumbleShaftMissiles = settings["crumbleShaftMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["crumbleShaft"] && (vars.watchers["norfairItems1"].Old + 8) == (vars.watchers["norfairItems1"].Current);
    var crocomireEscapeMissiles = settings["crocomireEscapeMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["crocomireEscape"] && (vars.watchers["norfairItems1"].Old + 64) == (vars.watchers["norfairItems1"].Current);
    var hiJumpMissiles = settings["hiJumpMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["hiJumpShaft"] && (vars.watchers["norfairItems1"].Old + 128) == (vars.watchers["norfairItems1"].Current);
    var postCrocomireMissiles = settings["postCrocomireMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["cosineRoom"] && (vars.watchers["norfairItems2"].Old + 4) == (vars.watchers["norfairItems2"].Current);
    var grappleMissiles = settings["grappleMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["preGrapple"] && (vars.watchers["norfairItems2"].Old + 8) == (vars.watchers["norfairItems2"].Current);
    var norfairReserveMissiles = settings["norfairReserveMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["norfairReserveRoom"] && (vars.watchers["norfairItems2"].Old + 64) == (vars.watchers["norfairItems2"].Current);
    var greenBubblesMissiles = settings["greenBubblesMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["greenBubblesRoom"] && (vars.watchers["norfairItems2"].Old + 128) == (vars.watchers["norfairItems2"].Current);
    var bubbleMountainMissiles = settings["bubbleMountainMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["bubbleMountain"] && (vars.watchers["norfairItems3"].Old + 1) == (vars.watchers["norfairItems3"].Current);
    var speedBoostMissiles = settings["speedBoostMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["speedBoostHall"] && (vars.watchers["norfairItems3"].Old + 2) == (vars.watchers["norfairItems3"].Current);
    var waveMissiles = settings["waveMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["doubleChamber"] && (vars.watchers["norfairItems3"].Old + 8) == (vars.watchers["norfairItems3"].Current);
    var goldTorizoMissiles = settings["goldTorizoMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["goldenTorizo"] && (vars.watchers["norfairItems3"].Old + 64) == (vars.watchers["norfairItems3"].Current);
    var mickeyMouseMissiles = settings["mickeyMouseMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["mickeyMouse"] && (vars.watchers["norfairItems4"].Old + 2) == (vars.watchers["norfairItems4"].Current);
    var lowerNorfairSpringMazeMissiles = settings["lowerNorfairSpringMazeMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["lowerNorfairSpringMaze"] && (vars.watchers["norfairItems4"].Old + 4) == (vars.watchers["norfairItems4"].Current);
    var threeMusketeersMissiles = settings["threeMusketeersMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["threeMusketeers"] && (vars.watchers["norfairItems4"].Old + 32) == (vars.watchers["norfairItems4"].Current);
    var wreckedShipMainShaftMissiles = settings["wreckedShipMainShaftMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["wreckedShipMainShaft"] && (vars.watchers["wreckedShipItems"].Old + 1) == (vars.watchers["wreckedShipItems"].Current);
    var bowlingMissiles = settings["bowlingMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["bowling"] && (vars.watchers["wreckedShipItems"].Old + 4) == (vars.watchers["wreckedShipItems"].Current);
    var atticMissiles = settings["atticMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["atticWorkerRobotRoom"] && (vars.watchers["wreckedShipItems"].Old + 8) == (vars.watchers["wreckedShipItems"].Current);
    var mainStreetMissiles = settings["mainStreetMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["mainStreet"] && (vars.watchers["maridiaItems1"].Old + 1) == (vars.watchers["maridiaItems1"].Current);
    var mamaTurtleMissiles = settings["mamaTurtleMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["mamaTurtle"] && (vars.watchers["maridiaItems1"].Old + 8) == (vars.watchers["maridiaItems1"].Current);
    var wateringHoleMissiles = settings["wateringHoleMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["wateringHole"] && (vars.watchers["maridiaItems1"].Old + 32) == (vars.watchers["maridiaItems1"].Current);
    var beachMissiles = settings["beachMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["beach"] && (vars.watchers["maridiaItems1"].Old + 64) == (vars.watchers["maridiaItems1"].Current);
    var leftSandPitMissiles = settings["leftSandPitMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["leftSandPit"] && (vars.watchers["maridiaItems2"].Old + 1) == (vars.watchers["maridiaItems2"].Current);
    var rightSandPitMissiles = settings["rightSandPitMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["rightSandPit"] && (vars.watchers["maridiaItems2"].Old + 4) == (vars.watchers["maridiaItems2"].Current);
    var aqueductMissiles = settings["aqueductMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["aqueduct"] && (vars.watchers["maridiaItems2"].Old + 16) == (vars.watchers["maridiaItems2"].Current);
    var preDraygonMissiles = settings["preDraygonMissiles"] && vars.watchers["roomID"].Current == vars.roomIDEnum["precious"] && (vars.watchers["maridiaItems2"].Old + 128) == (vars.watchers["maridiaItems2"].Current);
    var firstSuper = settings["firstSuper"] && vars.watchers["maxSupers"].Old == 0 && vars.watchers["maxSupers"].Current == 5;
    var allSupers = settings["allSupers"] && (vars.watchers["maxSupers"].Old + 5) == (vars.watchers["maxSupers"].Current);
    var climbSupers = settings["climbSupers"] && vars.watchers["roomID"].Current == vars.roomIDEnum["crateriaSupersRoom"] && (vars.watchers["brinteriaItems"].Old + 8) == (vars.watchers["brinteriaItems"].Current);
    var sporeSpawnSupers = settings["sporeSpawnSupers"] && vars.watchers["roomID"].Current == vars.roomIDEnum["sporeSpawnSuper"] && (vars.watchers["brinteriaItems"].Old + 64) == (vars.watchers["brinteriaItems"].Current);
    var earlySupers = settings["earlySupers"] && vars.watchers["roomID"].Current == vars.roomIDEnum["earlySupers"] && (vars.watchers["brinstarItems2"].Old + 1) == (vars.watchers["brinstarItems2"].Current);
    var etacoonSupers = settings["etacoonSupers"] && vars.watchers["roomID"].Current == vars.roomIDEnum["etacoonSuperRoom"] && (vars.watchers["brinstarItems3"].Old + 128) == (vars.watchers["brinstarItems3"].Current);
    var goldTorizoSupers = settings["goldTorizoSupers"] && vars.watchers["roomID"].Current == vars.roomIDEnum["goldenTorizo"] && (vars.watchers["norfairItems3"].Old + 128) == (vars.watchers["norfairItems3"].Current);
    var wreckedShipLeftSupers = settings["wreckedShipLeftSupers"] && vars.watchers["roomID"].Current == vars.roomIDEnum["wreckedShipLeftSuperRoom"] && (vars.watchers["wreckedShipItems"].Old + 32) == (vars.watchers["wreckedShipItems"].Current);
    var wreckedShipRightSupers = settings["wreckedShipRightSupers"] && vars.watchers["roomID"].Current == vars.roomIDEnum["wreckedShipRightSuperRoom"] && (vars.watchers["wreckedShipItems"].Old + 64) == (vars.watchers["wreckedShipItems"].Current);
    var crabSupers = settings["crabSupers"] && vars.watchers["roomID"].Current == vars.roomIDEnum["mainStreet"] && (vars.watchers["maridiaItems1"].Old + 2) == (vars.watchers["maridiaItems1"].Current);
    var wateringHoleSupers = settings["wateringHoleSupers"] && vars.watchers["roomID"].Current == vars.roomIDEnum["wateringHole"] && (vars.watchers["maridiaItems1"].Old + 16) == (vars.watchers["maridiaItems1"].Current);
    var aqueductSupers = settings["aqueductSupers"] && vars.watchers["roomID"].Current == vars.roomIDEnum["aqueduct"] && (vars.watchers["maridiaItems2"].Old + 32) == (vars.watchers["maridiaItems2"].Current);
    var firstPowerBomb = settings["firstPowerBomb"] && vars.watchers["maxPowerBombs"].Old == 0 && vars.watchers["maxPowerBombs"].Current == 5;
    var allPowerBombs = settings["allPowerBombs"] && (vars.watchers["maxPowerBombs"].Old + 5) == (vars.watchers["maxPowerBombs"].Current);
    var landingSiteBombs = settings["landingSiteBombs"] && vars.watchers["roomID"].Current == vars.roomIDEnum["crateriaPowerBombRoom"] && (vars.watchers["crateriaItems"].Old + 1) == (vars.watchers["crateriaItems"].Current);
    var etacoonBombs = settings["etacoonBombs"] && vars.watchers["roomID"].Current == vars.roomIDEnum["greenBrinstarMainShaft"] && (vars.watchers["brinteriaItems"].Old + 32) == (vars.watchers["brinteriaItems"].Current);
    var pinkBrinstarBombs = settings["pinkBrinstarBombs"] && vars.watchers["roomID"].Current == vars.roomIDEnum["pinkBrinstarPowerBombRoom"] && (vars.watchers["brinstarItems3"].Old + 1) == (vars.watchers["brinstarItems3"].Current);
    var blueBrinstarBombs = settings["blueBrinstarBombs"] && vars.watchers["roomID"].Current == vars.roomIDEnum["morphBall"] && (vars.watchers["brinstarItems3"].Old + 8) == (vars.watchers["brinstarItems3"].Current);
    var alphaBombs = settings["alphaBombs"] && vars.watchers["roomID"].Current == vars.roomIDEnum["alphaPowerBombsRoom"] && (vars.watchers["brinstarItems5"].Old + 1) == (vars.watchers["brinstarItems5"].Current);
    var betaBombs = settings["betaBombs"] && vars.watchers["roomID"].Current == vars.roomIDEnum["betaPowerBombRoom"] && (vars.watchers["brinstarItems4"].Old + 128) == (vars.watchers["brinstarItems4"].Current);
    var crocomireBombs = settings["crocomireBombs"] && vars.watchers["roomID"].Current == vars.roomIDEnum["postCrocomirePowerBombRoom"] && (vars.watchers["norfairItems2"].Old + 2) == (vars.watchers["norfairItems2"].Current);
    var lowerNorfairEscapeBombs = settings["lowerNorfairEscapeBombs"] && vars.watchers["roomID"].Current == vars.roomIDEnum["lowerNorfairEscapePowerBombRoom"] && (vars.watchers["norfairItems4"].Old + 8) == (vars.watchers["norfairItems4"].Current);
    var shameBombs = settings["shameBombs"] && vars.watchers["roomID"].Current == vars.roomIDEnum["wasteland"] && (vars.watchers["norfairItems4"].Old + 16) == (vars.watchers["norfairItems4"].Current);
    var rightSandPitBombs = settings["rightSandPitBombs"] && vars.watchers["roomID"].Current == vars.roomIDEnum["rightSandPit"] && (vars.watchers["maridiaItems2"].Old + 8) == (vars.watchers["maridiaItems2"].Current);
    var pickup = firstMissile || allMissiles || oceanBottomMissiles || oceanTopMissiles ||  oceanMiddleMissiles || moatMissiles || oldTourianMissiles || gauntletRightMissiles || gauntletLeftMissiles || dentalPlan || earlySuperBridgeMissiles || greenBrinstarReserveMissiles || greenBrinstarExtraReserveMissiles || bigPinkTopMissiles || chargeMissiles || greenHillsMissiles || blueBrinstarETankMissiles || alphaMissiles || billyMaysMissiles || butWaitTheresMoreMissiles || redBrinstarMissiles || warehouseMissiles || cathedralMissiles || crumbleShaftMissiles || crocomireEscapeMissiles || hiJumpMissiles || postCrocomireMissiles || grappleMissiles || norfairReserveMissiles || greenBubblesMissiles || bubbleMountainMissiles || speedBoostMissiles || waveMissiles || goldTorizoMissiles || mickeyMouseMissiles || lowerNorfairSpringMazeMissiles || threeMusketeersMissiles || wreckedShipMainShaftMissiles || bowlingMissiles || atticMissiles || mainStreetMissiles || mamaTurtleMissiles || wateringHoleMissiles || beachMissiles || leftSandPitMissiles || rightSandPitMissiles || aqueductMissiles || preDraygonMissiles || firstSuper || allSupers || climbSupers || sporeSpawnSupers || earlySupers || etacoonSupers || goldTorizoSupers || wreckedShipLeftSupers || wreckedShipRightSupers || crabSupers || wateringHoleSupers || aqueductSupers || firstPowerBomb || allPowerBombs || landingSiteBombs || etacoonBombs || pinkBrinstarBombs || blueBrinstarBombs || alphaBombs || betaBombs || crocomireBombs || lowerNorfairEscapeBombs || shameBombs || rightSandPitBombs;

    // Item unlock section
    var varia = settings["variaSuit"] && vars.watchers["roomID"].Current == vars.roomIDEnum["varia"] && (vars.watchers["unlockedEquips2"].Old & vars.unlockFlagEnum["variaSuit"]) == 0 && (vars.watchers["unlockedEquips2"].Current & vars.unlockFlagEnum["variaSuit"]) > 0;
    var springBall = settings["springBall"] && vars.watchers["roomID"].Current == vars.roomIDEnum["springBall"] && (vars.watchers["unlockedEquips2"].Old & vars.unlockFlagEnum["springBall"]) == 0 && (vars.watchers["unlockedEquips2"].Current & vars.unlockFlagEnum["springBall"]) > 0;
    var morphBall = settings["morphBall"] && vars.watchers["roomID"].Current == vars.roomIDEnum["morphBall"] && (vars.watchers["unlockedEquips2"].Old & vars.unlockFlagEnum["morphBall"]) == 0 && (vars.watchers["unlockedEquips2"].Current & vars.unlockFlagEnum["morphBall"]) > 0;
    var screwAttack = settings["screwAttack"] && vars.watchers["roomID"].Current == vars.roomIDEnum["screwAttack"] && (vars.watchers["unlockedEquips2"].Old & vars.unlockFlagEnum["screwAttack"]) == 0 && (vars.watchers["unlockedEquips2"].Current & vars.unlockFlagEnum["screwAttack"]) > 0;
    var gravSuit = settings["gravSuit"] && vars.watchers["roomID"].Current == vars.roomIDEnum["gravity"] && (vars.watchers["unlockedEquips2"].Old & vars.unlockFlagEnum["gravSuit"]) == 0 && (vars.watchers["unlockedEquips2"].Current & vars.unlockFlagEnum["gravSuit"]) > 0;
    var hiJump = settings["hiJump"] && vars.watchers["roomID"].Current == vars.roomIDEnum["hiJump"] && (vars.watchers["unlockedEquips"].Old & vars.unlockFlagEnum["hiJump"]) == 0 && (vars.watchers["unlockedEquips"].Current & vars.unlockFlagEnum["hiJump"]) > 0;
    var spaceJump = settings["spaceJump"] && vars.watchers["roomID"].Current == vars.roomIDEnum["spaceJump"] && (vars.watchers["unlockedEquips"].Old & vars.unlockFlagEnum["spaceJump"]) == 0 && (vars.watchers["unlockedEquips"].Current & vars.unlockFlagEnum["spaceJump"]) > 0;
    var bomb = settings["bomb"] && vars.watchers["roomID"].Current == vars.roomIDEnum["bombTorizo"] && (vars.watchers["unlockedEquips"].Old & vars.unlockFlagEnum["bomb"]) == 0 && (vars.watchers["unlockedEquips"].Current & vars.unlockFlagEnum["bomb"]) > 0;
    var speedBooster = settings["speedBooster"] && vars.watchers["roomID"].Current == vars.roomIDEnum["speedBooster"] && (vars.watchers["unlockedEquips"].Old & vars.unlockFlagEnum["speedBooster"]) == 0 && (vars.watchers["unlockedEquips"].Current & vars.unlockFlagEnum["speedBooster"]) > 0;
    var grapple = settings["grapple"] && vars.watchers["roomID"].Current == vars.roomIDEnum["grapple"] && (vars.watchers["unlockedEquips"].Old & vars.unlockFlagEnum["grapple"]) == 0 && (vars.watchers["unlockedEquips"].Current & vars.unlockFlagEnum["grapple"]) > 0;
    var xray = settings["xray"] && vars.watchers["roomID"].Current == vars.roomIDEnum["xRay"] && (vars.watchers["unlockedEquips"].Old & vars.unlockFlagEnum["xray"]) == 0 && (vars.watchers["unlockedEquips"].Current & vars.unlockFlagEnum["xray"]) > 0;
    var unlock = varia || springBall || morphBall || screwAttack || gravSuit || hiJump || spaceJump || bomb || speedBooster || grapple || xray;

    // Beam unlock section
    var wave = settings["wave"] && vars.watchers["roomID"].Current == vars.roomIDEnum["waveBeam"] && (vars.watchers["unlockedBeams"].Old & vars.unlockFlagEnum["wave"]) == 0 && (vars.watchers["unlockedBeams"].Current & vars.unlockFlagEnum["wave"]) > 0;
    var ice = settings["ice"] && vars.watchers["roomID"].Current == vars.roomIDEnum["iceBeam"] && (vars.watchers["unlockedBeams"].Old & vars.unlockFlagEnum["ice"]) == 0 && (vars.watchers["unlockedBeams"].Current & vars.unlockFlagEnum["ice"]) > 0;
    var spazer = settings["spazer"] && vars.watchers["roomID"].Current == vars.roomIDEnum["spazer"] && (vars.watchers["unlockedBeams"].Old & vars.unlockFlagEnum["spazer"]) == 0 && (vars.watchers["unlockedBeams"].Current & vars.unlockFlagEnum["spazer"]) > 0;
    var plasma = settings["plasma"] && vars.watchers["roomID"].Current == vars.roomIDEnum["plasmaBeam"] && (vars.watchers["unlockedBeams"].Old & vars.unlockFlagEnum["plasma"]) == 0 && (vars.watchers["unlockedBeams"].Current & vars.unlockFlagEnum["plasma"]) > 0;
    var chargeBeam = settings["chargeBeam"] && vars.watchers["roomID"].Current == vars.roomIDEnum["bigPink"] && (vars.watchers["unlockedCharge"].Old & vars.unlockFlagEnum["chargeBeam"]) == 0 && (vars.watchers["unlockedCharge"].Current & vars.unlockFlagEnum["chargeBeam"]) > 0;
    var beam = wave || ice || spazer || plasma || chargeBeam;

    // E-tanks and reserve tanks
    var firstETank = settings["firstETank"] && vars.watchers["maxEnergy"].Old == 99 && vars.watchers["maxEnergy"].Current == 199;
    var allETanks = settings["allETanks"] && (vars.watchers["maxEnergy"].Old + 100) == (vars.watchers["maxEnergy"].Current);
    var gauntletETank = settings["gauntletETank"] && vars.watchers["roomID"].Current == vars.roomIDEnum["gauntletETankRoom"] && (vars.watchers["crateriaItems"].Old + 32) == (vars.watchers["crateriaItems"].Current);
    var terminatorETank = settings["terminatorETank"] && vars.watchers["roomID"].Current == vars.roomIDEnum["terminator"] && (vars.watchers["brinteriaItems"].Old + 1) == (vars.watchers["brinteriaItems"].Current);
    var ceilingETank = settings["ceilingETank"] && vars.watchers["roomID"].Current == vars.roomIDEnum["blueBrinstarETankRoom"] && (vars.watchers["brinstarItems3"].Old + 32) == (vars.watchers["brinstarItems3"].Current);
    var etecoonsETank = settings["etecoonsETank"] && vars.watchers["roomID"].Current == vars.roomIDEnum["etacoonETankRoom"] && (vars.watchers["brinstarItems3"].Old + 64) == (vars.watchers["brinstarItems3"].Current);
    var waterwayETank = settings["waterwayETank"] && vars.watchers["roomID"].Current == vars.roomIDEnum["waterway"] && (vars.watchers["brinstarItems4"].Old + 2) == (vars.watchers["brinstarItems4"].Current);
    var waveGateETank = settings["waveGateETank"] && vars.watchers["roomID"].Current == vars.roomIDEnum["hopperETankRoom"] && (vars.watchers["brinstarItems4"].Old + 8) == (vars.watchers["brinstarItems4"].Current);
    var kraidETank = settings["kraidETank"] && vars.watchers["roomID"].Current == vars.roomIDEnum["warehouseETankRoom"] && (vars.watchers["brinstarItems5"].Old + 8) == (vars.watchers["brinstarItems5"].Current);
    var crocomireETank = settings["crocomireETank"] && vars.watchers["roomID"].Current == vars.roomIDEnum["crocomire"] && (vars.watchers["norfairItems1"].Old + 16) == (vars.watchers["norfairItems1"].Current);
    var hiJumpETank = settings["hiJumpETank"] && vars.watchers["roomID"].Current == vars.roomIDEnum["hiJumpShaft"] && (vars.watchers["norfairItems2"].Old + 1) == (vars.watchers["norfairItems2"].Current);
    var ridleyETank = settings["ridleyETank"] && vars.watchers["roomID"].Current == vars.roomIDEnum["ridleyETankRoom"] && (vars.watchers["norfairItems4"].Old + 64) == (vars.watchers["norfairItems4"].Current);
    var firefleaETank = settings["firefleaETank"] && vars.watchers["roomID"].Current == vars.roomIDEnum["lowerNorfairFireflea"] && (vars.watchers["norfairItems5"].Old + 1) == (vars.watchers["norfairItems5"].Current);
    var wreckedShipETank = settings["wreckedShipETank"] && vars.watchers["roomID"].Current == vars.roomIDEnum["wreckedShipETankRoom"] && (vars.watchers["wreckedShipItems"].Old + 16) == (vars.watchers["wreckedShipItems"].Current);
    var tatoriETank = settings["tatoriETank"] && vars.watchers["roomID"].Current == vars.roomIDEnum["mamaTurtle"] && (vars.watchers["maridiaItems1"].Old + 4) == (vars.watchers["maridiaItems1"].Current);
    var botwoonETank = settings["botwoonETank"] && vars.watchers["roomID"].Current == vars.roomIDEnum["botwoonETankRoom"] && (vars.watchers["maridiaItems3"].Old + 1) == (vars.watchers["maridiaItems3"].Current);
    var reserveTanks = settings["reserveTanks"] && (vars.watchers["maxReserve"].Old + 100) == (vars.watchers["maxReserve"].Current);
    var brinstarReserve = settings["brinstarReserve"] && vars.watchers["roomID"].Current == vars.roomIDEnum["brinstarReserveRoom"] && (vars.watchers["brinstarItems2"].Old + 2) == (vars.watchers["brinstarItems2"].Current);
    var norfairReserve = settings["norfairReserve"] && vars.watchers["roomID"].Current == vars.roomIDEnum["norfairReserveRoom"] && (vars.watchers["norfairItems2"].Old + 32) == (vars.watchers["norfairItems2"].Current);
    var wreckedShipReserve = settings["wreckedShipReserve"] && vars.watchers["roomID"].Current == vars.roomIDEnum["bowling"] && (vars.watchers["wreckedShipItems"].Old + 2) == (vars.watchers["wreckedShipItems"].Current);
    var maridiaReserve = settings["maridiaReserve"] && vars.watchers["roomID"].Current == vars.roomIDEnum["leftSandPit"] && (vars.watchers["maridiaItems2"].Old + 2) == (vars.watchers["maridiaItems2"].Current);
    var energyUpgrade = firstETank || allETanks || gauntletETank || terminatorETank || ceilingETank || etecoonsETank || waterwayETank || waveGateETank || kraidETank || crocomireETank || hiJumpETank || ridleyETank || firefleaETank || wreckedShipETank || tatoriETank || botwoonETank || reserveTanks || brinstarReserve || norfairReserve || wreckedShipReserve || maridiaReserve;

    // Miniboss room transitions
    var miniBossRooms = false;
    if(settings["miniBossRooms"]){
        var ceresRidleyRoom = vars.watchers["roomID"].Old == vars.roomIDEnum["flatRoom"] && vars.watchers["roomID"].Current == vars.roomIDEnum["ceresRidley"];
        var sporeSpawnRoom = vars.watchers["roomID"].Old == vars.roomIDEnum["sporeSpawnKeyhunter"] && vars.watchers["roomID"].Current == vars.roomIDEnum["sporeSpawn"];
        var crocomireRoom = vars.watchers["roomID"].Old == vars.roomIDEnum["crocomireSpeedway"] && vars.watchers["roomID"].Current == vars.roomIDEnum["crocomire"];
        var botwoonRoom = vars.watchers["roomID"].Old == vars.roomIDEnum["botwoonHallway"] && vars.watchers["roomID"].Current == vars.roomIDEnum["botwoon"];
        // Allow either vanilla or GGG entry
        var goldenTorizoRoom = (vars.watchers["roomID"].Old == vars.roomIDEnum["acidStatue"] || vars.watchers["roomID"].Old == vars.roomIDEnum["screwAttack"]) && vars.watchers["roomID"].Current == vars.roomIDEnum["goldenTorizo"];
        miniBossRooms = ceresRidleyRoom || sporeSpawnRoom || crocomireRoom || botwoonRoom || goldenTorizoRoom;
    }

    // Boss room transitions
    var bossRooms = false;
    if(settings["bossRooms"]){
        var kraidRoom = vars.watchers["roomID"].Old == vars.roomIDEnum["kraidEyeDoor"] && vars.watchers["roomID"].Current == vars.roomIDEnum["kraid"];
        var phantoonRoom = vars.watchers["roomID"].Old == vars.roomIDEnum["basement"] && vars.watchers["roomID"].Current == vars.roomIDEnum["phantoon"];
        var draygonRoom = vars.watchers["roomID"].Old == vars.roomIDEnum["precious"] && vars.watchers["roomID"].Current == vars.roomIDEnum["draygon"];
        var ridleyRoom = vars.watchers["roomID"].Old == vars.roomIDEnum["lowerNorfairFarming"] && vars.watchers["roomID"].Current == vars.roomIDEnum["ridley"];
        var motherBrainRoom = vars.watchers["roomID"].Old == vars.roomIDEnum["rinkaShaft"] && vars.watchers["roomID"].Current == vars.roomIDEnum["motherBrain"];
        bossRooms = kraidRoom || phantoonRoom || draygonRoom || ridleyRoom || motherBrainRoom;
    }

    // Elevator transitions between areas
    var elevatorTransitions = false;
    if(settings["elevatorTransitions"]){
        var blueBrinstar = (vars.watchers["roomID"].Old == vars.roomIDEnum["elevatorToMorphBall"] && vars.watchers["roomID"].Current == vars.roomIDEnum["morphBall"]) || (vars.watchers["roomID"].Old == vars.roomIDEnum["morphBall"] && vars.watchers["roomID"].Current == vars.roomIDEnum["elevatorToMorphBall"]);
        var greenBrinstar = (vars.watchers["roomID"].Old == vars.roomIDEnum["elevatorToGreenBrinstar"] && vars.watchers["roomID"].Current == vars.roomIDEnum["greenBrinstarMainShaft"]) || (vars.watchers["roomID"].Old == vars.roomIDEnum["greenBrinstarMainShaft"] && vars.watchers["roomID"].Current == vars.roomIDEnum["elevatorToGreenBrinstar"]);
        var businessCenter = (vars.watchers["roomID"].Old == vars.roomIDEnum["warehouseEntrance"] && vars.watchers["roomID"].Current == vars.roomIDEnum["businessCenter"]) || (vars.watchers["roomID"].Old == vars.roomIDEnum["businessCenter"] && vars.watchers["roomID"].Current == vars.roomIDEnum["warehouseEntrance"]);
        var caterpillar = (vars.watchers["roomID"].Old == vars.roomIDEnum["elevatorToCaterpillar"] && vars.watchers["roomID"].Current == vars.roomIDEnum["caterpillar"]) || (vars.watchers["roomID"].Old == vars.roomIDEnum["caterpillar"] && vars.watchers["roomID"].Current == vars.roomIDEnum["elevatorToCaterpillar"]);
        var maridiaElevator = (vars.watchers["roomID"].Old == vars.roomIDEnum["elevatorToMaridia"] && vars.watchers["roomID"].Current == vars.roomIDEnum["maridiaElevator"]) || (vars.watchers["roomID"].Old == vars.roomIDEnum["maridiaElevator"] && vars.watchers["roomID"].Current == vars.roomIDEnum["elevatorToMaridia"]);
        elevatorTransitions = blueBrinstar || greenBrinstar || businessCenter || caterpillar || maridiaElevator;
    }

    // Room transitions
    var ceresEscape = settings["ceresEscape"] && vars.watchers["roomID"].Current == vars.roomIDEnum["ceresElevator"] && vars.watchers["gameState"].Old == vars.gameStateEnum["normalGameplay"] && vars.watchers["gameState"].Current == vars.gameStateEnum["startOfCeresCutscene"];
    var wreckedShipEntrance = settings["wreckedShipEntrance"] && vars.watchers["roomID"].Old == vars.roomIDEnum["westOcean"] && vars.watchers["roomID"].Current == vars.roomIDEnum["wreckedShipEntrance"];
    var redTowerMiddleEntrance = settings["redTowerMiddleEntrance"] && vars.watchers["roomID"].Old == vars.roomIDEnum["noobBridge"] && vars.watchers["roomID"].Current == vars.roomIDEnum["redTower"];
    var redTowerBottomEntrance = settings["redTowerBottomEntrance"] && vars.watchers["roomID"].Old == vars.roomIDEnum["bat"] && vars.watchers["roomID"].Current == vars.roomIDEnum["redTower"];
    var kraidsLair = settings["kraidsLair"] && vars.watchers["roomID"].Old == vars.roomIDEnum["warehouseEntrance"] && vars.watchers["roomID"].Current == vars.roomIDEnum["warehouseZeela"];
    var risingTideEntrance = settings["risingTideEntrance"] && vars.watchers["roomID"].Old == vars.roomIDEnum["cathedral"] && vars.watchers["roomID"].Current == vars.roomIDEnum["risingTide"];
    var atticExit = settings["atticExit"] && vars.watchers["roomID"].Old == vars.roomIDEnum["attic"] && vars.watchers["roomID"].Current == vars.roomIDEnum["westOcean"];
    var tubeBroken = settings["tubeBroken"] && vars.watchers["roomID"].Current == vars.roomIDEnum["glassTunnel"] && (vars.watchers["eventFlags"].Old & vars.eventFlagEnum["tubeBroken"]) == 0 && (vars.watchers["eventFlags"].Current & vars.eventFlagEnum["tubeBroken"]) > 0;
    var cacExit = settings["cacExit"] && vars.watchers["roomID"].Old == vars.roomIDEnum["westCactusAlley"] && vars.watchers["roomID"].Current == vars.roomIDEnum["butterflyRoom"];
    var toilet = settings["toilet"] && (vars.watchers["roomID"].Old == vars.roomIDEnum["plasmaSpark"] && vars.watchers["roomID"].Current == vars.roomIDEnum["toiletBowl"] || vars.watchers["roomID"].Old == vars.roomIDEnum["oasis"] && vars.watchers["roomID"].Current == vars.roomIDEnum["toiletBowl"]);
    var kronicBoost = settings["kronicBoost"] && (vars.watchers["roomID"].Old == vars.roomIDEnum["magdolliteTunnel"] && vars.watchers["roomID"].Current == vars.roomIDEnum["kronicBoost"] || vars.watchers["roomID"].Old == vars.roomIDEnum["spikyAcidSnakes"] && vars.watchers["roomID"].Current == vars.roomIDEnum["kronicBoost"] || vars.watchers["roomID"].Old == vars.roomIDEnum["volcano"] && vars.watchers["roomID"].Current == vars.roomIDEnum["kronicBoost"]);
    var lowerNorfairEntrance = settings["lowerNorfairEntrance"] && vars.watchers["roomID"].Old == vars.roomIDEnum["lowerNorfairElevator"] && vars.watchers["roomID"].Current == vars.roomIDEnum["mainHall"];
    var writg = settings["writg"] && vars.watchers["roomID"].Old == vars.roomIDEnum["pillars"] && vars.watchers["roomID"].Current == vars.roomIDEnum["writg"];
    var redKiShaft = settings["redKiShaft"] && (vars.watchers["roomID"].Old == vars.roomIDEnum["amphitheatre"] && vars.watchers["roomID"].Current == vars.roomIDEnum["redKiShaft"] || vars.watchers["roomID"].Old == vars.roomIDEnum["wasteland"] && vars.watchers["roomID"].Current == vars.roomIDEnum["redKiShaft"]);
    var metalPirates = settings["metalPirates"] && vars.watchers["roomID"].Old == vars.roomIDEnum["wasteland"] && vars.watchers["roomID"].Current == vars.roomIDEnum["metalPirates"];
    var lowerNorfairSpringMaze = settings["lowerNorfairSpringMaze"] && vars.watchers["roomID"].Old == vars.roomIDEnum["lowerNorfairFireflea"] && vars.watchers["roomID"].Current == vars.roomIDEnum["lowerNorfairSpringMaze"];
    var lowerNorfairExit = settings["lowerNorfairExit"] && vars.watchers["roomID"].Old == vars.roomIDEnum["threeMusketeers"] && vars.watchers["roomID"].Current == vars.roomIDEnum["singleChamber"];
    var allBossesFinished = (vars.watchers["brinstarBosses"].Current & vars.bossFlagEnum["kraid"]) > 0 && (vars.watchers["wreckedShipBosses"].Current & vars.bossFlagEnum["phantoon"]) > 0 && (vars.watchers["maridiaBosses"].Current & vars.bossFlagEnum["draygon"]) > 0 && (vars.watchers["norfairBosses"].Current & vars.bossFlagEnum["ridley"]) > 0;
    var goldenFour = settings["goldenFour"] && vars.watchers["roomID"].Old == vars.roomIDEnum["statuesHallway"] && vars.watchers["roomID"].Current == vars.roomIDEnum["statues"] && allBossesFinished;
    var tourianEntrance = settings["tourianEntrance"] && vars.watchers["roomID"].Old == vars.roomIDEnum["statues"] && vars.watchers["roomID"].Current == vars.roomIDEnum["tourianElevator"];
    var metroids = settings["metroids"] && (vars.watchers["roomID"].Old == vars.roomIDEnum["metroidOne"] && vars.watchers["roomID"].Current == vars.roomIDEnum["metroidTwo"] || vars.watchers["roomID"].Old == vars.roomIDEnum["metroidTwo"] && vars.watchers["roomID"].Current == vars.roomIDEnum["metroidThree"] || vars.watchers["roomID"].Old == vars.roomIDEnum["metroidThree"] && vars.watchers["roomID"].Current == vars.roomIDEnum["metroidFour"] || vars.watchers["roomID"].Old == vars.roomIDEnum["metroidFour"] && vars.watchers["roomID"].Current == vars.roomIDEnum["tourianHopper"]);
    var babyMetroidRoom = settings["babyMetroidRoom"] && vars.watchers["roomID"].Old == vars.roomIDEnum["dustTorizo"] && vars.watchers["roomID"].Current == vars.roomIDEnum["bigBoy"];
    var escapeClimb = settings["escapeClimb"] && vars.watchers["roomID"].Old == vars.roomIDEnum["tourianEscape4"] && vars.watchers["roomID"].Current == vars.roomIDEnum["climb"];
    var roomTransitions = miniBossRooms || bossRooms || elevatorTransitions || ceresEscape || wreckedShipEntrance || redTowerMiddleEntrance || redTowerBottomEntrance || kraidsLair || risingTideEntrance || atticExit || tubeBroken || cacExit || toilet || kronicBoost || lowerNorfairEntrance || writg || redKiShaft || metalPirates || lowerNorfairSpringMaze || lowerNorfairExit || tourianEntrance || goldenFour || metroids || babyMetroidRoom || escapeClimb;

    // Minibosses
    var ceresRidley = settings["ceresRidley"] && (vars.watchers["ceresBosses"].Old & vars.bossFlagEnum["ceresRidley"]) == 0 && (vars.watchers["ceresBosses"].Current & vars.bossFlagEnum["ceresRidley"]) > 0 && vars.watchers["roomID"].Current == vars.roomIDEnum["ceresRidley"];
    var bombTorizo = settings["bombTorizo"] && (vars.watchers["crateriaBosses"].Old & vars.bossFlagEnum["bombTorizo"]) == 0 && (vars.watchers["crateriaBosses"].Current & vars.bossFlagEnum["bombTorizo"]) > 0 && vars.watchers["roomID"].Current == vars.roomIDEnum["bombTorizo"];
    var sporeSpawn = settings["sporeSpawn"] && (vars.watchers["brinstarBosses"].Old & vars.bossFlagEnum["sporeSpawn"]) == 0 && (vars.watchers["brinstarBosses"].Current & vars.bossFlagEnum["sporeSpawn"]) > 0 && vars.watchers["roomID"].Current == vars.roomIDEnum["sporeSpawn"];
    var crocomire = settings["crocomire"] && (vars.watchers["norfairBosses"].Old & vars.bossFlagEnum["crocomire"]) == 0 && (vars.watchers["norfairBosses"].Current & vars.bossFlagEnum["crocomire"]) > 0 && vars.watchers["roomID"].Current == vars.roomIDEnum["crocomire"];
    var botwoon = settings["botwoon"] && (vars.watchers["maridiaBosses"].Old & vars.bossFlagEnum["botwoon"]) == 0 && (vars.watchers["maridiaBosses"].Current & vars.bossFlagEnum["botwoon"]) > 0 && vars.watchers["roomID"].Current == vars.roomIDEnum["botwoon"];
    var goldenTorizo = settings["goldenTorizo"] && (vars.watchers["norfairBosses"].Old & vars.bossFlagEnum["goldenTorizo"]) == 0 && (vars.watchers["norfairBosses"].Current & vars.bossFlagEnum["goldenTorizo"]) > 0 && vars.watchers["roomID"].Current == vars.roomIDEnum["goldenTorizo"];
    var minibossDefeat = ceresRidley || bombTorizo || sporeSpawn || crocomire || botwoon || goldenTorizo;

    // Bosses
    var kraid = settings["kraid"] && (vars.watchers["brinstarBosses"].Old & vars.bossFlagEnum["kraid"]) == 0 && (vars.watchers["brinstarBosses"].Current & vars.bossFlagEnum["kraid"]) > 0 && vars.watchers["roomID"].Current == vars.roomIDEnum["kraid"];
    if(kraid){
        vars.DebugOutput("Split due to kraid defeat");
    }
    var phantoon = settings["phantoon"] && (vars.watchers["wreckedShipBosses"].Old & vars.bossFlagEnum["phantoon"]) == 0 && (vars.watchers["wreckedShipBosses"].Current & vars.bossFlagEnum["phantoon"]) > 0 && vars.watchers["roomID"].Current == vars.roomIDEnum["phantoon"];
    if(phantoon){
        vars.DebugOutput("Split due to phantoon defeat");
    }
    var draygon = settings["draygon"] && (vars.watchers["maridiaBosses"].Old & vars.bossFlagEnum["draygon"]) == 0 && (vars.watchers["maridiaBosses"].Current & vars.bossFlagEnum["draygon"]) > 0 && vars.watchers["roomID"].Current == vars.roomIDEnum["draygon"];
    if(draygon){
        vars.DebugOutput("Split due to draygon defeat");
    }
    var ridley = settings["ridley"] && (vars.watchers["norfairBosses"].Old & vars.bossFlagEnum["ridley"]) == 0 && (vars.watchers["norfairBosses"].Current & vars.bossFlagEnum["ridley"]) > 0 && vars.watchers["roomID"].Current == vars.roomIDEnum["ridley"];
    if(ridley){
        vars.DebugOutput("Split due to ridley defeat");
    }
    // Mother Brain phases
    var inMotherBrainRoom = vars.watchers["roomID"].Current == vars.roomIDEnum["motherBrain"];
    var mb1 = settings["mb1"] && inMotherBrainRoom && vars.watchers["gameState"].Current == vars.gameStateEnum["normalGameplay"] && vars.watchers["motherBrainHP"].Old == 0 && vars.watchers["motherBrainHP"].Current == (vars.motherBrainMaxHPEnum["phase2"]);
    if(mb1){
        vars.DebugOutput("Split due to mb1 defeat");
    }
    var mb2 = settings["mb2"] && inMotherBrainRoom && vars.watchers["gameState"].Current == vars.gameStateEnum["normalGameplay"] && vars.watchers["motherBrainHP"].Old == 0 && vars.watchers["motherBrainHP"].Current == (vars.motherBrainMaxHPEnum["phase3"]);
    if(mb2){
        vars.DebugOutput("Split due to mb2 defeat");
    }
    var mb3 = settings["mb3"] && inMotherBrainRoom && (vars.watchers["tourianBosses"].Old & vars.bossFlagEnum["motherBrain"]) == 0 && (vars.watchers["tourianBosses"].Current & vars.bossFlagEnum["motherBrain"]) > 0;
    if(mb3){
        vars.DebugOutput("Split due to mb3 defeat");
    }
    var bossDefeat = kraid || phantoon || draygon || ridley || mb1 || mb2 || mb3;

    // Run-ending splits
    var escape = settings["rtaFinish"] && (vars.watchers["eventFlags"].Current & vars.eventFlagEnum["zebesAblaze"]) > 0 && vars.watchers["shipAI"].Old != 0xaa4f && vars.watchers["shipAI"].Current == 0xaa4f;

    var takeoff = settings["igtFinish"] && vars.watchers["roomID"].Current == vars.roomIDEnum["landingSite"] && vars.watchers["gameState"].Old == vars.gameStateEnum["preEndCutscene"] && vars.watchers["gameState"].Current == vars.gameStateEnum["endCutscene"];

    var sporeSpawnRTAFinish = false;
    if(settings["sporeSpawnRTAFinish"]){
        if(vars.pickedUpSporeSpawnSuper){
            if(vars.watchers["igtFrames"].Old != vars.watchers["igtFrames"].Current){
                sporeSpawnRTAFinish = true;
                vars.pickedUpSporeSpawnSuper = false;
            }
        }
        else {
            vars.pickedUpSporeSpawnSuper = vars.watchers["roomID"].Current == vars.roomIDEnum["sporeSpawnSuper"] && (vars.watchers["maxSupers"].Old + 5) == (vars.watchers["maxSupers"].Current) && (vars.watchers["brinstarBosses"].Current & vars.bossFlagEnum["sporeSpawn"]) > 0;
        }
    }

    var hundredMissileRTAFinish = false;
    if(settings["hundredMissileRTAFinish"]){
        if(vars.pickedUpHundredthMissile){
            if(vars.watchers["igtFrames"].Old != vars.watchers["igtFrames"].Current){
                hundredMissileRTAFinish = true;
                vars.pickedUpHundredthMissile = false;
            }
        }
        else{
            vars.pickedUpHundredthMissile = vars.watchers["maxMissiles"].Old == 95 && vars.watchers["maxMissiles"].Current == 100;
        }
    }

    var nonStandardCategoryFinish = sporeSpawnRTAFinish || hundredMissileRTAFinish;

    if(pickup){
        vars.DebugOutput("Split due to pickup");
    }
    if(unlock){
        vars.DebugOutput("Split due to unlock");
    }
    if(beam){
        vars.DebugOutput("Split due to beam upgrade");
    }
    if(energyUpgrade){
        vars.DebugOutput("Split due to energy upgrade");
    }
    if(roomTransitions){
        vars.DebugOutput("Split due to room transition");
    }
    if(minibossDefeat){
        vars.DebugOutput("Split due to miniboss defeat");
    }
    // individual boss defeat conditions already covered above
    if(escape){
        vars.DebugOutput("Split due to escape");
    }
    if(takeoff){
        vars.DebugOutput("Split due to takeoff");
    }
    if(nonStandardCategoryFinish){
        vars.DebugOutput("Split due to non standard category finish");
    }

    return pickup || unlock || beam || energyUpgrade || roomTransitions || minibossDefeat || bossDefeat || escape || takeoff || nonStandardCategoryFinish;
}

gameTime
{
    var frames  = vars.watchers["igtFrames"].Current;
    var seconds = vars.watchers["igtSeconds"].Current;
    var minutes = vars.watchers["igtMinutes"].Current;
    var hours   = vars.watchers["igtHours"].Current;

    if(frames == 0 && vars.watchers["igtFrames"].Old == 49){
        vars.frameRate = 50.0;
    }

    current.totalTime = (frames / vars.frameRate) + seconds + (60 * minutes) + (60 * 60 * hours);
    return TimeSpan.FromSeconds(current.totalTime);
}

isLoading
{
    // From the AutoSplit documentation:
    // "If you want the Game Time to not run in between the synchronization interval and only ever return
    // the actual Game Time of the game, make sure to implement isLoading with a constant
    // return value of true."
    return true;
}
