-- Herblore Skillcape
-- TODO: Missing Dialog

-- Kaqemeex: A wise druid
--------------------------------------------------

local skills = require('./../constants/skills')
local quests = require('./../constants/quests')

local function onNPCTalk(player, npc)
	chatplayer("Hello there.")

	if (questcompleted(18)) then
		chatnpc("Hello again. How is the Herblore going?")

		local selected = menu("Very well, thank you.", "I need more practice at it...", "Can you explain the fundamentals again?", "What must I do to wear a Herblore skillcape?")

		if selected == 0 then
			chatplayer("Very well, thank you.")
			chatnpc("That is good to hear.")
			return
		elseif selected == 1 then
			chatplayer("I need more practice at it...")
			chatnpc("Persistence is the key to success.")
			return
		elseif selected == 2 then
			chatplayer("Can you explain the fundamentals again?")
			chatnpc("Indeed I will...")
			chatnpc("Herblore is the skill of working with herbs and other ingredients, to make useful potions and poison.")
			chatnpc("First you will need a vial, which can be found or made with the crafting skill.")
			chatnpc("Then you must gather the herbs needed to make the potions you want.")
			chatnpc("You must fill your vial with water and add the ingredients you need. There are normally 2 ingredients to each type of potion.")
			chatnpc("Bear in mind, you must first clean each herb before you can use it.")
			chatnpc("You may also have to grind some ingredients before you can use them. You will need a pestle and mortar in order to do this.")
			chatnpc("Herbs can be found on the ground, and are also dropped by some monsters when you kill them.")
			chatnpc("Let's try an example Attack potion: The first ingredient is Guam lead; the next is Eye of Newt.")
			chatnpc("Mix these in your water-filled vial, and you will produce an Attack potion. Drink this potion to increase your Attack level.")
			chatnpc("Different potions also require different Herblore levels before you can make them.")
			chatnpc("Good luck with your Herblore practices, and a good day to you.")
			chatplayer("Thank for your help.")
			return
		else
			chatplayer("What must I do to wear a Herblore skillcape?")
			chatnpc("To earn the right to wear any skillcape you need to have mastered that skill to the highest level possible and it is no different for Herblore.")
			if player.GetSkillLevel(skills.herblore) >= 99 then
			else
				chatnpc("With the cape equipped the Nardah Herbalist will create unfinished potions for you and you may search the cape for a pestle and mortar. When you have achieved a level of 99, come back and talk to me again.")
			end
			return
		end
	end
end

RegisterNPCAction("Kaqemeex", 0, onNPCTalk)