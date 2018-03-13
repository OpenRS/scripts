-- Eadgar's Ruse
-- Start Location: Talk to Sanfew in Taverley

-- Sanfew
--------------------------------------------------

local skills = require('./../constants/skills')
local quests = require('./../constants/quests')

local function onNPCTalk(player, npc)
	if (questcompleted(18) and questcompleted(quests.troll_stronghold)) then
		chatnpc("What can I do for you young 'un?")

		local selected = menu("Have you any more work for me, to help reclaim the circle?", "Actually, I don't need to speak to you.")

		if selected == 0 then
			chatnpc("Have you any more work for me, to help reclaim the circle?")
			if player.GetSkillLevel(skills.herblore) < 31 then
				chatnpc("I'm afraid you are not yet learned enough in the art of Herblore to be able to help me, adventurer...")
			end
		else
			chatplayer("Actually, I don't need to speak to you.")
			chatnpc("Well, we all make mistakes sometimes.")
			return
		end
	end
end

RegisterNPCAction("Sanfew", 0, onNPCTalk)