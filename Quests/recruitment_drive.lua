-- Recruitment Drive
--
-- The Temple Knights of Saradomin, a secret organisation founded many centuries ago by Saradomin himself, are currently looking to expand their ranks with some new blood.
-- After the successful thwarting of the Black Knights' plans to take over Asgarnia, and with the personal recommendation of Sir Amik, you have now been offered the chance
-- to apply for membership in this organisation... but are you up to the challenge?
--
-- Quest Points: 1
-- Reward: 1,000 Prayer, Herblore, Agility XP, Gaze of Saradomin, Temple Knight's Helm

-- Sir Amik Varze
-------------------------------------------------

local function onAmikTalk()
	if player.IsQuestCompleted(12) then
		chatplayer("Hello Sir Amik.")
		chatnpc("Hello, friend!")
		chatplayer("Do you have any other quests for me to do?")
		chatnpc("Quests, eh?\nWell, I don't have anything on the go at the moment, but there is an organisation that is always looking for capable adventurers to assist them.")
		chatnpc("Your excellent work sorting out those Black Knights means I will happily write you a letter of recommendation.")
		chatnpc("Would you like me to put your name forwards to them?")
		
		local selected = menu("Yes please", "No thanks", "Tell me about this organisation...")
		
		if selected == 0 then
			return
		elseif selected == 1 then
			chatplayer("No thanks, that doesn't sound like the kind of thing that would interest me...")
			chatnpc("As you wish adventurer, let's say no more about it.")
			return
		else
			chatplayer("Well, I would be pretty stupid to just join some organisation without knowing anything about them, wouldn't I?")
			chatplayer("Could you maybe tell me a little about them so I can see if it's the kind of place I would like to join?")
			chatnpc("I can not tell you much... \nThey are called the Temple Knights, and are an organisation that was founded by Saradomin personally many centuries ago.")
			chatnpc("There are many rumours and fables about their works and actions, but official records of their presence are non-existent.")
			chatnpc("It is a secret organisation of extraordinary power and resourcefulness...")
			chatnpc("Let me put it this way;\nShould you decide to take them up on their generous offer to join, you will find yourself in an advantageous position that many in this world would envy, and that")
			chatnpc("few are called to occupy.")
			chatplayer("Well that wasn't quite as helpful as I thought it would be, but thanks anyway I guess.")
			return
		end
	end
end

RegisterNPCAction("Sir Amik Varze", 0, onAmikTalk)
	