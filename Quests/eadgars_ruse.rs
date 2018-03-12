// Eadgar's Ruse
// Start Location: Talk to Sanfew in Taverley

// Sanfew
// --------------------------------------------------

[npc_op1,Sanfew]

if (questcompleted(DruidicRitual) && questcompleted(TrollStronghold)) {
	chatnpc("What can I do for you young 'un?");
	switch(menu("Have you any more work for me, to help reclaim the circle?", "Actually, I don't need to speak to you.")) {
	case 0:
		chatnpc("Have you any more work for me, to help reclaim the circle?");
		if (stat(herblore) < 31) {
			chatnpc("I'm afraid you are not yet learned enough in the art of Herblore to be able to help me, adventurer...");
		} else {

		}
		return;
	case 1:
		jump(Sanfew_Leave);
	}
}

[label, Sanfew_Leave]
	chatplayer("Actually, I don't need to speak to you.");
	chatnpc("Well, we all make mistakes sometimes.");
	return;