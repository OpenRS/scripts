-- Doric's Quest
-- Doric the dwarf is happy to let you use his anvils, but first he would like you to run an errand for him.

local function onNPCTalk(player, npc)
	if (questcompleted(11)) then
		chatnpc("Hello traveller, how is your metalworking coming along?")
		chatplayer("Not too bad, Doric.")
		chatnpc("Good, the love of metal is a thing close to my heart.")
	end
end

RegisterNPCAction("Doric", 0, onNPCTalk)