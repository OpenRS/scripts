-- Druidic Ritual
-- Start Location: The Druid's circle in Taverley

-- Kaqemeex: A wise druid
--------------------------------------------------

local skills = require('./../constants/skills')
local quests = require('./../constants/quests')

local function onTalkKaqemeex()
	chatplayer("Hello there.")

	if %DruidicRitual == 3 then
		chatnpc("I have word from Sanfew that you have been very helpful in assisting him with his preparations for the purification ritual. As promised I will now teach you the ancient arts of Herblore.")
		chatnpc("Herblore is the skill of working with herbs and other ingredients, to make useful potions and poison.")
		chatnpc("First you will need a vial, which can be found or made with the crafting skill.")
		chatnpc("Then you musr gather the herbs needed to make the potions you want.")
		chatnpc("You must fill your vial with water and add the ingredients you need. There are normally 2 ingredients to each type of potion.")
		chatnpc("Bear in mind, you must first clean each herb before you can use it.")
		chatnpc("You may also have to grind some ingredients before you can use them. You will need a pestle and mortar in order to do this.")
		chatnpc("Herbs can be found on the ground, and are also dropped by some monsters when you kill them.")
		chatnpc("Let's try an example Attack potion: The first ingredient is Guam lead; the next is Eye of Newt.")
		chatnpc("Mix these in your water-filled vial, and you will produce an Attack potion. Drink this potion to increase your Attack level.")
		chatnpc("Different potions also require different Herblore levels before you can make them.")
		DruidicRitual = 4
		player.CompleteQuest(18)
		player.GiveXp(skills.herblore, 250)
		return
	end

	if %DruidicRitual == 1 or %DruidicRitual == 2 then
		chatnpc("Hello again, adventurer. You will need to speak to my fellow druid Sanfew in the village south of here to continue in your quest.")
		chatplayer("Okay, thanks.")
		return
	end

	if %DruidicRitual == 0 then
		chatnpc("What brings you to our holy monument?")

		local selected = menu("Who are you?", "I'm in search of a quest.", "Did you build this?"))

		if selected == 0 then
			chatplayer("Who are you?")
			chatnpc("We are the druids of Guthix. We worship our god at our famous stone circles. You will find them located throughout these lands.")
			
			local selected = menu("What about the stone circle full of dark wizards?", "So... is there anything in this for me?", "So what's so good about Guthix?", "Well, I'll be on my way now."))

			if selected == 0 then
				DR_DarkWizards()

				local selected = menu("Okay, I will try and help.", "No, that doesn't sound very interesting.")

				if selected == 0 then
					DR_Start()
				else
					DR_Reject()
				end
			elseif if selected == 1 then
				DR_Reward()
			elseif if selected == 2 then
				chatplayer("So what's so good about Guthix?")
				chatnpc("Guthix is the oldest and most powerful god in RuneScape. His existence is vital to this world. He is the god of balance, and nature; he is also very part of this world.")
				chatnpc("He exists in the trees, and the flowers, the water and the rocks. He is everywhere. His purpose is to ensure balance in everything in this world, and as such we worship him.")
				chatplayer("He sounds kind of boring...")
				chatnpc("Some day when your mind achieves enlightenment you will see the true beauty of his power.")
				return
			else
				DR_Leave()
			end
		elseif selected == 1 then
			chatplayer("I'm in search of a quest.")
			chatnpc("Hmm. I think I may have a worthwile quest for you actuslly. I don't know if you are familiar with the stone circle south of Varrock or not, but...")
			DR_QuestExplain()
		else
			chatplayer("Did you build this?")
			chatnpc("What, personally? No, of course I didn't. However, our forefathers did. The first Druids of Guthix built many stone circles across these lands over eight hundred years ago.")
			chatnpc("Unfortunately we only know of two remaining, and of those only one is usable by us anymore.")

			local selected = menu("What about the stone circle full of dark wizards?", "I'm in search of a quest.", "Well, I'll be on my way now.")

			if selected == 0 then
				chatplayer("What about the stone circle full of dark wizards?")
			elseif if selected == 1 then
				chatplayer("I'm in search of a quest.")
				chatnpc("Hmm. I think I may have a worthwile quest for you actually. I don't know if you are familiar with the stone circle south of Varrock or not, but...")
				DR_QuestExplain()
			else
				DR_Leave()
			end
		end
	end
end

local function DR_DarkWizards()
	chatnpc("That used to be OUR stone circle. Unfortunately, many many years ago, dark wizards cast a wicked spell upon it so that they could corrupt its power for their own evil ends.")
	chatnpc("When they cursed the rocks for their rituals they made them useless to us and our magics. We require a brave adventurer to go on a quest for us to help purify the circle of Varrock.")
end

local function DR_QuestExplain()
	DR_DarkWizards()
	
	local selected = menu("Okay, I will try and help.", "No, that doesn't sound very interesting.", "So... is there anything in this for me?")
	
	if selected == 0 then
		DR_Start()
	elseif selected == 1 then
		DR_Reject()
	else
		DR_Reward()
	end
end

local function DR_Reward()
	chatplayer("So... is there anything in this for me?")
	chatnpc("We druids value wisdom over wealth, so if you expect material gain, you will be disappointed. We are, however, very skilled in the art of Herblore, which we will share with you.")
	chatnpc("if you can assist us in this task. You may find such wisdom a greater reward than mere money.")
	
	local selected = menu("Ok, I will try and help.", "No, that doesn't sound very interesting.")

	if selected == 0 then
		DR_Start()
	else
		DR_Reject()
	end
end

local function DR_Leave()
	chatplayer("Well, I'll be on my way now.")
	chatnpc("Goodbye adventurer. I feel we shall meet again.")
	return
end

local function DR_Reject()
	chatplayer("No, that doesn't sound very interesting.")
	chatnpc("I will not try and change your mind adventurer. Some day when you have matured you may reconsider your position. We will wait until then.")
	return
end

local function DR_Start()
	chatnpc("Excellent. Go to the village south of this place and speak to my fellow druid, Sanfew, who is working on the purification ritual. He knows what is required to complete it.")
	chatplayer("Will do.")

	if %DruidicRitual == 0 then
		%DruidicRitual = 1
		player.AddQuest(18)
	end

	return
end

RegisterNPCAction("Kaqemeex", 0, onTalkKaqemeex)

-- Sanfew
--------------------------------------------------

local function onTalkSanfew()
	if %DruidicRitual == 2 then
		chatnpc("Did you bring me the required ingredients for the potion?")

		if (player.GetItemCount(522) > 0 and player.GetItemCount(523) > 0 and player.GetItemCount(524) > 0 and player.GetItemCount(525) > 0) then
			chatplayer("Yes, I have all four now!")
			chatnpc("Well hand' em over then lad!")
			chatnpc("Thank you so much adventurer! These meats will allow our potion to honour Guthix to be completed, and bring one step closer to reclaiming our stone circle!")
			chatnpc("Now go and talk to Kaqemeex and he will introduce you to the wonderful world of herblore and potion making!")
			
			player.RemoveItem(522, 1)
			player.RemoveItem(523, 1)
			player.RemoveItem(524, 1)
			player.RemoveItem(525, 1)

			%DruidicRitual = 3
			chatmessage(0, "Sanfew grunts")
			return
		else
			chatplayer("No, not yet...")
			chatnpc("Well let me know when you do young 'un.")
			
			local selected = menu("What was I meant to be doing again?", "I'll get on with it.")

			if selected == 0 then
				chatplayer("What was I meant to be doing again?")
				chatnpc("Trouble with your memory eh young 'un? I need the raw meats of four different animals that have been dipped into the Cauldron of Thunder so I can make my potion to honour Guthix.")
				Sanfew_Cauldron()
			else
				chatplayer("I'll get on with it.")
				chatnpc("Good, good.")
				return
			end
		end
	end

	if %DruidicRitual == 1 then
		chatnpc("What can I do for you young 'un?")
		
		local selected = menu("I've been sent to help purify the Varrock stone circle.", "Actually, I don't need to speak to you.")

		if selected == 0 then
			chatplayer("I've been sent to assist you with the ritual to purify the Varrockian stone circle.")
			chatnpc("Well, what I'm struggling with right now is the meats needed for the potion to honour Guthix. I need the raw meat of four different animal for it, but not just any old meats will do.")
			chatnpc("Each meat has to be dipped individually into the Cauldron of Thunder for it to work correctly.")
			Sanfew_Cauldron()
		else
			Sanfew_Leave()
		end
	end
end

local function Sanfew_Cauldron()
	local selected = menu("Where can I find this cauldron?", "Ok, I will do that then.")
	
	if selected == 0 then
		chatnpc("It is located somewhere in the mysterious underground halls which are located somewhere in the woods just South of here. They are too dangerous for me to go myself however.")
	else
		chatplayer("Ok, I will do that then.")
		chatnpc("Well thank you very much!")
	end

	if %DruidicRitual == 1 then
		%DruidicRitual = 2
	end
	return
end

local function Sanfew_Leave()
	chatplayer("Actually, I don't need to speak to you.")
	chatnpc("Well, we all make mistakes sometimes.")
	return
end

RegisterNPCAction("Sanfew", 0, onTalkSanfew)


-- Cauldron of Thunder
--------------------------------------------------

local function onUseItemCauldron(item)
	if item.GetId == 2132 then
		chatmessage(0, "You dip the raw beef in the cauldron.")
		player.RemoveItem(2132, 1)
		player.GetItem(522, 1)
	elseif item.GetId == 2134 then
		chatmessage(0, "You dip the raw bear meat in the cauldron.")
		player.RemoveItem(2134, 1)
		player.GetItem(523, 1)
	elseif item.GetId == 2136 then
		chatmessage(0, "You dip the raw rat meat in the cauldron.")
		player.RemoveItem(2136, 1)
		player.GetItem(524, 1)
	elseif item.GetId == 2138 then
		chatmessage(0, "You dip the raw chicken in the cauldron.")
		player.RemoveItem(2138, 1)
		player.GetItem(525, 1)
	else
		-- Trigger nothing interesting message
	end
	return
end

RegisterNPCUseItem("ThunderCauldron", onUseItemCauldron)