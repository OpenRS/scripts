-- Black Knights' Fortress
-- The Black Knights are up to no good. You are hired by the White Knights to spy on them and uncover their evil scheme.
--
-- Quest Points: 3
-- Reward: 2,500 Coins

-- Sir Amik Varze
-------------------------------------------------

local function onAmikTalk()
	if player.CheckQuestStep(12) == 3 then
		chatplayer("I have ruined the Black Knights' invincibility potion. That should put a stop to your problem and an end to their little schemes.")
		chatnpc("Yes, we have just received a message from the Black Knights saying they withdraw their demands, which would seem to confirm your story.")
		chatplayer("Now, I believe there was some talk of a cash reward...")
		chatnpc("Absolutely right. Please accept this reward.")
		chatmessage("Sir Amik hands you 2500 coins.")
		player.CompleteQuest(12)
		player.GetItem(617, 2500)
		return
	end
	
	if player.CheckQuestStep(12) == 2 then
		chatnpc("How's the mission going?")
		chatplayer("I've found out what the Black Knights' secret weapon is. It's a potion of invincibility.")
		chatnpc("A potion of invincibility? That is grave news indeed. If you can sabotage it somehow, you will be very well paid.")
		chatplayer("So when I finish this mission for you can I be a white knight? Can I wear your armour too?")
		chatnpc("I am afraid I cannot authorise you to become a white knight unless under a situation of dire circumstance. Assisting us on a freelance basis will be well worth your time however and you will have my personal gratitude.")
		chatplayer("I can't buy stuff with personal gratitude though...")
		chatnpc("There is of course also the financial recompense as I said.")
		chatplayer("Ok! I'll get on to sabotaging that potion.")
		return
	end

	if player.CheckQuestStep(12) == 1 then
		chatnpc("How's the mission going?")
		chatplayer("I haven't managed to find what the secret weapon is yet...")
		chatnpc("Well, keep at it! Falador's future is at stake!")

		if player.GetItemCount(9589, 1) < 1 then
			chatnpc("Here's the dossier on the case.")
			player.GetItem(9589, 1)
		else
			chatnpc("Don't forget to read that dossier of information I gave you.")
		end

		return
	end

	chatnpc("I am the leader of the White Knights of Falador. Why do you seek my audience?")

	local selected = menu("I seek a quest!", "I don't, I'm just looking around.")

	if selected == 0 then
		chatplayer("I seek a quest.")
		chatnpc("Well, I need some spy work doing but it's quite dangerous. It will involve going into the Black Knights' fortress.")

		local selected = menu("I laugh in the face of danger!", "I go and cower in a corner at the first sign of danger!")

		if selected == 0 then
			chatplayer("I laugh in the face of danger!")
			chatnpc("Well that's good. Don't get too overconfident though.")
			OnAmikAcceptBKF()
		else
			chatplayer("I go and cower in a corner at the first sign of danger!")
			chatnpc("Err....")
			chatnpc("Well.")
			chatnpc("I... suppose spy work DOES involve a little hiding in corners.")

			local selected = menu("Oh. I suppose I'll give it a go then.", "No, I'm not ready to do that.")

			if selected == 0 then
				chatplayer("Oh. I suppose I'll give it a go then.")
				OnAmikAcceptBKF()
			else
				chatplayer("No, I'm not ready to do that.")
				chatnpc("Come see me again if you change your mind.")
				return
			end
		end
	else
		chatplayer("I don't, I'm just looking around.")
		chatnpc("Ok. Please don't break anything.")
		return
	end
end

local function OnAmikAcceptBKF()
	chatnpc("You've come along at just the right time actually. All of my knight are already known to the Black Knights.")
	chatnpc("Subtlety isn't exactly our strong point.")
	chatplayer("Can't you just take your White Knights' armour off? They wouldn't recognise you then!")
	chatnpc("I am afraid our charter prevents us using espionage in any form, that is the domain of the Temple Knights.")
	chatplayer("Temple Knights? Who are they?")
	chatnpc("That information is classified. I am forbidden to share it with outsiders.")
	chatplayer("So... what do you need doing?")
	chatnpc("Well, the Black Knights have started making strange threats to us; demanding large amounts of money and land, and threatening to invade Faladar if we don't pay them.")
	chatnpc("Now, NORMALLY this wouldn't be a problem...")
	chatnpc("But they claim to have a powerful new secret weapon.")
	chatnpc("Your mission, should you decide to accept it, is to infiltrate their fortress, find out what their secret weapon is, and then sabotage it.")

	local selected = menu("Ok, I'll do my best.", "No, I'm not ready to do that.")

	if selected == 0 then
		chatplayer("Ok, I'll do my best.")
		chatnpc("Good luck! Let me know how you get on. Here's the dossier for the case, I've already given you the details.")
		player.GetItem(9589, 1)
		player.AddQuest(12)
		return
	else
		chatplayer("No, I'm not ready to do that.")
		chatnpc("Come see me again if you change your mind.")
		return
	end
end

RegisterNPCAction("Sir Amik Varze", 0, onAmikTalk)

-- Sturdy Door
-------------------------------------------------

local function onOpenSturdyDoor()
	if player.IsEquipped(1101) and player.IsEquipped(1139) then
		-- Open Door and make player walk inside, then close door automatically.
	elseif player.IsEquipped(1165) and player.IsEquipped(1125) and player.IsEquipped(1077) then
		-- Open Door and make player walk inside, then close door automatically.
	elseif player.IsEquipped(14499) and player.IsEquipped(14497) and player.IsEquipped(14501) then
		-- Open Door and make player walk inside, then close door automatically.
	elseif player.IsEquipped(14494) and player.IsEquipped(14492) and player.IsEquipped(14490) then
		-- Open Door and make player walk inside, then close door automatically.
	elseif player.IsEquipped(28912) and player.IsEquipped(28913) and player.IsEquipped(28914) and player.IsEquipped(28915) and player.IsEquipped(28916) then
		-- Open Door and make player walk inside, then close door automatically.
	else
		chatnpc("Hey! You can't come in here! This is a high security military installation!", GUARD_NPC_ID)

		local selected = menu("Yes, but I work here!", "Oh, sorry.", "So who does it belong to?")

		if selected == 0 then
			chatplayer("Yes, but I work here!")
			chatnpc("Well, this is the guards' entrance. I might be new here but I can tell you're not a guard.", GUARD_NPC_ID)
			chatnpc("You're not even wearing proper guards uniform!", GUARD_NPC_ID)
			
			local selected = menu("Oh pleeeaaase let me in!", "So what is this uniform?")

			if selected == 0 then
				chatplayer("Oh pleeeaaase let me in!")
				chatnpc("<p:anger>Go away. You're getting annoying.", GUARD_NPC_ID)
				return
			else
				chatplayer("So what is this uniform?")
				chatnpc("Well you can see me wearing it. It's an iron chainbody and a medium bronze helm.", GUARD_NPC_ID)
				chatplayer("Hmmm... I wonder if I can make that or get some in the local towns....")
				chatnpc("What was that you muttered?", GUARD_NPC_ID)
				chatplayer("Oh, nothing important!")
				return
			end
		elseif selected == 1 then
			chatplayer("Oh, sorry.")
			chatnpc("Don't let it happen again.", GUARD_NPC_ID)
			return
		else
			chatplayer("So who does it belong to?")
			chatnpc("This fortress belongs to the order of Black Knights known as the Kinshra.", GUARD_NPC_ID)
			chatplayer("Oh. Okay, thanks.")
			return
		end
	end
end

RegisterObjectAction("Sturdy Door", 0, onOpenSturdyDoor)

-- Fortress Guards
-------------------------------------------------

local function onGuardTalk()
	if player.IsEquipped(1101) and player.IsEquipped(1139) then
		chatnpc("Hey! Get back on duty!")
		chatplayer("Uh...")
		return
	elseif player.IsEquipped(1165) and player.IsEquipped(1125) and player.IsEquipped(1077) then
		chatnpc("Hey! Get back on duty!")
		chatplayer("Uh...")
		return
	elseif player.IsEquipped(14499) and player.IsEquipped(14497) and player.IsEquipped(14501) then
		chatnpc("Hey! Get back on duty!")
		chatplayer("Uh...")
		return
	elseif player.IsEquipped(14494) and player.IsEquipped(14492) and player.IsEquipped(14490) then
		chatnpc("Hey! Get back on duty!")
		chatplayer("Uh...")
		return
	elseif player.IsEquipped(28912) and player.IsEquipped(28913) and player.IsEquipped(28914) and player.IsEquipped(28915) and player.IsEquipped(28916) then
		chatnpc("Hey! Get back on duty!")
		chatplayer("Uh...")
		return
	else
		chatnpc("Get lost. This is private property.")
		chatplayer("Yes, but I work here!")
		chatnpc("Well, this is the guards' entrance. I might be new here but I can tell you're not a guard.")
		chatnpc("You're not even wearing proper guards uniform!")
		
		local selected = menu("Oh pleeeaaase let me in!", "So what is this uniform?")

		if selected == 0 then
			chatplayer("Oh pleeeaaase let me in!")
			chatnpc("<p:anger>Go away. You're getting annoying.")
			return
		else
			chatplayer("So what is this uniform?")
			chatnpc("Well you can see me wearing it. It's an iron chainbody and a medium bronze helm.")
			chatplayer("Hmmm... I wonder if I can make that or get some in the local towns....")
			chatnpc("What was that you muttered?")
			chatplayer("Oh, nothing important!")
			return
		end
	end
end

RegisterNPCAction("Fortress Guard1", 0, onGuardTalk)
RegisterNPCAction("Fortress Guard2", 0, onGuardTalk)
RegisterNPCAction("Fortress Guard3", 0, onGuardTalk)
RegisterNPCAction("Fortress Guard4", 0, onGuardTalk)
RegisterNPCAction("Fortress Guard5", 0, onGuardTalk)
RegisterNPCAction("Fortress Guard6", 0, onGuardTalk)

-- Meeting Door
-------------------------------------------------

local function onOpenMeetingDoor()
	chatnpc("I wouldn't go in there if I were you. Those Black Knights are in an important meeting. They said they'd kill anyone who went in there!", GUARD_NPC_ID)

	local selected = menu("Okay, I won't.", "I don't care. I'm going in anyway.")

	if selected == 0 then
		chatplayer("Okay, I won't.")
		chatnpc("Wise move.", GUARD_NPC_ID)
	else
		chatplayer("I don't care. I'm going in anyway.")
		-- Open door and walk thru, auto closes.
		return
	end
end

RegisterObjectAction("Door", 0, onOpenMeetingDoor)

-- Grill
-------------------------------------------------

local function onListenGrill()
	-- Play animation of player kneeling

	if player.CheckQuestStep(12) < 1 then
		chatmessage("I can't hear much right now.")
	elseif player.CheckQuestStep(12) == 1 then
		chatnpc("So... how's the secret weapon coming along?", Black_Knight_Captain_ID)
		chatnpc("The invincibility potion is almost ready...", Witch_ID)
		chatnpc("It's taken me FIVE YEARS, but it's almost ready.", Witch_ID)
		chatnpc("Greldo the Goblin here is just going to fetch the last ingredient for me.", Witch_ID)
		chatnpc("It's a specially grown cabbage grown by my cousin Helda who lives in Draynor Manor.", Witch_ID)
		chatnpc("The soil there is slightly magical and it gives the cabbages slight magical properties....", Witch_ID)
		chatnpc("...not to mention the trees!", Witch_ID)
		chatnpc("Now remember Greldo, only a Draynor Manor cabbage will do! Don't get lazy and bring any old cabbage, THAT would ENTIRELY wreck the potion!", Witch_ID)
		chatnpc("Yeth, Mithtreth.", Greldo_ID)
		player.UpdateQuestStep(12, 2)
	else
		chatnpc("It's RUINED! All that work, FIVE years down the drain, who was it! I'll find them and when I do....", Witch_ID)
		chatnpc("Erm.. maybe we can save some of it?", Black_Knight_Captain_ID)
		chatnpc("SAVE some of it? Are you mad!? That cabbage was a normal cabbage, it spoilt the whole thing and now I have to start all over again!", Witch_ID)
		chatnpc("No need to... get upset... you're scaring the cat.", Black_Knight_Captain_ID)
		chatnpc("The CAT? She's not 'THE CAT'!", Witch_ID)
		chatnpc("She's Maemi... aren't you dear....", Witch_ID)
		chatnpc("Purrr....", Black_Cat_ID)
	end

	-- Play animation of player standing up from kneeling
	return
end

RegisterObjectAction("Grill", 0, onListenGrill)

-- Hole
-------------------------------------------------

local function useItemOnHole(item)
	if player.CheckQuestStep(12) < 2 or player.CheckQuestStep(12) > 2 then
		chatplayer("Why exactly would I want to do that?")
		return
	else
		if item.GetId() == 1965 then

			-- Start cutscene
			chatnpc("Where has Greldo got to with that magic cabbage!", Witch_ID)
			chatnpc("What's that noise?", Black_Knight_Captain_ID)
			chatnpc("Hopefully Greldo with the cabbage... yes, look here it co....NOOOOOoooo!", Witch_ID)
			-- Cabbage falling down hole
			-- Effect on top of potion
			chatnpc("My potion!", Witch_ID)
			chatnpc("Oh boy, this doesn't look good!", Black_Knight_Captain_ID)
			chatnpc("Meow!", Black_Cat_ID)

			-- End cutscene

			chatplayer("Looks like my work here is done. Seems like that's successfully sabotaged their little secret weapon plan.")

			player.RemoveItem(1965, 1)
			player.UpdateQuestStep(12, 3)
			return
		elseif item.GetId() == 1967 then
			chatmessage("This is the wrong sort of cabbage!")
			chatplayer("I'm not supposed to be HELPING the witch you know...")
			return
		else
			chatplayer("Why exactly would I want to do that?")
			return
		end
	end
end

RegisterObjectAction("Hole", 1, useItemOnHole)

-- Dossier
-------------------------------------------------

local function onReadDossier()
	-- Animation of player reading dossier
	-- Have 3 countdown to 1 with a timer
	chatmessage("Infiltrate fortress...\nsabotage secret weapon...\nself destruct in 3...")
	-- Effect / Animation of dossier exploding into smoke
	player.RemoveItem(9589, 1)
	return
end

RegisterItemAction(9589, 0, onReadDossier)