"Cloud" by "Frank Gevaerts and Nick Sant"

Chapter 1 -- definitions and general things

Section 1 -- shops

a shop is a kind of room.

purchased is a kind of value. a thing has a purchased. The purchased are sold and forsale and nosale. 
The purchased of a thing is normally nosale.
Price is a kind of value. 1 gold piece specifies a price. a thing has a price.

after examining a forsale thing in a shop:
	say "This [noun] costs [price of noun].";

instead of buying something not forsale: say "[The noun] is not for sale."

instead of buying something:
	if the noun is a forsale thing:
		if the player has the wallet:
			if the price of the wallet >= the price of the noun:
				decrease the price of the wallet by the price of the noun;
				now the noun is carried by the player;
				say "You pay [price of noun] for the [noun].";
				now the noun carried by the player is sold;
			otherwise:
				say "You can't afford [noun]. It costs [price of noun].";
		otherwise:
			say "You seem to have lost your wallet.";
	else if the noun is a sold thing:
		say "You already bought [the noun]";

before going in a shop:
	if the player is holding forsale things:
		say "You should buy what you don't own before leaving, or put it back.";
		stop;

[the wallet is a bit special. It has a price, but that's really the content. The player can only pay things if he holds it]
A wallet is a thing. "a wallet with [price of the wallet] in it".
The description of the wallet is "Your wallet has [price of the wallet] in it".
The price of the wallet is 20 gold piece.

Chapter 2 -- the world

Section 1 -- Main area

Park is a room. "You are in a park. There are trees here. 
There's some sort of flowery garden to the east, and a shop to the west."

Rose Garden is a room. "This rose garden is full of roses! Think of the symbolism! The park is to the west.".
rose garden is east of the park

Flower shop is a shop. "They sell flowers here. The exit is to the east.".
The flower shop is west of the park.

a bunch of roses is a thing.
a bunch of lilies is a thing.
The price of a bunch of roses and a bunch of lilies is 1 gold piece.
The bunch of roses and the bunch of lilies are forsale.
The description of the bunch of roses is "A nice bunch of roses.".
The description of the bunch of lilies is "These lilies look a bit faded.".
bunch of roses and bunch of lilies are in the flower shop.


The wallet is in the park.


Romantic Interest is a person.
The printed name of the romantic interest is "a pretty girl".
The description of the romantic interest is "This is [Romantic Interest]. You really like this person!".
Understand "pretty girl" as romantic interest.
Understand "girl" as romantic interest.
Romantic Interest is in the Rose garden.

Instead of giving roses to Romantic Interest in the rose garden:
	Now Romantic Interest is carrying the roses;
	Say "[Romantic Interest] smiles at you and steps closer".

Every turn:
	if the player has been in the rose garden for exactly 2 turns, say "You suddenly hear a booming voice coming from above. It says 'Get on with it!'.";
	if the player has been in the rose garden for exactly 3 turns, say "Don't you know what to do if you meet [Romantic Interest] in a rose garden?".
	
Instead of kissing in the rose garden: 
	if the romantic interest has the bunch of roses:
		award 1 point;
		say "The world seems to be swirling, and for a moment you lose all sense of orientation.";
		say "When you regain your senses, you seem to be comfortably lying on something fluffy and white. You are not alone.";
		move Romantic Interest to the celestial golf course;
		move the player to the celestial golf course;
	otherwise:
		say "[Romantic Interest] turns away.".


Section 2 -- Clouds

The celestial golf course is a room. "The area around you is white and fluffy. You can see a fluffy white thing in the east, and one in the northwest. They seem to have some flags on them. Maybe you should look at them more closely."

The printed name of the celestial golf course is "A fluffy white place.".

Every turn while in the celestial golf course:
	say "[Romantic Interest] is looking at you expectantly.".

fluffy white thing in the east is scenery in The celestial golf course. "In the distance to the east you can see a fluffy white object. There's a small flag on it. The flag has the number '8' written on it in yellow.".
fluffy white thing in the northwest is scenery in The celestial golf course. "In the distance to the northwest you can see a fluffy white object. There's a small flag on it. The flag has the 
number '10' written on it in yellow."

The flagpole is a supporter in the celestial golf course. "There seems to be some sort of pole nearby.".
description of flagpole is "This could well be a flagpole. There seems to be a flag at the top.".
a flag is a container. "There's something on top of the pole.".
description of flag is "This is weird. The flag has a hole in it. Could this be worth examining?".
a hole is a thing.

instead of examining flagpole in the celestial golf course:
	say "This could well be a flagpole. There seems to be a flag at the top.";
	say "[Romantic Interest] seems to be getting a bit impatient.";
	move flag to flagpole.
	
instead of examining flag in the celestial golf course:
	say "The flag seems to have had a yellow number on it, but what mainly strikes you is the hole.";
	say "[Romantic Interest] tugs at your sleeve.";
	move hole to flag.
	
instead of examining hole in the celestial golf course:	
	say "[Romantic Interest] just got up and left.";
	say "You hear someone shouting 'Fore!'.";
	say "Something hits you on the head.";
	end the game in death.
	
Instead of kissing in the celestial golf course:
	award 1 point;
	say "Someone taps you in the shoulder. You look round and see a winged man carrying some sort of stick.";
	say "'Excuse me, sir, but could you get out of the way? I'd like to get on with my putting.'";
	say "[Romantic Interest] screams and runs away.";
	say "You're so shocked that you fall through the fluffy white material.";
	move player to the park.
	
understand "pole" as flagpole.
